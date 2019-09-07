package com.yijia.enterprise.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Auther: makunpeng
 * @Date: 2019/9/6 17:03
 * @Description:
 */
@RestController
@RequestMapping("main")
public class MainController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView addUI(ModelAndView view) {
        view.setViewName("main");
        return view;
    }
}
