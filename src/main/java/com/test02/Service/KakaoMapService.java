package com.test02.Service;

import com.test02.Dto.KakaoMapDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface KakaoMapService {
//    public KakaoMapDto getjson(KakaoMapDto kakaoMapDto) throws Exception;
    public List<KakaoMapDto> getcount();
}

