package com.yijia.enterprise.util;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;


/**
 * Json工具类
 * 
 * @author
 * 
 * @date 2015年1月13日
 */
public class JsonUtil {

	static Logger logger = LoggerFactory.getLogger("JsonUtil");

	private static ObjectMapper objectmapper = new ObjectMapper();

	static{
		objectmapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
		objectmapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	}

	/**
	 * 把任何对象转换成Json
	 * @param object
	 * @return Json字符串
	 */
	public static String objectToJson(Object object) {
		Writer strWriter = new StringWriter();
		try {
			objectmapper.writeValue(strWriter, object);
		} catch (Exception e) {
			logger.info("JSON解析出错",e);
		}
		String json = strWriter.toString();
		return json;
	}

	/**
	 * Json串转Object
	 * @param json 需要转的JSON
	 * @return 实体对象
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Object JsonToObject(String json , Class clazz){
		try {
			return objectmapper.readValue(json, clazz);
		} catch (Exception e) {
			logger.error("JSON解析出错",e);
			return null;
		}
	}
	
	@SuppressWarnings("rawtypes")
	public static Map json2Map(String json){
		return (Map) JsonToObject(json, Map.class);
	}
	
	/**
	 *  根据传入的KEY从JSON串中取出对应的VALUE
	 * @param json
	 * @param key
	 * @return
	 */
	public static String jsonToStringByKey(String json , String key){
          try {
			JsonNode rootNode = objectmapper.readTree(json);
			String value = rootNode.path(key).asText();
			return value;
		} catch (Exception e) {
			logger.info("JSON解析出错",e);
			return null;
		} 
	}
}
