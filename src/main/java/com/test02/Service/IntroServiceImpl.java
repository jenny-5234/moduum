package com.test02.Service;

import com.test02.Dao.IntroDao;
import com.test02.Dto.IntroDto;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Slf4j
public class IntroServiceImpl implements IntroService{

    @Autowired
    IntroDao introDao;


    @SneakyThrows
    @Override
    public List<IntroDto> getIntro() {
        return introDao.getIntro();
    }

    @SneakyThrows
    @Override
    public HashMap<String, String> getIntroHash() {

        List<IntroDto> list = introDao.getIntro();
        var hashMap = new HashMap<String, String>();

        for (int i = 0; i < list.size(); i++) {
            hashMap.put(list.get(i).getIntroId(), list.get(i).getText());
        }
        return hashMap;
    }
}
