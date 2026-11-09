package com.pragma.orderservice.application;

import com.pragma.orderservice.domain.Order;
import com.pragma.orderservice.domain.Order.OrderItem;
import com.pragma.orderservice.domain.Order.OrderStatus;
import com.pragma.orderservice.domain.OrderRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class OrderServiceTest {

    @Mock
    private OrderRepository orderRepository;

    @InjectMocks
    private OrderService orderService;

    private Order testOrder;
    private UUID orderId;
    private UUID customerId;

    @BeforeEach
    void setUp() {
        orderId = UUID.randomUUID();
        customerId = UUID.randomUUID();
        
        List<OrderItem> items = new ArrayList<>();
        OrderItem item = new OrderItem();
        item.setId(UUID.randomUUID());
        item.setProductId(UUID.randomUUID());
        item.setQuantity(2);
        item.setUnitPrice(new BigDecimal("25.00"));
        item.setSubtotal(new BigDecimal("50.00"));
        items.add(item);
        
        testOrder = new Order(customerId, items);
        testOrder.setId(orderId);
        testOrder.setStatus(OrderStatus.PENDING);
        testOrder.setOrderDate(LocalDateTime.now());
    }

    @Test
    void createOrder_ShouldReturnOrder_WhenValidOrderProvided() {
        when(orderRepository.save(any(Order.class))).thenReturn(testOrder);

        Order result = orderService.createOrder(testOrder);

        assertNotNull(result);
        assertEquals(orderId, result.getId());
        assertEquals(customerId, result.getCustomerId());
        assertEquals(OrderStatus.PENDING, result.getStatus());
        verify(orderRepository, times(1)).save(any(Order.class));
    }

    @Test
    void createOrder_ShouldThrowException_WhenOrderIsNull() {
        assertThrows(IllegalArgumentException.class, () -> orderService.createOrder(null));
        verify(orderRepository, never()).save(any(Order.class));
    }

    @Test
    void getOrder_ShouldReturnOrder_WhenOrderExists() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));

        Optional<Order> result = orderService.getOrder(orderId);

        assertTrue(result.isPresent());
        assertEquals(orderId, result.get().getId());
        verify(orderRepository, times(1)).findById(orderId);
    }

    @Test
    void getOrder_ShouldReturnEmpty_WhenOrderDoesNotExist() {
        UUID nonExistentId = UUID.randomUUID();
        when(orderRepository.findById(nonExistentId)).thenReturn(Optional.empty());

        Optional<Order> result = orderService.getOrder(nonExistentId);

        assertFalse(result.isPresent());
        verify(orderRepository, times(1)).findById(nonExistentId);
    }

    @Test
    void updateOrder_ShouldUpdateOrder_WhenOrderExists() {
        Order updatedOrder = new Order(customerId, testOrder.getItems());
        updatedOrder.setId(orderId);
        updatedOrder.setStatus(OrderStatus.CONFIRMED);
        updatedOrder.setOrderDate(LocalDateTime.now());
        
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));
        when(orderRepository.save(any(Order.class))).thenReturn(updatedOrder);

        Order result = orderService.updateOrder(orderId, updatedOrder);

        assertNotNull(result);
        assertEquals(OrderStatus.CONFIRMED, result.getStatus());
        verify(orderRepository, times(1)).findById(orderId);
        verify(orderRepository, times(1)).save(any(Order.class));
    }

    @Test
    void updateOrder_ShouldThrowException_WhenOrderNotFound() {
        UUID nonExistentId = UUID.randomUUID();
        when(orderRepository.findById(nonExistentId)).thenReturn(Optional.empty());

        assertThrows(RuntimeException.class, () -> orderService.updateOrder(nonExistentId, testOrder));
        verify(orderRepository, times(1)).findById(nonExistentId);
        verify(orderRepository, never()).save(any(Order.class));
    }

    @Test
    void deleteOrder_ShouldCallRepository_WhenOrderExists() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));
        doNothing().when(orderRepository).deleteById(orderId);

        orderService.deleteOrder(orderId);

        verify(orderRepository, times(1)).findById(orderId);
        verify(orderRepository, times(1)).deleteById(orderId);
    }

    @Test
    void deleteOrder_ShouldThrowException_WhenOrderNotFound() {
        UUID nonExistentId = UUID.randomUUID();
        when(orderRepository.findById(nonExistentId)).thenReturn(Optional.empty());

        assertThrows(RuntimeException.class, () -> orderService.deleteOrder(nonExistentId));
        verify(orderRepository, times(1)).findById(nonExistentId);
        verify(orderRepository, never()).deleteById(any(UUID.class));
    }

    @Test
    void createOrder_ShouldCalculateTotalAmount() {
        List<OrderItem> items = new ArrayList<>();
        
        OrderItem item1 = new OrderItem();
        item1.setId(UUID.randomUUID());
        item1.setProductId(UUID.randomUUID());
        item1.setQuantity(3);
        item1.setUnitPrice(new BigDecimal("10.00"));
        item1.setSubtotal(new BigDecimal("30.00"));
        items.add(item1);
        
        OrderItem item2 = new OrderItem();
        item2.setId(UUID.randomUUID());
        item2.setProductId(UUID.randomUUID());
        item2.setQuantity(2);
        item2.setUnitPrice(new BigDecimal("15.00"));
        item2.setSubtotal(new BigDecimal("30.00"));
        items.add(item2);
        
        Order orderWithItems = new Order(customerId, items);
        
        when(orderRepository.save(any(Order.class))).thenAnswer(invocation -> {
            Order savedOrder = invocation.getArgument(0);
            return savedOrder;
        });

        Order result = orderService.createOrder(orderWithItems);

        assertNotNull(result);
        assertEquals(new BigDecimal("60.00"), result.getTotalAmount());
    }

    @Test
    void getOrder_ShouldReturnOrderWithItems_WhenOrderHasItems() {
        when(orderRepository.findById(orderId)).thenReturn(Optional.of(testOrder));

        Optional<Order> result = orderService.getOrder(orderId);

        assertTrue(result.isPresent());
        assertNotNull(result.get().getItems());
        assertFalse(result.get().getItems().isEmpty());
        assertEquals(1, result.get().getItems().size());
    }
}