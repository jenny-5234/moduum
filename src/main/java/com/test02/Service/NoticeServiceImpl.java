package com.test02.Service;

import com.test02.Dao.NoticeDao;
import com.test02.Dto.BoardDto;
import com.test02.Dto.NoticeDto;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

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
    @SneakyThrows
    @Override
    public NoticeDto pageDetail(int NoticeId){
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

    // 게시글 수정
    @SneakyThrows
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public NoticeDto pageModifyDetail(int NoticeId) {
        return noticeDao.pageDetail(NoticeId);
    }

    @Override
    public void update(NoticeDto noticeDto) throws Exception {
        noticeDao.update(noticeDto);
    }

    // 게시글 삭제
    @SneakyThrows
    @Override
    public int delete(int NoticeId) {
        return noticeDao.delete(NoticeId);
    }

    /*@SneakyThrows
    @Override
    public List<BoardDto> getSearchList_Title(NoticeDto noticeDto, String keyWord){
        return noticeDao.getSearchList_Title(noticeDto, keyWord);
    }

    @SneakyThrows
    @Override
    public List<BoardDto> getSearchList_Writer(NoticeDto noticeDto, String keyWord) {
        return noticeDao.getSearchList_Writer(noticeDto, keyWord);
    }*/


}
