package com.yijia.enterprise.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/playUser")
@Slf4j
public class PlayUserController {
    @RequestMapping(value = "/addUI", method = RequestMethod.GET)
    public ModelAndView addUI(ModelAndView view) {
        view.setViewName("play/userAdd");
        return view;
    }
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String  test() {
        log.info("=========hello world==========");
        return "hello world";
    }
}