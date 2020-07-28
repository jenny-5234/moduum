package com.test02.Service;


import com.test02.Dao.KakaoMapDao;
import com.test02.Dto.KakaoMapDto;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class KakaoMapServiceImpl implements KakaoMapService {

    @Autowired
    KakaoMapDao kakaoMapDao;

    /*@SneakyThrows
    @Override
    public KakaoMapDto getjson(KakaoMapDto kakaoMapDto) {
        return kakaoMapDao.selectJson(kakaoMapDto);

    }*/

    @SneakyThrows
    @Override
    public List<KakaoMapDto> getcount() {
//        log.info("@@@@@@@@@@@@@@@@@@@@@@@"+kakaoMapDao.selectj());
        return kakaoMapDao.selectjson();
    }

}


