package com.nn.controller;

import com.nn.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class UserController {

    @Resource(name = "userServiceImp")
    private UserService userService;

    @RequestMapping("queryAll")
    public Object queryAll(){
        return userService.queryAll();
    }
}
