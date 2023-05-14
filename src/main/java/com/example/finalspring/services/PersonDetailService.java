package com.example.finalspring.services;

import com.example.finalspring.models.Person;
import com.example.finalspring.repositories.PersonRepository;
import com.example.finalspring.security.PersonDetails;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PersonDetailService implements UserDetailsService {
    private final PersonRepository personRepository;

    public PersonDetailService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //Пллучаем пользователя из базы по логину с формы
        Optional<Person> person = personRepository.findByLogin(username);
        // Если пользователя нет
        if (person.isEmpty()){
            throw new UsernameNotFoundException("Пользователь не найден");
        }
        return new PersonDetails(person.get());
    }
}
