package com.nn.service;

import com.nn.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    public List<User> queryAll();
}
