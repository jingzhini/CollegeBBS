package com.example.demo2.dao;

import com.example.demo2.entity.Topic;

import java.util.List;

public interface TopicDao {

    //查询topic所有
    List<Topic> selTopicAll();
    //插入发表的文章
    int addTopic(Topic topic);
    //获取选定的topic项的详细信息
    Topic selView(int topidId);
}
