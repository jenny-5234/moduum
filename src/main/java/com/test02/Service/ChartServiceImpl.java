package com.test02.Service;

import com.test02.Dao.ChartDao;
import com.test02.Dto.ChartDto;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChartServiceImpl implements ChartService {

    @Autowired
    ChartDao chartDao;

    @SneakyThrows
    @Override
    public List<ChartDto> getChartValue(ChartDto chartDto){

        return chartDao.getChartValue(chartDto);
    }
}
