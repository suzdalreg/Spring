package com.example.finalspring.security;

import com.example.finalspring.models.Person;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.switchuser.SwitchUserGrantedAuthority;

import java.util.Collection;
import java.util.Collections;

public class PersonDetails implements UserDetails {
    private final Person person;

    public PersonDetails(Person person) {
        this.person = person;
    }

    public Person getPerson(){
        return this.person;
    }

    //возвращает роль текущего пользователя
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(new SimpleGrantedAuthority(person.getRole()));
    }

    @Override
    public String getPassword() {
        return this.person.getPassword();
    }

    @Override
    public String getUsername() {
        return this.person.getLogin();
    }
    // Акк дествителен
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
    //Акк не заблочен
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
    //Пароль действителен
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
   //Акк активен
    @Override
    public boolean isEnabled() {
        return true;
    }
}
