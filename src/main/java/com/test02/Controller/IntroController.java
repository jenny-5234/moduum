package com.test02.Controller;

import com.test02.Dto.IntroDto;
import com.test02.Service.IntroServiceImpl;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


@Controller
@Slf4j
public class IntroController {

    @Autowired
    IntroServiceImpl introService;

    @SneakyThrows
    @GetMapping(value = "/intro")
    public String pageDetail(Model model) {
        model.addAttribute("intro", introService.getIntroHash());
        return "intro";
    }

    @SneakyThrows
    @GetMapping(value = "/intro1")
    public String pageDetail1(Model model) {
        model.addAttribute("intro1", introService.getIntroHash());
        return "intro1";
    }

    @SneakyThrows
    @GetMapping(value = "/intro2")
    public String pageDetail2(Model model) {
        model.addAttribute("intro2", introService.getIntroHash());
        return "intro2";
    }

    @SneakyThrows
    @GetMapping(value = "/intro3")
    public String pageDetail3(Model model) {
        model.addAttribute("intro3", introService.getIntroHash());
        return "intro3";
    }






}
