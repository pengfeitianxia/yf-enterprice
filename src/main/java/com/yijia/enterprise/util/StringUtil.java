package com.yijia.enterprise.util;

import org.apache.commons.lang.StringUtils;

import java.util.*;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {

    /**
     * 将一组字符串用指定的字符分隔得到一个字符串
     * 如mgr_test_value
     * @param split
     * @param values
     * @return
     */
    public static String join(String split, String... values) {
        StringBuilder builder = new StringBuilder();
        for(String s : values) {
            builder.append(s).append(split);
        }
        return removeEndCharacter(builder.toString().trim(), split);
    }

    public static String append(String ...values){
        StringBuilder builder = new StringBuilder();
        for(String s : values) {
            builder.append(s);
        }
        return builder.toString();
    }

    /**
     * 字符串掩码，如果未匹配到正则则掩码失败返回原字符串
     * @param regx 分组正则表达式（例如  (\d{4})(.*)(\d{4}) 分成四组，分别是整体下标0、第一组下标1、第二组、第三组）
     * @param position 需要掩码的组下标
     * @param target 源字符串
     * @return 将指定分组进行掩码，返回掩码后的字符串
     */
    public static String mask(String regx,int position,String target){
        Matcher matcher= Pattern.compile(regx).matcher(target);
        while(matcher.find()){
            String maskBefore=matcher.group(position);/*掩码前字符串*/
            String mask=maskBefore.replaceAll(".","*");
            return target.replace(maskBefore,mask);
        }
        return target;
    }


    /**
     * 去掉字符串结尾的字符
     * @param string
     * @param endCharacter
     * @return
     */
    public static String removeEndCharacter(String string, String endCharacter) {
        if (StringUtils.isNotBlank(string)&&string.endsWith(endCharacter)) {
            string = string.substring(0, string.length()-endCharacter.length());
        }
        return string;
    }

    /**
     * 所有参数都不为空才返回false,否则返回true
     * @param strs
     * @return
     */
    public static boolean hasEmpty(String ...strs){
        for(String str:strs){
            if(StringUtils.isEmpty(str)){
                return true;
            }
        }
        return false;
    }

    /**
     * 只要有一个参数不为空就返回false,所有参数都为空返回true
     * @param strs
     * @return
     */
    public static boolean allEmpty(String ...strs){
        for(String str:strs){
            if(StringUtils.isNotEmpty(str)){
                return false;
            }
        }
        return true;
    }



    /**
     * 首字母转大写
     * @param oldStr
     * @return
     */
    public static String firstUpper(String oldStr){
        byte[] items = oldStr.getBytes();
        items[0] = (byte)((char)items[0] - ( 'a' - 'A'));
        return new String(items);
    }

    /**
     * 将带下划线的值转成骆驼命名法 如 user_name =>userName
     */
    public static String toCamelCase(String oldStr){
        if(!oldStr.contains("_")){
            return oldStr;
        }
        String [] keys=oldStr.split("\\_");
        StringBuilder sb=new StringBuilder(keys[0]);
        for(int i=1;i<keys.length;i++){
            sb.append(StringUtil.firstUpper(keys[i]));
        }
        return sb.toString();
    }

    public static String getUUID(){
        String uuid=UUID.randomUUID().toString();
        return uuid.replaceAll("-","");
    }

    /**
     * 等于一组字符串中的任何一个则返回true,否则返回false
     * @param target
     * @param strs
     * @return
     */
    public static boolean equals(String target,String ...strs){
        for(String str:strs){
            if(StringUtils.equals(target,str)){
                return true;
            }
        }
        return false;
    }





    /**
     * 从map中获取指定的key转换成String类型
     * @param key
     * @param map
     * @return
     */
    public static String get(String key,Map map){
        if(map==null){
            return "";
        }
        return (String) map.get(key);
    }

    /**
     * 获得字符串 k1=v1&k2=v2&k3...
     * value未使用URLEncoder编码
     * @param param map
     * @return
     */
    public static String getSignStrNoEncoding(Map<String, String> param) {
        StringBuilder builder = new StringBuilder();
        Set<Entry<String,String>> entrySet = param.entrySet();
        Iterator<Entry<String,String>> iterator = entrySet.iterator();
        while (iterator.hasNext()) {
            Entry<String,String> entry = iterator.next();
            String key = entry.getKey();
            String value = entry.getValue();
            if(StringUtils.isNotBlank(value)){
                builder.append(key)
                        .append("=")
                        .append(value)
                        .append("&");
            }
        }
        builder.deleteCharAt(builder.lastIndexOf("&"));
        return builder.toString();
    }

}
