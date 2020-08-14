package com.test02.Controller;

import com.test02.Dto.Chart2Dto;
import com.test02.Dto.Chart3Dto;
import com.test02.Dto.ChartDto;
import com.test02.Service.ChartServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import java.util.Collections;
import java.util.List;

@Slf4j
@RequestMapping("/chart")
@Controller
public class ChartController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    ChartServiceImpl chartService;

    @RequestMapping("/chartlist")
    public String chartlist(Model model, @ModelAttribute("chartDto") ChartDto chartDto, Chart2Dto chart2Dto, Chart3Dto chart3Dto) {
        List<ChartDto> chart = chartService.getChartValue(chartDto);
        model.addAttribute("chart", chart);

        List<Chart2Dto> chart2 = chartService.getChart2Value(chart2Dto);
        model.addAttribute("chart2", chart2);

        List<Chart3Dto> chart3 = chartService.getChart3Value(chart3Dto, "M");
        model.addAttribute("chart3", chart3);

        List<Chart3Dto> chart4 = chartService.getChart3Value(chart3Dto, "F");
        model.addAttribute("chart4", chart4);

        model.addAttribute("chart5", chart3.addAll(chart4));

        return "chart/chartlist";
    }
}
