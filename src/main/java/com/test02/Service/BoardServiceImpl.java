package com.test02.Service;

import com.test02.Dao.BoardDao;
import com.test02.Dto.BoardDto;
import com.test02.Dto.Pagination;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardDao boardDao;

    // 게시글 보기
    @SneakyThrows
    @Override
    public List<BoardDto> getBoardList(BoardDto boardDto) {

        return boardDao.getBoardList(boardDto);
    }

    @SneakyThrows
    @Override
    public int getBoardListCnt(BoardDto boardDto) {

        return boardDao.getBoardListCnt(boardDto);
    }

    // 게시글 작성
    @SneakyThrows
    @Override
    public void insert(BoardDto boardDto) {

        boardDao.insert(boardDto);

    }

    // 게시글 상세보기
    @SneakyThrows
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public BoardDto pageDetail(int BoardId) {
        //조회수 증가 메소드
        boardDao.increaseCount(BoardId);
        return boardDao.pageDetail(BoardId);
    }

    // 게시글 수정
    @SneakyThrows
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public BoardDto pageModifyDetail(int BoardId) {
        return boardDao.pageDetail(BoardId);
    }

    @Override
    public void update(BoardDto boardDto) throws Exception {
        boardDao.update(boardDto);
    }

    // 게시글 삭제
    @Override
    public int delete(int BoardId) {
        return boardDao.delete(BoardId);
    }

}


