package com.yijia.enterprise.service;

import com.yijia.enterprise.dao.PUserMapper;
import com.yijia.enterprise.database.mapper.SpecPUserMapper;
import com.yijia.enterprise.domain.entity.PUser;
import com.yijia.enterprise.util.IdBuilder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: makunpeng
 * @Date: 2019/9/8 10:58
 * @Description:
 */
@Slf4j
@Service
public class PlayUserService {
    @Autowired
    private PUserMapper pUserMapper;
    @Autowired
    private SpecPUserMapper specPUserMapper;
    @Value("${price}")
    private String price;
    public Map<String, Object> add(PUser pUser) {
        Map<String, Object> resultMap = new HashMap();
        resultMap.put("isSuccess", false);
        try {
            pUser.setUserid(IdBuilder.getID());
            pUser.setModifyTime(new Date());
            pUser.setCreateTime(new Date());
            pUserMapper.insert(pUser);
            resultMap.put("isSuccess", true);
            resultMap.put("msg", "添加成功！");
        } catch (Exception e) {
            log.error("用户信息失败:", e);
            resultMap.put("msg", e.getMessage());
        }
        return resultMap;
    }

    public PUser getById(String userId) {
         PUser pUser = pUserMapper.selectByPrimaryKey(userId);
        log.info("通过用户Id获取用户信息：{}",pUser);
        return pUser;
    }

    public Map<String,Object> update(PUser pUser) {
        Map<String, Object> resultMap = new HashMap();
        resultMap.put("isSuccess", false);
        try {
            pUserMapper.updateByPrimaryKey(pUser);
            resultMap.put("isSuccess", true);
            resultMap.put("msg", "修改成功");
        } catch (Exception e) {
            log.error("用户信息失败:", e);
            resultMap.put("msg", e.getMessage());
        }
        return resultMap;
    }

    public Map<String,Object> delById(String userId) {
        HashMap resultMap = new HashMap();
        resultMap.put("isSuccess", false);
        try {
            pUserMapper.deleteByPrimaryKey(userId);
            resultMap.put("isSuccess", true);
            resultMap.put("msg", "删除成功！");
        } catch (Exception e) {
            log.error("删除失败:", e);
            resultMap.put("msg", e.getMessage());
        }
        return resultMap;
    }

    public List<PUser> getUserByPage(String name, String phone, int start, int length) {
        return specPUserMapper.getByPage(name,phone,start,length);
    }
    public int count(String name, String phone) {
        return specPUserMapper.count(name,phone);
    }
    @Transactional
    public Map<String,Object> consumption(String userId) {

        HashMap resultMap = new HashMap();
        resultMap.put("isSuccess", false);
        try {
            PUser pUser = pUserMapper.selectByPrimaryKey(userId);
            log.info("获取用户信息:{}",pUser);
            BigDecimal remainAmount = pUser.getRemainAmount();
            BigDecimal prices = new BigDecimal(price);
            BigDecimal result = remainAmount.subtract(prices);
            if(result.compareTo(BigDecimal.ZERO) < 0){
                throw new Exception("余额不足");
            }
            pUser.setRemainAmount(result);
            pUserMapper.updateByPrimaryKeySelective(pUser);
            resultMap.put("isSuccess", true);
            resultMap.put("msg", "扣除成功！");
        } catch (Exception e) {
            log.error("扣除失败:", e);
            resultMap.put("msg", e.getMessage());
        }
        return resultMap;
    }
}
