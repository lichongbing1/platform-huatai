package com.platform.advice;

import com.platform.utils.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;

import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 作者: @author Harmon <br>
 * 时间: 2016-09-12 17:02<br>
 * 描述: CustomDateEditor <br>
 */
public class CustomDateEditor extends PropertyEditorSupport {

    private static final Log logger = LogFactory.getLog(CustomDateEditor.class);

    private final DateFormat dateFormat;

    private final boolean allowEmpty;

    // private final int exactDateLength;

    /**
     * Create a new CustomDateEditor instance, using the given DateFormat for
     * parsing and rendering.
     * <p/>
     * The "allowEmpty" parameter states if an empty String should be allowed
     * for parsing, i.e. get interpreted as null value. Otherwise, an
     * IllegalArgumentException gets thrown in that case.
     *
     * @param dateFormat DateFormat to use for parsing and rendering
     * @param allowEmpty if empty strings should be allowed
     */
    public CustomDateEditor(DateFormat dateFormat, boolean allowEmpty) {
        this.dateFormat = dateFormat;
        this.allowEmpty = allowEmpty;
        // this.exactDateLength = -1;
    }

    /**
     * 默认构造方法 使用标准时间格式 "yyyy-MM-dd HH:mm:ss"; <br>
     * 前后台统一
     */
    public CustomDateEditor() {

        this.dateFormat = new SimpleDateFormat(DateUtils.DATE_TIME_PATTERN);
        this.allowEmpty = true;
        // this.exactDateLength = -1;

    }

    /**
     * Create a new CustomDateEditor instance, using the given DateFormat for
     * parsing and rendering.
     * <p/>
     * The "allowEmpty" parameter states if an empty String should be allowed
     * for parsing, i.e. get interpreted as null value. Otherwise, an
     * IllegalArgumentException gets thrown in that case.
     * <p/>
     * The "exactDateLength" parameter states that IllegalArgumentException gets
     * thrown if the String does not exactly match the length specified. This is
     * useful because SimpleDateFormat does not enforce strict parsing of the
     * year part, not even with {@code setLenient(false)}. Without an
     * "exactDateLength" specified, the "01/01/05" would get parsed to
     * "01/01/0005". However, even with an "exactDateLength" specified,
     * prepended zeros in the day or month part may still allow for a shorter
     * year part, so consider this as just one more assertion that gets you
     * closer to the intended date format.
     *
     * @param dateFormat      DateFormat to use for parsing and rendering
     * @param allowEmpty      if empty strings should be allowed
     * @param exactDateLength the exact expected length of the date String
     */
    public CustomDateEditor(DateFormat dateFormat, boolean allowEmpty, int exactDateLength) {
        this.dateFormat = dateFormat;
        this.allowEmpty = allowEmpty;
        // this.exactDateLength = exactDateLength;
    }

    /**
     * Parse the Date from the given text, using the specified DateFormat.
     */
    @Override
    public void setAsText(String text) throws IllegalArgumentException {

        logger.debug("*****转换日期字符串:" + text + "*****");
        // 允许空值 时 ,要转换的字符串为空 直接返回空值
        if (this.allowEmpty && !StringUtils.hasText(text)) {
            // Treat empty String as null value.
            setValue(null);

            return;

        }

        // 尝试以默认格式转换日期,失败则自动尝试其他格式
        // 如果无匹配,则抛出异常
        try {
            setValue(this.dateFormat.parse(text));
        } catch (ParseException ex) {

            try {
                // 自定义日期类型
                String style = DateUtils.getDateFormat(text);
                if (!StringUtils.isEmpty(style)) {
                    SimpleDateFormat df = new SimpleDateFormat(style); // 设定前后台的格式对应
                    df.setLenient(false);

                    setValue(df.parse(text));

                }
            } catch (ParseException e) {
                logger.error("****** 日期类型转换错误,仅记录,必要时查询数据****");
            }
        }

    }

    /**
     * Format the Date as String, using the specified DateFormat.
     */
    @Override
    public String getAsText() {
        Date value = (Date) getValue();
        return (value != null ? this.dateFormat.format(value) : "");
    }
}