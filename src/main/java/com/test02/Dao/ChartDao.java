package com.test02.Dao;

import com.test02.Dto.Chart2Dto;
import com.test02.Dto.Chart3Dto;
import com.test02.Dto.ChartDto;
import com.test02.Dto.NewsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ChartDao")
public class ChartDao {

    @Autowired
    SqlSession sqlSession;

    private static String namespace = "chart";

    // 넣어둔 예측값 가져오기
    public List<ChartDto> getChartValue(ChartDto chartDto) throws Exception{
        return sqlSession.selectList( namespace + ".getChartValue", chartDto);
    }

    public List<Chart2Dto> getChart2Value(Chart2Dto chart2Dto) throws Exception{
        return sqlSession.selectList( namespace + ".getChart2Value", chart2Dto);
    }

    public List<Chart3Dto> getChart3Value(Chart3Dto chart3Dto, String sex) throws Exception{
        return sqlSession.selectList( namespace + ".getChart3Value", sex);
    }
}
