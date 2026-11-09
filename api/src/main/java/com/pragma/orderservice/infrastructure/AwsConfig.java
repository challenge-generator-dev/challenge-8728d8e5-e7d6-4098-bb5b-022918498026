package com.pragma.orderservice.infrastructure;

import java.time.Duration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.dynamodb.DynamoDbAsyncClient;
import software.amazon.awssdk.services.sns.SnsAsyncClient;
import software.amazon.awssdk.services.sqs.SqsAsyncClient;

@Configuration
public class AwsConfig {

    @Value("${AWS_REGION:us-east-1}")
    private String awsRegion;

    @Value("${AWS_ACCESS_KEY_ID:}")
    private String accessKeyId;

    @Value("${AWS_SECRET_ACCESS_KEY:}")
    private String secretAccessKey;

    @Bean
    public SqsAsyncClient sqsAsyncClient() {
        return SqsAsyncClient.builder()
            .region(Region.of(awsRegion))
            .credentialsProvider(buildCredentialsProvider())
            .endpointOverride(getEndpointOverride("sqs"))
            .build();
    }

    @Bean
    public SnsAsyncClient snsAsyncClient() {
        return SnsAsyncClient.builder()
            .region(Region.of(awsRegion))
            .credentialsProvider(buildCredentialsProvider())
            .endpointOverride(getEndpointOverride("sns"))
            .build();
    }

    @Bean
    public DynamoDbAsyncClient dynamoDbAsyncClient() {
        return DynamoDbAsyncClient.builder()
            .region(Region.of(awsRegion))
            .credentialsProvider(buildCredentialsProvider())
            .endpointOverride(getEndpointOverride("dynamodb"))
            .build();
    }

    private software.amazon.awssdk.auth.credentials.AwsCredentialsProvider buildCredentialsProvider() {
        if (accessKeyId != null && !accessKeyId.isBlank() && secretAccessKey != null && !secretAccessKey.isBlank()) {
            return StaticCredentialsProvider.create(
                AwsBasicCredentials.create(accessKeyId, secretAccessKey)
            );
        }
        return DefaultCredentialsProvider.create();
    }

    private java.net.URI getEndpointOverride(String service) {
        String localStackHost = System.getenv("LOCALSTACK_HOST");
        if (localStackHost != null && !localStackHost.isBlank()) {
            String port = System.getenv("LOCALSTACK_EDGE_PORT");
            String portValue = (port != null && !port.isBlank()) ? port : "4566";
            return java.net.URI.create(String.format("http://%s:%s", localStackHost, portValue));
        }
        return null;
    }

    @Bean
    public SqsProducerService sqsProducerService(SqsAsyncClient sqsAsyncClient) {
        return new SqsProducerService(sqsAsyncClient);
    }

    @Bean
    public SnsProducerService snsProducerService(SnsAsyncClient snsAsyncClient) {
        return new SnsProducerService(snsAsyncClient);
    }

    public static class SqsProducerService {
        private final SqsAsyncClient sqsClient;

        public SqsProducerService(SqsAsyncClient sqsClient) {
            this.sqsClient = sqsClient;
        }

        public void sendMessage(String queueUrl, String messageBody) {
            software.amazon.awssdk.services.sqs.model.SendMessageRequest request =
                software.amazon.awssdk.services.sqs.model.SendMessageRequest.builder()
                    .queueUrl(queueUrl)
                    .messageBody(messageBody)
                    .delaySeconds(Duration.ofSeconds(0))
                    .build();

            sqsClient.sendMessage(request);
        }
    }

    public static class SnsProducerService {
        private final SnsAsyncClient snsClient;

        public SnsProducerService(SnsAsyncClient snsClient) {
            this.snsClient = snsClient;
        }

        public void publish(String topicArn, String message) {
            software.amazon.awssdk.services.sns.model.PublishRequest request =
                software.amazon.awssdk.services.sns.model.PublishRequest.builder()
                    .topicArn(topicArn)
                    .message(message)
                    .build();

            snsClient.publish(request);
        }
    }
}