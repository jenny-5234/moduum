package com.test02.Controller;

import com.test02.Dto.NewsDto;
import com.test02.Service.NewsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    NewsServiceImpl newsService;

    @RequestMapping(value = "/")
    public String index(@ModelAttribute("newsDto") NewsDto newsDto,
                        Model model) throws Exception{
        List<NewsDto> newstop5 = newsService.selecttop5(newsDto);

        model.addAttribute("newstop5", newstop5);

        return "home";
    }

//    @GetMapping("/home")
//    public String home() {
//        return "home";
//    }
//

}
