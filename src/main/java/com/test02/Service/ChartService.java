package com.test02.Service;

import com.test02.Dto.Chart2Dto;
import com.test02.Dto.ChartDto;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ChartService {
    public List<ChartDto> getChartValue(ChartDto chartDto);
    public List<Chart2Dto> getChart2Value(Chart2Dto chart2Dto);
}
