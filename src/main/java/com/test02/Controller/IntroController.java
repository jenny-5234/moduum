package com.test02.Controller;

import com.test02.Service.IntroServiceImpl;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}
