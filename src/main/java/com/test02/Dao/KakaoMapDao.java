package com.test02.Dao;

import com.test02.Dto.KakaoMapDto;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository("kakaoMapDao")
public class KakaoMapDao {

    @Autowired
    SqlSession sqlSession;

    private static String namespace = "kakaoMap";

    // 게시글 수 가져오기

    public List<KakaoMapDto> selectjson() {
        return sqlSession.selectList(namespace + ".selectjson");
//        return null;
    }
}

