package com.example.finalspring.config;

import com.example.finalspring.services.PersonDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
public class SecurityConfig {
    private final PersonDetailService personDetailService;

//отключает шифрование паролей
    @Bean
    public PasswordEncoder getPasswordEncode(){
        return new BCryptPasswordEncoder();
    }
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        //настройка работы Spring Security
        //.csrf().disable()//отключаем защиту от межсайтовой подделки запросов
        http
                .authorizeHttpRequests() // указываем что все страницы должны защищены аутентификацией
                .requestMatchers("/admin").hasRole("ADMIN") //страница admin доступка только с ролью admin
                //permitAll допускает не авторезированных пользователей кроме перечисленных
                .requestMatchers("/authentication", "/error", "/registration", "/resources/**", "/static/**", "/css/**","/images/**", "/js/**", "/img/**", "/product", "/product/info/{id}", "/product/search", "/person_account/user/search").permitAll()
                //указываем что  для всех остальных страниц необходимо вызывать метод authenticated с формой если нет в сессии инфы
               // .anyRequest() .authenticated()
                .anyRequest().hasAnyRole("USER", "ADMIN") // все страницы доступны только пользоватедям с этими ролями
                .and()//настройка аутентификации и соединяем ее с настройкой доступа которая выше
                .formLogin().loginPage("/product") //  указываем url для авторизации
                .loginProcessingUrl("/process_login") // обработчик формы в Spring Security
                .defaultSuccessUrl("/person_account",true)//url после авторизации
                .failureUrl("/authentication?error")// url после неудачной аутентификации с выводом сообщеия о неудачи
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/authentication");
        return http.build();

    }

    @Autowired
    public SecurityConfig(PersonDetailService personDetailService) {
        this.personDetailService = personDetailService;
    }
    protected void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(personDetailService)
                .passwordEncoder(getPasswordEncode());
    }
}
