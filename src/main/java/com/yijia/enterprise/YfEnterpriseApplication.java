package com.yijia.enterprise;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.spring.annotation.MapperScan;
//扫描mybatis那里面的接口
@MapperScan("com.yijia")
@SpringBootApplication
@Slf4j
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
public class YfEnterpriseApplication {

    public static void main(String[] args) {
        SpringApplication.run(YfEnterpriseApplication.class, args);
    }

}
