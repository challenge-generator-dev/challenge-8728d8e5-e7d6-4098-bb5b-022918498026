package com.pragma.orderservice.infrastructure;


import com.pragma.orderservice.application.OrderNotFoundException;
import com.pragma.orderservice.application.OrderService;
import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.Order.OrderItem;
import com.pragma.orderservice.domain.Order.OrderStatus;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponseDTO> createOrder(@RequestBody OrderRequestDTO request) {
        try {
            List<OrderItem> items = request.items().stream()
                .map(itemDto -> new OrderItem(
                    itemDto.productId(),
                    itemDto.productName(),
                    itemDto.quantity(),
                    itemDto.unitPrice()
                ))
                .toList();

            Order createdOrder = orderService.createOrder(request.customerId(), items);
            return ResponseEntity.status(HttpStatus.CREATED).body(toResponseDTO(createdOrder));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> getOrder(@PathVariable UUID id) {
        return orderService.getOrderById(id)
            .map(order -> ResponseEntity.ok(toResponseDTO(order)))
            .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> updateOrder(
            @PathVariable UUID id,
            @RequestBody OrderRequestDTO request) {
        try {
            List<OrderItem> items = request.items() != null ? request.items().stream()
                .map(itemDto -> new OrderItem(
                    itemDto.productId(),
                    itemDto.productName(),
                    itemDto.quantity(),
                    itemDto.unitPrice()
                ))
                .toList() : null;

            OrderStatus status = request.status() != null ?
                OrderStatus.valueOf(request.status()) : null;

            Order updatedOrder = orderService.updateOrder(id, request.customerId(), items, status);
            return ResponseEntity.ok(toResponseDTO(updatedOrder));
        } catch (OrderService.OrderNotFoundException e) {
            return ResponseEntity.notFound().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable UUID id) {
        try {
            orderService.deleteOrder(id);
            return ResponseEntity.noContent().build();
        } catch (OrderService.OrderNotFoundException e) {
            return ResponseEntity.notFound().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    private OrderResponseDTO toResponseDTO(Order order) {
        return new OrderResponseDTO(
            order.getId(),
            order.getCustomerId(),
            order.getItems().stream()
                .map(item -> new OrderItemDTO(
                    item.getProductId(),
                    item.getProductName(),
                    item.getQuantity(),
                    item.getUnitPrice()
                ))
                .toList(),
            order.getStatus().name(),
            order.getOrderDate(),
            order.getTotalAmount()
        );
    }

    public record OrderRequestDTO(
        UUID customerId,
        List<OrderItemDTO> items,
        String status
    ) {}

    public record OrderItemDTO(
        UUID productId,
        String productName,
        int quantity,
        BigDecimal unitPrice
    ) {}

    public record OrderResponseDTO(
        UUID id,
        UUID customerId,
        List<OrderItemDTO> items,
        String status,
        java.time.LocalDateTime orderDate,
        BigDecimal totalAmount
    ) {}

    @org.springframework.web.bind.annotation.ControllerAdvice
    public static class GlobalExceptionHandler {

        @org.springframework.web.bind.annotation.ExceptionHandler(OrderService.OrderNotFoundException.class)
        public ResponseEntity<String> handleOrderNotFound(OrderService.OrderNotFoundException ex) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage());
        }

        @org.springframework.web.bind.annotation.ExceptionHandler(IllegalArgumentException.class)
        public ResponseEntity<String> handleIllegalArgument(IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
    }
}