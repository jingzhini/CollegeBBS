package com.example.demo2.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("baseDao")
public class BaseDao {
    private static SqlSessionTemplate sqlSession;

    public static SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    @Autowired
    public void setSqlSession(SqlSessionTemplate sqlSession) {
        BaseDao.sqlSession = sqlSession;
    }
}
