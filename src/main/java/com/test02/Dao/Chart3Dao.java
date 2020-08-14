package com.test02.Dao;

import com.test02.Dto.Chart3Dto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("Chart3Dao")
public class Chart3Dao {
    @Autowired
    SqlSession sqlSession;

    private static String namespace = "chart3";

    public List<Chart3Dto> getChart3Value(Chart3Dto chart3Dto, String sex) throws Exception{
        return sqlSession.selectList( namespace + ".getChart3Value", sex);
    }

}
