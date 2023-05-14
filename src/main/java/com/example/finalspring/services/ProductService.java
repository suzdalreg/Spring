package com.example.finalspring.services;

import com.example.finalspring.models.Category;
import com.example.finalspring.models.Product;
import com.example.finalspring.repositories.ProductRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }
    //Получаем список всех товаров
    public List<Product> getAllProduct(){
        return productRepository.findAll();
    }
    //Товар по id
    public Product getProductId(int id){
        Optional<Product> optionalProduct=productRepository.findById(id);
        return  optionalProduct.orElse(null);
    }

    //Сохраняем товар
    @Transactional
    public void saveProduct(Product product, Category category){
        product.setCategory(category);
        productRepository.save(product);
    }

    //Изменить товар
    @Transactional
    public  void updateProduct(int id, Product product){
        product.setId(id);
        productRepository.save(product);
    }

    //удаление
    @Transactional
    public void deleteProduct(int id){
        productRepository.deleteById(id);
    }
}
