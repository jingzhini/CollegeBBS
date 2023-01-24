package com.example.demo2.dao;

import com.example.demo2.entity.User;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    //注册
    @Override
    public int addUser(User user) {
        int i = BaseDao.getSqlSession().insert("addUser", user);
        return i;
    }
    //登录
    @Override
    public User selOne(String uName) {
        User user=BaseDao.getSqlSession().selectOne("selOne",uName);
        return user;
    }

}
