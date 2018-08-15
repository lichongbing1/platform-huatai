package com.platform.utils;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 读取properties定义的配置，支持多次在xml中定义
 * 作者: @author Harmon(管厚明) <br/>
 * 名称: main.dt.utils.common <br/>
 * 时间: 2016/1/25 9:42 <br/>
 * 描述: main.dt.utils.common <br/>
 */
public class PropertyConfigurerUtil extends
        PropertyPlaceholderConfigurer {

    private static Map<String, Object> ctxPropertiesMap;

    @Override
    protected void processProperties(
            ConfigurableListableBeanFactory beanFactoryToProcess,
            Properties props) throws BeansException {
        super.processProperties(beanFactoryToProcess, props);
        if (null == ctxPropertiesMap) {
            ctxPropertiesMap = new HashMap();
        }
        for (Object key : props.keySet()) {
            String keyStr = key.toString();
            String value = props.getProperty(keyStr);
            ctxPropertiesMap.put(keyStr, value);
        }
    }

    public static Object getContextProperty(String name) {
        return ctxPropertiesMap.get(name);
    }

    public static String getString(String name) {
        return MapUtils.getString(name, ctxPropertiesMap);
    }
}
