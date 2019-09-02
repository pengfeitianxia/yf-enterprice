package com.yijia.enterprise.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Controller
@RequestMapping("/login")
@Slf4j
public class UserController {
      

    @RequestMapping("/initLogin")
    public String initLogin(Model model){
        
        model.addAttribute("model", "model:你被支持吗?");       
        return "hello";
        
    }
    
    @RequestMapping("/")
    public String welcome(){
        log.info("hello world");
        return "index";
        
    }
}