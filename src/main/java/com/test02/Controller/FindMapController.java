package com.test02.Controller;

import com.test02.Dto.KakaoMapDto;
import com.test02.Service.KakaoMapServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;

@Slf4j
@RequestMapping("/map")
@Controller
//@Slf4j
public class FindMapController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    KakaoMapServiceImpl kakaoMapService;

    @RequestMapping("/mapsearch")
    public String writeBoard(Model model) throws Exception {

//        log.info("@@@@@@@@@@@@@@@@@@@@@@@"+kakaocount);
//        model.addAttribute("kakaoc", kakaoMapService.getcount());
        return "map/mapsearch";
    }
}
