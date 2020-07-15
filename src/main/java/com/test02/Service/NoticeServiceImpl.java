package com.test02.Service;

import com.test02.Dao.NoticeDao;
import com.test02.Dto.BoardDto;
import com.test02.Dto.NoticeDto;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeDao noticeDao;

    // 게시글 보기
    @Override
    public List<NoticeDto> getNoticeList(NoticeDto noticeDto) {
        return noticeDao.getNoticeList(noticeDto);
    }

    @SneakyThrows
    @Override
    public int getNoticeListCnt(NoticeDto noticeDto) {
        return noticeDao.getNoticeListCnt(noticeDto);
    }

    // 게시글 상세보기
    @Override
    public NoticeDto pageDetail(int NoticeId) throws Exception {
        //조회수 증가 메소드
        noticeDao.increaseCount(NoticeId);
        return noticeDao.pageDetail(NoticeId);
    }

    // 게시글 작성
    @SneakyThrows
    @Override
    public void insert(NoticeDto noticeDto) {
        System.out.println(noticeDto.getFiledata());
        noticeDao.insert(noticeDto);

    }


}
