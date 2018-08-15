/*
 * 创建时间：2017-07-31 12:01
 * 项目名称:platform
 * 类名称:SimLogRollingFileAppender.java
 * 包名称:com.joyintech.log4j
 *
 * 修改履历:
 *          日期              修正者        主要内容
 *                                      
 *
 * Copyright (c) 2016-2017 兆尹科技
 */
package com.platform.log4j;

import org.apache.log4j.DailyRollingFileAppender;
import org.apache.log4j.Priority;

/**
 * 名称：GradeLogDailyRollingFileAppender <br>
 * 描述：自定义日志文件追加类，使日志分级打印配置只判断是否相等，而不是使用上限<br>
 *
 * @author 李鹏军
 * @version 1.0
 * @since 1.0.0
 */
public class GradeLogDailyRollingFileAppender extends DailyRollingFileAppender {
    @Override
    public boolean isAsSevereAsThreshold(Priority priority) {
        //只判断是否相等，而不判断优先级
        return this.getThreshold().equals(priority);
    }
}
