package com.example.finalspring.services;

import com.example.finalspring.models.Person;
import com.example.finalspring.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class PersonService {
    private final PersonRepository personRepository;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public PersonService(PersonRepository personRepository, PasswordEncoder passwordEncoder) {
        this.personRepository = personRepository;
        this.passwordEncoder = passwordEncoder;
    }
    //поиск по логину
    public Person findByLogin(Person person){
        Optional<Person> person_db =personRepository.findByLogin(person.getLogin());
        return person_db.orElse(null);
    }
   //сохраняет пользователя
    @Transactional
    public void register(Person person){
        person.setPassword(passwordEncoder.encode(person.getPassword()));
        person.setRole("ROLE_USER");
        personRepository.save(person);
    }
    //Все пользователи
    public List<Person> findAllUsers() {
        return personRepository.findAll();
    }
    //юзер по id
    public Person findById(int id) {
        Optional<Person> optionalPerson = personRepository.findById(id);
        return optionalPerson.orElse(null);
    }

    //изменение роли юзера
    @Transactional
    public void updatePerson (int id, Person person) {
        person.setId(id);
        personRepository.save(person);
    }


}
