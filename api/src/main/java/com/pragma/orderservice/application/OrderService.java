package com.pragma.orderservice.application;

import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.OrderRepository;
import com.pragma.orderservice.domain.Order.OrderItem;
import com.pragma.orderservice.domain.Order.OrderStatus;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public Order createOrder(UUID customerId, List<OrderItem> items) {
        if (customerId == null) {
            throw new IllegalArgumentException("El ID del cliente no puede ser nulo");
        }
        if (items == null || items.isEmpty()) {
            throw new IllegalArgumentException("La orden debe contener al menos un item");
        }

        Order order = new Order(customerId, new ArrayList<>(items));
        order.setStatus(OrderStatus.PENDING);
        order.setOrderDate(LocalDateTime.now());

        return orderRepository.save(order);
    }

    public Optional<Order> getOrderById(UUID orderId) {
        if (orderId == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        return orderRepository.findById(orderId);
    }

    public Order updateOrder(UUID orderId, UUID customerId, List<OrderItem> items, OrderStatus status) {
        if (orderId == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> existingOrder = orderRepository.findById(orderId);
        if (existingOrder.isEmpty()) {
            throw new OrderNotFoundException("Orden no encontrada con ID: " + orderId);
        }

        Order order = existingOrder.get();
        if (customerId != null) {
            order.setCustomerId(customerId);
        }
        if (items != null && !items.isEmpty()) {
            order.setItems(new ArrayList<>(items));
        }
        if (status != null) {
            order.setStatus(status);
        }

        return orderRepository.save(order);
    }

    public void deleteOrder(UUID orderId) {
        if (orderId == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> existingOrder = orderRepository.findById(orderId);
        if (existingOrder.isEmpty()) {
            throw new OrderNotFoundException("Orden no encontrada con ID: " + orderId);
        }

        orderRepository.deleteById(orderId);
    }

    public BigDecimal calculateOrderTotal(UUID orderId) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isEmpty()) {
            throw new OrderNotFoundException("Orden no encontrada con ID: " + orderId);
        }
        return orderOpt.get().getTotalAmount();
    }

    public static class OrderNotFoundException extends RuntimeException {
        public OrderNotFoundException(String message) {
            super(message);
        }
    }
}