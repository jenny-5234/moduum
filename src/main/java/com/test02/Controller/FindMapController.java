package com.test02.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;

@RequestMapping("/map")
@Controller
public class FindMapController {

    @Autowired
    ServletContext servletContext;

    @RequestMapping("/mapsearch")
    public String writeBoard() throws Exception {
        return "map/mapsearch";
    }
}

