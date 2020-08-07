package com.test02.Service;

import com.test02.Dto.Chart2Dto;
import com.test02.Dto.Chart3Dto;
import com.test02.Dto.ChartDto;

import java.util.List;

public interface ChartService {
    public List<ChartDto> getChartValue(ChartDto chartDto);
    public List<Chart2Dto> getChart2Value(Chart2Dto chart2Dto);
    public List<Chart3Dto> getChart3Value(Chart3Dto chart3Dto);
    public List<Chart3Dto> getChart4Value(Chart3Dto chart3Dto);
    public List<Chart3Dto> getChart5Value(Chart3Dto chart3Dto);
}
