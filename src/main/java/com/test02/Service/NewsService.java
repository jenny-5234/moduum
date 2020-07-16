package com.test02.Service;

import com.test02.Dto.NewsDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NewsService {
    // 뉴스 조회
    public List<NewsDto> getNewsList(NewsDto newsDto);
    public int getNewsListCnt(NewsDto newsDto);

    // 뉴스 상세보기
    public NewsDto newsDetail(int newsId) throws Exception;

    // 뉴스 5개 조회
    public List<NewsDto> selecttop5(NewsDto newsDto);
}
