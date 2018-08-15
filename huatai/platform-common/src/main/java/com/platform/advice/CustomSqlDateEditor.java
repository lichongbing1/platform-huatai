package com.platform.advice;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;

/**
 * 作者: @author Harmon <br>
 * 时间: 2016-09-12 17:00<br>
 * 描述: 自定义 java.sql.Date 转换器 <br>
 */
public class CustomSqlDateEditor extends PropertyEditorSupport {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 可以設定任意的日期格式

    /*
     * (non-Javadoc)
     *
     * @see java.beans.PropertyEditorSupport#getAsText()
     */
    @Override
    public String getAsText() {

        java.sql.Date value = (java.sql.Date) getValue();
        return (value != null ? this.dateFormat.format(value) : "");
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

            java.sql.Date dt = java.sql.Date.valueOf(text);
            setValue(dt);

        }

    }

}
