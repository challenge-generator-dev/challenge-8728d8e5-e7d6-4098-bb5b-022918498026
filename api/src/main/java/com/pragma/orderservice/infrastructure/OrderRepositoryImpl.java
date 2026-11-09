package com.pragma.orderservice.infrastructure;

import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.OrderRepository;
import com.pragma.orderservice.infrastructure.persistence.OrderEntity;
import com.pragma.orderservice.infrastructure.persistence.OrderRepositoryJpa;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public class OrderRepositoryImpl implements OrderRepository {

    private final OrderRepositoryJpa orderRepositoryJpa;

    public OrderRepositoryImpl(OrderRepositoryJpa orderRepositoryJpa) {
        this.orderRepositoryJpa = orderRepositoryJpa;
    }

    @Override
    public Order save(Order order) {
        OrderEntity entity = OrderEntity.fromDomain(order);
        OrderEntity savedEntity = orderRepositoryJpa.save(entity);
        return savedEntity.toDomain();
    }

    @Override
    public Optional<Order> findById(UUID id) {
        return orderRepositoryJpa.findById(id).map(OrderEntity::toDomain);
    }

    @Override
    public void deleteById(UUID id) {
        orderRepositoryJpa.deleteById(id);
    }
}