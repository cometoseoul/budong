package com.budong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
    @RequestMapping("/board.do")
    public String goToIndexPage() {
        return "index";
    }
}
