package com.test02.Dao;

import com.test02.Dto.BoardDto;
import com.test02.Dto.NoticeDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("noticeDao")
public class NoticeDao {

    @Autowired
    SqlSession sqlSession;

    private static String namespace = "notice";

    // 게시글 수 가져오기
    public int getNoticeListCnt(NoticeDto noticeDto) throws Exception {
        return sqlSession.selectOne(namespace + ".getNoticeListCnt", noticeDto);
    }

    // 1. 게시글 목록 가져오기
    public List<NoticeDto> getNoticeList(NoticeDto noticeDto) {
        return sqlSession.selectList(namespace + ".getNoticeList", noticeDto);
    }

    // 2. 게시글 상세보기
    public NoticeDto pageDetail(int NoticeId) throws Exception {
        return sqlSession.selectOne(namespace + ".pageDetail", NoticeId);
    }

    // 3. 조회수 증가
    public void increaseCount(int NoticeId) throws Exception {
        sqlSession.update(namespace + ".increaseCount", NoticeId);
    }
    // 4. 게시글 쓰기
    public void insert(NoticeDto noticeDto) throws Exception {
        sqlSession.insert(namespace + ".insert", noticeDto);
    }
}
