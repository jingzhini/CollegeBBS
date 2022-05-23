package com.example.demo2.dao;

import com.example.demo2.entity.Board;
import com.example.demo2.entity.Topic;
import com.example.demo2.entity.User;

import java.util.List;

public interface UserDao {
    //注册
    int addUser(User user);
    //登录
    User selOne(String uName);

}
