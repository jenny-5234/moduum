package com.test02.Dao;

import com.test02.Dto.Chart2Dto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("Chart2Dao")
public class Chart2Dao {
    @Autowired
    SqlSession sqlSession;

    private static String namespace = "chart2";

    // 넣어둔 예측값 가져오기
    public List<Chart2Dto> getChart2Value(Chart2Dto chart2Dto) throws Exception{
        return sqlSession.selectList( namespace + ".getChart2Value", chart2Dto);
    }
}
