package com.test02.Service;

import com.test02.Dao.Chart2Dao;
import com.test02.Dao.ChartDao;
import com.test02.Dto.Chart2Dto;
import com.test02.Dto.ChartDto;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class ChartServiceImpl implements ChartService {

    @Autowired
    ChartDao chartDao;

    @Autowired
    Chart2Dao chart2Dao;

    @SneakyThrows
    @Override
    public List<ChartDto> getChartValue(ChartDto chartDto){
        return chartDao.getChartValue(chartDto);
    }

    @SneakyThrows
    @Override
    public List<Chart2Dto> getChart2Value(Chart2Dto chart2Dto){
        return chart2Dao.getChart2Value(chart2Dto);
    }
}
