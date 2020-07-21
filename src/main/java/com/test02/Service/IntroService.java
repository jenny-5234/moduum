package com.test02.Service;

import com.test02.Dto.BoardDto;
import com.test02.Dto.IntroDto;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.util.HashMap;
import java.util.List;


@Service
public interface IntroService {
    public List<IntroDto> getIntro();
    public HashMap<String, String> getIntroHash();
}


