package com.yijia.enterprise.aop;

import com.yijia.enterprise.util.JsonUtil;
import com.yijia.enterprise.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.MDC;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


@Aspect
@Service
/**
 * @author zhuanghuan
 */
@Slf4j
public class LogAspect {
    private static Map<String, String[]> parameterNameCaches = new ConcurrentHashMap<>();

    private static LocalVariableTableParameterNameDiscoverer parameterNameDiscovere = new LocalVariableTableParameterNameDiscoverer();


    private void setMdc() {
        MDC.put("requestId", StringUtil.getUUID());
    }

    private void removeMdc() {
        MDC.remove("requestId");
    }


    @Around("(execution(* com.yijia.enterprise.controller.*.*(..)))")
    public Object jmsListener(ProceedingJoinPoint point) throws Throwable {
        return around(point);
    }


    private Object around(ProceedingJoinPoint point) throws Throwable {
        StopWatch watch = new StopWatch();
        try {
            watch.start();
            setMdc();
            printParam(point, true);

            Object result = point.proceed();
            printResult(point, true, result);
            return result;
        } finally {
            watch.stop();
            log.info("耗时{}ms", watch.getTotalTimeMillis());
            removeMdc();
        }
    }

    /*打印输入参数*/
    private void printParam(ProceedingJoinPoint point, Boolean printParams) {
        try {
            if (null == printParams || !printParams) {
                log.info("目标方法:{}", StringUtil.append(point.getSignature().getDeclaringTypeName(), ".", point.getSignature().getName()));
                return;
            }
            Map<String, Object> params = getParam(point);
            log.info("目标方法:{};输入参数:{}", StringUtil.append(point.getSignature().getDeclaringTypeName(), ".", point.getSignature().getName()), JsonUtil.objectToJson(params));
        } catch (Exception e) {
            log.error("获取参数错误,错误信息:{}", e.getMessage());
        }
    }

    private void printResult(ProceedingJoinPoint point, Boolean printResult, Object result) {
        if (null == printResult) {
            return;
        }
        if (!printResult) {
            return;
        }
        Class returnType = ((MethodSignature) point.getSignature()).getReturnType();
        if (StringUtil.equals(returnType.getName(), "void")) {
            return;
        }
        log.info("返回结果:{}", JsonUtil.objectToJson(result));

    }

    /**
     * 获取客户端参数
     *
     * @param point
     * @return
     * @throws NoSuchMethodException
     */
    private Map getParam(ProceedingJoinPoint point) throws NoSuchMethodException {
        String methodLongName = point.getSignature().toLongString();
        String[] parameterNames = parameterNameCaches.get(methodLongName);
        if (parameterNames == null) {
            Method method = getMethod(point);
            parameterNames = parameterNameDiscovere.getParameterNames(method);
            parameterNameCaches.put(methodLongName, parameterNames);
        }
        Object[] args = point.getArgs();
        Map<String, Object> params = new HashMap<>();
        if (args.length == parameterNames.length) {
            for (int i = 0, len = args.length; i < len; i++) {
                params.put(parameterNames[i], args[i]);
            }
        }
        return params;
    }

    /**
     * 获取当前执行的方法
     *
     * @param point
     * @return
     */
    private Method getMethod(ProceedingJoinPoint point) {
        return ((MethodSignature) point.getSignature()).getMethod();
    }

}
