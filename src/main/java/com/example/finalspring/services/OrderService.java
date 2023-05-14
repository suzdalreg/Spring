package com.example.finalspring.services;

import com.example.finalspring.repositories.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.finalspring.models.Order;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class OrderService {
    public final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }
    public List<Order> getAllOrders(){
        return orderRepository.findAll();
    }
    public Order getOrderById(int id){
        Optional<Order> optionalOrder=orderRepository.findById(id);
        return optionalOrder.orElse(null);
    }
    //меняем статус
    @Transactional
    public void updateOrder (int id, Order order) {
        order.setId(id);
        orderRepository.save(order);
    }
}
