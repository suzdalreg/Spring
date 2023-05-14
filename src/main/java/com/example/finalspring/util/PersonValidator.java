package com.example.finalspring.util;

import com.example.finalspring.models.Person;
import com.example.finalspring.services.PersonService;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class PersonValidator implements Validator {

    private final PersonService personService;

    public PersonValidator(PersonService personService) {
        this.personService = personService;
    }

    //Указываем для какой модели валидатор
    @Override
    public boolean supports(Class<?> clazz) {
        return Person.class.equals(clazz);
    }
    //Сам валидатор
    @Override
    public void validate(Object target, Errors errors) {
        Person person = (Person) target;
        if(personService.findByLogin(person) !=null){
            errors.rejectValue("login", "", "Данный логин уже используется");
        }

    }
}
