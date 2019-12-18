package com.nn.service.imp;

import com.nn.mapper.UserMapper;
import com.nn.pojo.User;
import com.nn.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userServiceImp")
public class UserServiceImp implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public List<User> queryAll() {
        return userMapper.queryAll();
    }
}
