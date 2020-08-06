package com.test02.Controller;

import com.test02.Dto.Chart3Dto;
import com.test02.Dto.ChartDto;
import com.test02.Dto.NewsDto;
import com.test02.Service.ChartServiceImpl;
import com.test02.Service.NewsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    NewsServiceImpl newsService;

    @Autowired
    ChartServiceImpl chartService;

    @RequestMapping(value = "/")
    public String index(@ModelAttribute("mainDto") NewsDto newsDto, Chart3Dto chart3Dto, ChartDto chartDto,
                        Model model) throws Exception{
        List<NewsDto> newstop5 = newsService.selecttop5(newsDto);
        model.addAttribute("newstop5", newstop5);

        List<ChartDto> chart = chartService.getChartValue(chartDto);
        model.addAttribute("chart", chart);

        List<Chart3Dto> chart3 = chartService.getChart5Value(chart3Dto);
        model.addAttribute("chart3", chart3);

        return "testhome";
    }

    @RequestMapping(value = "/mainhome")
    public String index1(@ModelAttribute("mainDto") NewsDto newsDto, Chart3Dto chart3Dto, ChartDto chartDto,
                        Model model) throws Exception{
        List<NewsDto> newstop5 = newsService.selecttop5(newsDto);
        model.addAttribute("newstop5", newstop5);

        List<ChartDto> chart = chartService.getChartValue(chartDto);
        model.addAttribute("chart", chart);

        List<Chart3Dto> chart3 = chartService.getChart5Value(chart3Dto);
        model.addAttribute("chart3", chart3);

        return "mainhome";
    }
    @RequestMapping(value = "/testhome")
    public String index2(@ModelAttribute("mainDto") NewsDto newsDto, Chart3Dto chart3Dto, ChartDto chartDto,
                         Model model) throws Exception{
        List<NewsDto> newstop5 = newsService.selecttop5(newsDto);
        model.addAttribute("newstop5", newstop5);

        List<ChartDto> chart = chartService.getChartValue(chartDto);
        model.addAttribute("chart", chart);

        List<Chart3Dto> chart3 = chartService.getChart5Value(chart3Dto);
        model.addAttribute("chart3", chart3);

        return "home";
    }
}
