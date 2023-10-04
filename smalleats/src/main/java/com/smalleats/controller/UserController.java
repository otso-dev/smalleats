package com.smalleats.controller;

import com.smalleats.DTO.user.LoginReqDto;
import com.smalleats.DTO.user.SignupReqDto;
import com.smalleats.service.AuthenticationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class UserController {
    private final AuthenticationService authenticationService;

    @RequestMapping(value = "/smalleats/register", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> userRegister(SignupReqDto signupReqDto){
        authenticationService.checkDuplicatedEmail(signupReqDto.getEmail());
        authenticationService.saveUser(signupReqDto);
        return ResponseEntity.ok(true);
    }

    @RequestMapping(value = "/smalleats/login", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> userLogin(@RequestBody LoginReqDto loginReqDto){
        return ResponseEntity.ok(authenticationService.login(loginReqDto));
    }
}