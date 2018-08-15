package com.platform.advice;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;

/**
 * 作者: @author Harmon <br>
 * 时间: 2016-09-12 17:01<br>
 * 描述: 自定义 java.sql.Date 转换器 <br>
 */
public class CustomTimestampEditor  extends PropertyEditorSupport {

    /*
     * (non-Javadoc)
     *
     * @see java.beans.PropertyEditorSupport#getAsText()
     */
    @Override
    public String getAsText() {

        Timestamp value = (Timestamp) getValue();
        return (value != null) ? value.toString() : "";
    }

    /*
     * (non-Javadoc)
     *
     * @see java.beans.PropertyEditorSupport#setAsText(java.lang.String)
     */
    @Override
    public void setAsText(String text) throws IllegalArgumentException {

        if (text == null || text == "") {
            setValue(null);
        } else {
            setValue(new Timestamp(Long.valueOf(text)));
        }

    }

}