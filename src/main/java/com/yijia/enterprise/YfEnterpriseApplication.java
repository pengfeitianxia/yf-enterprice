package com.yijia.enterprise;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.Mapping;
import tk.mybatis.spring.annotation.MapperScan;
//扫描mybatis那里面的接口
@MapperScan("com.yijia")
@SpringBootApplication
public class YfEnterpriseApplication {

    public static void main(String[] args) {
        SpringApplication.run(YfEnterpriseApplication.class, args);
    }

}
