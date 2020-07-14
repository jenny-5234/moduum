package com.test02.Controller;

import com.test02.Dto.BoardDto;
import com.test02.Dto.Pagination;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/map")
@Controller
//@Slf4j
public class FindMapController {
    @RequestMapping("/mapsearch")
    public String writeBoard() {
        System.out.println("테스트");
        return "map/mapsearch";
    }
}
