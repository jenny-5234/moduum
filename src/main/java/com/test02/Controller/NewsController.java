package com.test02.Controller;

import com.test02.Dto.NewsDto;
import com.test02.Dto.Pagination;
import com.test02.Service.NewsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Map;

@RequestMapping("/news")
@Controller
public class NewsController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    NewsServiceImpl newsService;

    // 1. 뉴스 목록
    @GetMapping("/newslist")
    public String newsList(@ModelAttribute("newsDto") NewsDto newsDto,
                           @RequestParam(required = false, defaultValue = "1") int curPage,
                           Model model) throws  Exception{
        // 전체 뉴스 개수
        int listCnt = newsService.getNewsListCnt(newsDto);

        Pagination pagination = new Pagination(listCnt, curPage);

        newsDto.setStartIndex(pagination.getStartIndex());
        newsDto.setCntPerPage(pagination.getPageSize());
        newsDto.setCurPage(pagination.getCurPage());

        List<NewsDto> news = newsService.getNewsList(newsDto);

        model.addAttribute("news", news);
        model.addAttribute("pagination", pagination);

        return "/news/newslist";
    }

    // 3. 뉴스 상세보기
//    @GetMapping(value = "/newsview")
//    public String newsDetail(@RequestParam int newsId, Model model){
//        NewsDto newsDto = newsService.newsDetail(newsId);
//        model.addAttribute("newsDto", newsDto);
//        return "/news/newsview";
//    }
}
