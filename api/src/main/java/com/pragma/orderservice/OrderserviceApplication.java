package com.pragma.orderservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.dynamodb.DynamoDbAsyncClient;
import software.amazon.awssdk.services.sns.SnsAsyncClient;
import software.amazon.awssdk.services.sqs.SqsAsyncClient;

import java.net.URI;
import java.util.Optional;

@SpringBootApplication
@EnableAsync
@EnableConfigurationProperties
public class OrderserviceApplication {

    private final AwsProperties awsProperties;

    public OrderserviceApplication(AwsProperties awsProperties) {
        this.awsProperties = awsProperties;
        validateAwsProperties();
    }

    public static void main(String[] args) {
        SpringApplication.run(OrderserviceApplication.class, args);
    }

    @Bean
    public DynamoDbAsyncClient dynamoDbAsyncClient() {
        return DynamoDbAsyncClient.builder()
                .region(Region.of(awsProperties.region()))
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create(awsProperties.accessKey(), awsProperties.secretKey())
                ))
                .endpointOverride(URI.create(awsProperties.dynamodbEndpoint()))
                .build();
    }

    @Bean
    public SnsAsyncClient snsAsyncClient() {
        return SnsAsyncClient.builder()
                .region(Region.of(awsProperties.region()))
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create(awsProperties.accessKey(), awsProperties.secretKey())
                ))
                .endpointOverride(URI.create(awsProperties.snsEndpoint()))
                .build();
    }

    @Bean
    public SqsAsyncClient sqsAsyncClient() {
        return SqsAsyncClient.builder()
                .region(Region.of(awsProperties.region()))
                .credentialsProvider(StaticCredentialsProvider.create(
                        AwsBasicCredentials.create(awsProperties.accessKey(), awsProperties.secretKey())
                ))
                .endpointOverride(URI.create(awsProperties.sqsEndpoint()))
                .build();
    }

    private void validateAwsProperties() {
        if (awsProperties.region() == null || awsProperties.region().isBlank()) {
            throw new IllegalStateException("AWS region must be configured");
        }
        if (awsProperties.accessKey() == null || awsProperties.accessKey().isBlank()) {
            throw new IllegalStateException("AWS access key must be configured");
        }
        if (awsProperties.secretKey() == null || awsProperties.secretKey().isBlank()) {
            throw new IllegalStateException("AWS secret key must be configured");
        }
        if (awsProperties.dynamodbEndpoint() == null || awsProperties.dynamodbEndpoint().isBlank()) {
            throw new IllegalStateException("DynamoDB endpoint must be configured");
        }
        if (awsProperties.snsEndpoint() == null || awsProperties.snsEndpoint().isBlank()) {
            throw new IllegalStateException("SNS endpoint must be configured");
        }
        if (awsProperties.sqsEndpoint() == null || awsProperties.sqsEndpoint().isBlank()) {
            throw new IllegalStateException("SQS endpoint must be configured");
        }
    }
}

record AwsProperties(
        String region,
        String accessKey,
        String secretKey,
        String dynamodbEndpoint,
        String snsEndpoint,
        String sqsEndpoint
) {}