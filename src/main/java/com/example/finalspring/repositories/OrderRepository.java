package com.example.finalspring.repositories;

import com.example.finalspring.models.Order;
import com.example.finalspring.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order,Integer> {
    List<Order>findByPerson(Person person);
    @Query(value = "select * from orders where number like %?1", nativeQuery = true)
     List<Order>findOrderByPart0Number(String number);

}
