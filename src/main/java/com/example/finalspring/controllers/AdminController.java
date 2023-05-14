package com.example.finalspring.controllers;

import com.example.finalspring.enumm.RoleUser;
import com.example.finalspring.enumm.Status;
import com.example.finalspring.models.*;
import com.example.finalspring.repositories.CategoryRepository;
import com.example.finalspring.repositories.OrderRepository;
import com.example.finalspring.services.OrderService;
import com.example.finalspring.services.PersonService;
import com.example.finalspring.services.ProductService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Role;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class AdminController {

    private final ProductService productService;
    private  final OrderService orderService;
    private final OrderRepository orderRepository;
    private final PersonService personService;


    @Value("${upload.path}")
    private String uploadPath;
    private final CategoryRepository categoryRepository;
    public AdminController(ProductService productService, OrderService orderService, OrderRepository orderRepository, PersonService personService, CategoryRepository categoryRepository) {
        this.productService = productService;
        this.orderService = orderService;
        this.orderRepository = orderRepository;
        this.personService = personService;
        this.categoryRepository = categoryRepository;
    }
    @GetMapping("admin/product/add")
    public String addProduct(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("category",categoryRepository.findAll());
        return "product/addProduct";
    }
    @PostMapping("/admin/product/add")
    public String addProduct(@ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @RequestParam("file_one")MultipartFile file_one,@RequestParam("file_two")MultipartFile file_two,@RequestParam("file_three")MultipartFile file_three,@RequestParam("file_four")MultipartFile file_four,@RequestParam("file_five")MultipartFile file_five, @RequestParam("category") int category, Model model) throws IOException {
       Category category_db = (Category) categoryRepository.findById(category).orElseThrow();
       if (bindingResult.hasErrors()){
           model.addAttribute("category", categoryRepository.findAll());
           return "product/addProduct";
       }
       if (file_one != null){
           File uploadDir = new File(uploadPath);
           if (!uploadDir.exists()){
               uploadDir.mkdir();
           }
           String uuidFile = UUID.randomUUID().toString();
           String resultFileName = uuidFile +"." +file_one.getOriginalFilename();
           file_one.transferTo(new File(uploadPath + "/" + resultFileName));
           Image image =new Image();
           image.setProduct(product);
           image.setFileName(resultFileName);
           product.addImageToProduct(image);
       }
        if (file_two != null){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile +"." +file_two.getOriginalFilename();
            file_two.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image =new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        if (file_three != null){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile +"." +file_three.getOriginalFilename();
            file_three.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image =new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        if (file_four != null){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile +"." +file_four.getOriginalFilename();
            file_four.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image =new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        if (file_five != null){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile +"." +file_five.getOriginalFilename();
            file_five.transferTo(new File(uploadPath + "/" + resultFileName));
            Image image =new Image();
            image.setProduct(product);
            image.setFileName(resultFileName);
            product.addImageToProduct(image);
        }
        productService.saveProduct(product,category_db);

       return  "redirect:/admin";
    }

    @GetMapping("/admin")
    public String admin(Model model){
       model.addAttribute("products",productService.getAllProduct());
       return "admin";
    }

    @GetMapping("admin/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id){
        productService.deleteProduct(id);
        return  "redirect:/admin";
    }

    @GetMapping("admin/product/edit/{id}")
    public String editProduct(Model model, @PathVariable("id") int id){
        model.addAttribute("product", productService.getProductId(id));
        model.addAttribute("category",categoryRepository.findAll());
        return "product/editProduct";
    }

    @PostMapping("admin/product/edit/{id}")
    public String editProduct(@ModelAttribute("product")@Valid Product product, BindingResult bindingResult,@PathVariable("id") int id, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("category",categoryRepository.findAll());
            return"product/editProduct";
        }
        productService.updateProduct(id, product);
        return  "redirect:/admin";
    }
    //Все заказы для админа
    @GetMapping("/admin/ordersAdmin")
    public String showAllOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("status", Status.values());
        return "ordersAll";
    }
    // вывод конкретного заказа по ID
    @GetMapping("/admin/order/{id}")
    public String orderInfo(@PathVariable("id") int id, Model model) {
        model.addAttribute("order", orderService.getOrderById(id));
        model.addAttribute("status", Status.values());
        return "orderId";
    }
    //Смена статуса заказа
    @PostMapping("/admin/order/{id}")
    public String ChangeOrderStatus(@ModelAttribute("status") Status status, @PathVariable("id") int id)
    {
        Order order = orderService.getOrderById(id);
        order.setStatus(status);
        orderService.updateOrder(id, order);
        return "redirect:/admin/ordersAdmin";
    }
    //Поиск заказа
    @PostMapping("/admin/search")
    public String orderSearch(@RequestParam("search") String search, Model model){
        //кладем в модель все заказы
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("search_order", orderRepository.findOrderByPart0Number(search));
        //Кладём в модель обратно полученные значения с формы для того, чтобы после отправки формы (произойдёт перезагрузка
        // страницы) отправить в инпут ранее введённое значение
        model.addAttribute("value_search", search);
        return "/ordersAll";
    }

    //Все пользователи
    @GetMapping("/admin/userAll")
    public String showAllUsers(Model model) {
        model.addAttribute("users", personService.findAllUsers());
        model.addAttribute("role", RoleUser.values());
        return "userAll";
    }
    //User по ID
    @GetMapping("/admin/user/{id}")
    public String userInfo(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", personService.findById(id));
        model.addAttribute("role", RoleUser.values());
        return "userId";
    }
    //Меняем роль
    @PostMapping("/admin/user/{id}")
    public String setUserRole (@ModelAttribute("role") String role, @PathVariable("id") int id){
        Person person = personService.findById(id);
        person.setRole(role);
        personService.updatePerson(id, person);
        return "redirect:/admin/user/{id}";
    }


}
