package com.test02.Service;


import com.test02.Dao.NewsDao;
import com.test02.Dto.NewsDto;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService{

    @Autowired
    NewsDao newsDao;

    // 게시글 보기
    @SneakyThrows
    @Override
    public List<NewsDto> getNewsList(NewsDto newsDto) {
        return newsDao.getNewsList(newsDto);
    }

    @SneakyThrows
    @Override
    public int getNewsListCnt(NewsDto newsDto){
        return newsDao.getNewsListCnt(newsDto);
    }

    // 뉴스 상세보기
    @SneakyThrows
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public NewsDto newsDetail(int newsId){
        return newsDao.newsDetail(newsId);
    }
}
