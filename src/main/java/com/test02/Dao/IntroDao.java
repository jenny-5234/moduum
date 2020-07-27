package com.test02.Dao;

import com.test02.Dto.BoardDto;
import com.test02.Dto.IntroDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("introDao")
public class IntroDao {

    @Autowired
    SqlSession sqlSession;

    private static String namespace = "intro";

    public List<IntroDto> getIntro() throws Exception {
        return sqlSession.selectList(namespace + ".getIntro"); // 전달받은 dto를 매핑 파라미터로 전달
    }



}

