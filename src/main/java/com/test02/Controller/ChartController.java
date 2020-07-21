package com.test02.Controller;

import com.test02.Dto.ChartDto;
import com.test02.Service.ChartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import java.util.List;

@RequestMapping("/chart")
@Controller
public class ChartController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    ChartServiceImpl chartService;

    @GetMapping("/chartlist")
    public String chartValue(@ModelAttribute("chartDto") ChartDto chartDto,
                             Model model) throws Exception{
        List<ChartDto> chart = chartService.getChartValue(chartDto);

        model.addAttribute("chart", chart);

        return "/chart/chartlist";
    }
}
