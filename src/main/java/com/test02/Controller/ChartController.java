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
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequestMapping("/chart")
@Controller
public class ChartController {
    /*@Autowired
    ServletContext servletContext;

    @Autowired
    ChartServiceImpl chartService;

    @RequestMapping("/chartlist")
    public String chartlist(Model model, @ModelAttribute("chartDto") ChartDto chartDto, Chart2Dto chart2Dto, Chart3Dto chart3Dto) {
        List<ChartDto> chart = chartService.getChartValue(chartDto);
        model.addAttribute("chart", chart);

        List<Chart2Dto> chart2 = chartService.getChart2Value(chart2Dto);
        model.addAttribute("chart2", chart2);

        List<Chart3Dto> chart3 = chartService.getChart3Value(chart3Dto, "'M'");
        model.addAttribute("chart3", chart3);

        List<Chart3Dto> chart4 = chartService.getChart3Value(chart3Dto, "'F'");
        model.addAttribute("chart4", chart4);

        ArrayList<Chart3Dto> chart5 = new ArrayList<>();
        for (int i = 0; i < chart3.size(); i++) {
            for (int j = 0; j < chart4.size(); j++) {
                if(chart3.get(i).getCategory().equals(chart4.get(j).getCategory())){
                    Long spend = (chart3.get(i).getSpend() + chart4.get(j).getSpend());
                    chart5.add(new Chart3Dto(0, "",chart3.get(i).getCategory(), spend));
                }
            }
        }

        model.addAttribute("chart5", chart5);



        return "chart/chartlist";
    }*/
}

