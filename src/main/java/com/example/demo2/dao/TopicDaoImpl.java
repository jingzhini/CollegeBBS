package com.example.demo2.dao;

import com.example.demo2.entity.Topic;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("topicDao")
public class TopicDaoImpl implements TopicDao{
    //查询topic所有
    @Override
    public List<Topic> selTopicAll() {
        List<Topic> topicList=BaseDao.getSqlSession().selectList("selTopicAll");
        return topicList;
    }
    //插入发表的文章
    @Override
    public int addTopic(Topic topic) {
        int i=BaseDao.getSqlSession().insert("addTopic",topic);
        return i;
    }
    //获取选定的topic项的详细信息
    @Override
    public Topic selView(int topidId) {
        Topic topicView=BaseDao.getSqlSession().selectOne("selView",topidId);
        return topicView;
    }

}
