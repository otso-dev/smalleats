package com.smalleats.config;

import com.smalleats.jwt.TokenProvider;
import com.smalleats.security.AuthEntryPoint;
import com.smalleats.security.AuthenticationFilter;
import com.smalleats.service.AuthenticationService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.Filter;

@Configuration
@EnableWebSecurity
@EnableWebMvc
@ComponentScan(basePackages = "com.smalleats")
@RequiredArgsConstructor
public class SecurityConfig  extends WebSecurityConfigurerAdapter {
    private final TokenProvider tokenProvider;
    private final AuthEntryPoint authEntryPoint;
    private final AuthenticationService authenticationService;
    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.userDetailsService(authenticationService);
        http.httpBasic().disable();
        http.formLogin().disable();
        http.cors();
        http.csrf().disable();
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        http.authorizeRequests()
                .antMatchers("/auth/**","/").permitAll()
                .antMatchers("/product/**").permitAll()
                .antMatchers("/user/**").hasRole("USER")
                .antMatchers("/partner/**").hasRole("PARTNER")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest()
                .authenticated()
                .and()
                .addFilterBefore(new AuthenticationFilter(tokenProvider),UsernamePasswordAuthenticationFilter.class)
                .exceptionHandling()
                .authenticationEntryPoint(authEntryPoint);
    }
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**")
                .antMatchers("/favicon.ico");
    }
}