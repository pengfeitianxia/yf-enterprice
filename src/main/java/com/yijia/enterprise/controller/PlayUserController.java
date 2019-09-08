package com.yijia.enterprise.controller;

import com.yijia.enterprise.domain.entity.PUser;
import com.yijia.enterprise.service.PlayUserService;
import com.yijia.enterprise.util.page.PageInfo;
import com.yijia.enterprise.util.page.PageResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/playUser")
@Slf4j
public class PlayUserController {
    @Autowired
    PlayUserService playUserService;
    @RequestMapping(value = "/addUI", method = RequestMethod.GET)
    public ModelAndView addUI(ModelAndView view) {
        view.setViewName("play/userAdd");
        return view;
    }
    @RequestMapping(value = "/editUI", method = RequestMethod.GET)
    public ModelAndView editUI(ModelAndView view,@RequestParam(value = "id", required = false) String userId) {
        PUser pUser = playUserService.getById(userId);
        view.addObject("pUser",pUser);
        view.setViewName("play/userEdit");
        return view;
    }
    @RequestMapping (value = "/list", method = RequestMethod.GET)
    public ModelAndView listUI(ModelAndView view) {
        view.setViewName("play/userList");
        return view;
    }

    @RequestMapping(value = "/ajaxList")
    @ResponseBody
    public PageResult ajaxList(@RequestParam(value = "draw") int draw, PageInfo pageInfo, HttpServletRequest request) {
        log.info("分页查询用户信息  pageInfo : {}", pageInfo.toString());
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int start = pageInfo.getCurrentResult();
        int length = pageInfo.getShowCount();
        List<PUser> pUsers = playUserService.getUserByPage(name, phone, start, length);
        pageInfo.setResultObject(pUsers);
        PageResult pageResult =  new PageResult(pageInfo, draw);
        pageResult.setRecordsTotal(playUserService.count(name,phone));
        log.info("分页查询用户信息结果 pageResult:{}",pageResult.toString());
        return pageResult;
    }
    @RequestMapping(value = "/add")
    @ResponseBody
    public Map<String, Object> add(PUser pUser, HttpServletRequest request) {
        log.info("======添加用户:{}======",pUser);
        return playUserService.add(pUser);
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(PUser pUser, HttpServletRequest request) {
        log.info("更新用户信息：{}",pUser);
        return playUserService.update(pUser);
    }
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map<String, Object> delete(@RequestParam(value = "userId", required = false) String userId, HttpServletRequest request) {
        log.info("删除用户：{}",userId);
        return playUserService.delById(userId);
    }

    @RequestMapping(value = "/consumption")
    @ResponseBody
    public Map<String, Object> consumption(@RequestParam(value = "userId", required = false) String userId, HttpServletRequest request) {
        log.info("用户{} 进行消费",userId);
        return playUserService.consumption(userId);

    }






}