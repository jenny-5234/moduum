package com.test02.Controller;

import com.test02.Dto.Chart2Dto;
import com.test02.Dto.Chart3Dto;
import com.test02.Dto.ChartDto;
import com.test02.Dto.SpendDataDto;
import com.test02.Service.ChartServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import java.util.ArrayList;
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

        //chart2에 존재하는 date 값 리스트 (sorted)
        ArrayList<Integer> dates = getDates(chart2);

        //model에 넣을 SpendDataDto 리스트
        List<SpendDataDto> spendDataDtos = new ArrayList<>();

        //date 별로 때려박는다
        for (int i = 0; i < dates.size(); i++) {
            spendDataDtos.add(getSpendDataDto_By_date(chart2, dates.get(i)));
        }

        //model 에 박음
        model.addAttribute("chart2", spendDataDtos);

        List<Chart3Dto> chart3 = chartService.getChart3Value(chart3Dto);
        model.addAttribute("chart3", chart3);

        List<Chart3Dto> chart4 = chartService.getChart4Value(chart3Dto);
        model.addAttribute("chart4", chart4);

        List<Chart3Dto> chart5 = chartService.getChart5Value(chart3Dto);
        model.addAttribute("chart5", chart5);


        return "chart/chartlist";
    }

    private ArrayList<Integer> getDates(List<Chart2Dto> list1) {
        ArrayList<Integer> date_ArrayList = new ArrayList<>();
        for (int i = 0; i < list1.size(); i++) {
            if (!date_ArrayList.contains(list1.get(i).getDate())) {
                date_ArrayList.add(list1.get(i).getDate());
            }
        }
        //정렬 매소드
        Collections.sort(date_ArrayList);

        return date_ArrayList;
    }

    private SpendDataDto getSpendDataDto_By_date(List<Chart2Dto> list, int date) {
        SpendDataDto spendDataDto = new SpendDataDto();

        //date값 넣고
        spendDataDto.setDate(date);

        //date 같은거 끼리 모아서
        List<Chart2Dto> list1 = getList_By_Date(list, date);

        //나이대 별로 넣기
        for (int i = 0; i < list1.size(); i++) {
            if (list1.get(i).getAge() == 1) {
                spendDataDto.setAge_20(list1.get(i).getSpend());
            } else if (list1.get(i).getAge() == 2) {
                spendDataDto.setAge_30(list1.get(i).getSpend());
            } else if (list1.get(i).getAge() == 3) {
                spendDataDto.setAge_40(list1.get(i).getSpend());
            } else if (list1.get(i).getAge() == 4) {
                spendDataDto.setAge_50(list1.get(i).getSpend());
            } else if (list1.get(i).getAge() == 5) {
                spendDataDto.setAge_60(list1.get(i).getSpend());
            }
        }

        return spendDataDto;
    }

    private List<Chart2Dto> getList_By_Date(List<Chart2Dto> list, int date) {
        List<Chart2Dto> list1 = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getDate() == date) {
                list1.add(list.get(i));
            }
        }

        return list1;
    }
}
