package com.test02.Service;

import com.test02.Dto.BoardDto;
import com.test02.Dto.NoticeDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NoticeService {
    // 게시글 조회
    public List<NoticeDto> getNoticeList(NoticeDto noticeDto);

    public int getNoticeListCnt(NoticeDto noticeDto);

    // 게시글 상세보기
    public NoticeDto pageDetail(int NoticeId) throws Exception;

    // 게시글 작성
    public void insert(NoticeDto noticeDto) throws Exception;

    // 게시글 수정
    public void update(NoticeDto noticeDto) throws  Exception;

    public NoticeDto pageModifyDetail(int NoticeId);

    // 게시글 삭제
    public int delete(int NoticeId);
}
