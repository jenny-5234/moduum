package com.test02.Dao;

import com.test02.Dto.BoardDto;
import com.test02.Dto.Pagination;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("boardDao")
public class BoardDao {

    @Autowired
    SqlSession sqlSession;

    private static String namespace = "board";

    // 게시글 수 가져오기
    public int getBoardListCnt(BoardDto boardDto) throws Exception{
        return sqlSession.selectOne(  namespace + ".getBoardListCnt",boardDto);
    }

    // 1. 게시글 목록 가져오기
    public List<BoardDto> getBoardList(BoardDto boardDto) throws Exception {
        //  boardDto 에 startIndex가 잘 담겨 있는가 확인
        return sqlSession.selectList(namespace + ".selectBoard", boardDto); // 전달받은 dto를 매핑 파라미터로 전달
    }

    // 2. 게시글 쓰기
    public void insert(BoardDto boardDto) throws Exception {
        sqlSession.insert(namespace + ".insert", boardDto);
    }

    // 3. 게시글 상세보기
    public BoardDto pageDetail(int BoardId) throws Exception {
        return sqlSession.selectOne(namespace + ".pageDetail", BoardId);
    }

    // 4. 게시글 수정
    public void update(BoardDto boardDto) throws Exception {
        sqlSession.update(namespace + ".update", boardDto);
    }

    // 5. 조회수 증가
    public void increaseCount(int BoardId) throws Exception {
        sqlSession.update(namespace + ".increaseCount", BoardId);
    }

    // 6. 게시글 삭제
    public int delete(int BoardId) {
        sqlSession.delete(namespace + ".delete", BoardId);
        return BoardId;
    }

}

