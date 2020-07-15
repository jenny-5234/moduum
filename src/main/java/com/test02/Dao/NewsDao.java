package com.test02.Dao;

import com.test02.Dto.NewsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("newsDao")
public class NewsDao {

    @Autowired
    SqlSession sqlSession;

    private static String namespace = "news";

    // 뉴스 수 가져오기
    public int getNewsListCnt(NewsDto newsDto) throws Exception{
        return sqlSession.selectOne(namespace + ".getNewsListCnt", newsDto);
    }

    // 1. 뉴스 목록 가져오기
    public List<NewsDto> getNewsList(NewsDto newsDto) throws Exception{
        // newsDto에 startIndex가 잘 담겨있는가 확인
        return sqlSession.selectList(namespace + ".selectNews", newsDto);
    }

    // 2. 뉴스 상세보기
    public NewsDto newsDetail(int newsId) throws Exception{
        return sqlSession.selectOne(namespace + ".newsDetail", newsId);
    }
}
