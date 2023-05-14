//package com.example.finalspring.security;
////класс для сравнение даныый аутентификации и передачи данный в класс SecurityConfig
//
//import com.example.finalspring.services.PersonDetailService;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.stereotype.Component;
//
//import java.util.Collections;
//
//@Component
//public class AuthenticationProvider  implements org.springframework.security.authentication.AuthenticationProvider {
//    private final PersonDetailService personDetailService;
//
//    public AuthenticationProvider(PersonDetailService personDetailService) {
//        this.personDetailService = personDetailService;
//    }
//
//    @Override
//    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//        //Получаем логин с формы, здесь спринг секъюрити сам создаст объект формы и передаст его в объект authentication
//        String login = authentication.getName();
//
//        UserDetails person = personDetailService.loadUserByUsername(login);
//
//        String password = authentication.getCredentials().toString();
//        if(!password.equals(person.getPassword())){
//            throw  new BadCredentialsException("Не корректный пароль");
//        }
//        return new UsernamePasswordAuthenticationToken(person,password, Collections.emptyList());
//    }
//
//    @Override
//    public boolean supports(Class<?> authentication) {
//        return true;
//    }
//}
