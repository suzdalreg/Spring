package com.example.finalspring.repositories;

import com.example.finalspring.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
     com.example.finalspring.models.Category findByName(String name);
}
