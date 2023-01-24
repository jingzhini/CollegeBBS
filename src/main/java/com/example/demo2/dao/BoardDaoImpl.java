package com.example.demo2.dao;

import com.example.demo2.entity.Board;

import java.util.List;

public class BoardDaoImpl implements BoardDao{
    //查询board所有
    @Override
    public List<Board> selBoardAll() {
        List<Board> boardList=BaseDao.getSqlSession().selectList("selBoardAll");
        return boardList;
    }
}
