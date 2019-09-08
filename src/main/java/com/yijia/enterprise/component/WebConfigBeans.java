package com.yijia.enterprise.component;

import com.yijia.enterprise.convert.DateConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import javax.annotation.PostConstruct;

/**
 * @author zfh
 * @version 1.0
 * @date 2018/12/30 10:16
 */
@Component
public class WebConfigBeans {

  @Autowired
  private RequestMappingHandlerAdapter handlerAdapter;

  @PostConstruct
  public void initEditableAvlidation() {

    ConfigurableWebBindingInitializer initializer = (ConfigurableWebBindingInitializer)handlerAdapter.getWebBindingInitializer();
    if(initializer.getConversionService()!=null) {
      GenericConversionService genericConversionService = (GenericConversionService)initializer.getConversionService();

      genericConversionService.addConverter(new DateConverter());

    }
  }
}