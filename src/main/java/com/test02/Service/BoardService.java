package com.test02.Service;

import com.test02.Dto.BoardDto;
import com.test02.Dto.Pagination;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service
public interface BoardService {
    // 게시글 조회
    public List<BoardDto> getBoardList(BoardDto boardDto);

    public int getBoardListCnt(BoardDto boardDto);

    // 게시글 작성
    public void insert(BoardDto boardDto) throws Exception;

    // 게시글 상세보기
    public BoardDto pageDetail(int BoardId) throws Exception;

    // 게시글 수정
    public void update(BoardDto boardDto) throws Exception;

    public BoardDto pageModifyDetail(int BoardId);

    // 게시글 삭제
    public int delete(int BoardId);

}

