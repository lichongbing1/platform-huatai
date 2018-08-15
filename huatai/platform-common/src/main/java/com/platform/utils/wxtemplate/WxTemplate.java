package com.platform.utils.wxtemplate;

import java.util.List;

/**
 * 微信模板
 *
 * @author harmon(CN)
 * @date 2017/11/29.
 */
public class WxTemplate {
    private String template_id;//模板ID
    private String touser;//目标客户
    private String page;//用户点击模板信息的跳转页面
    private String topcolor;//字体颜色
    private List<TemplateData> data;//模板里的数据
    private String form_id;//字体颜色

    public String getTemplate_id() {
        return template_id;
    }

    public void setTemplate_id(String template_id) {
        this.template_id = template_id;
    }

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getTopcolor() {
        return topcolor;
    }

    public void setTopcolor(String topcolor) {
        this.topcolor = topcolor;
    }

    public List<TemplateData> getData() {
        return data;
    }

    public void setData(List<TemplateData> data) {
        this.data = data;
    }

    public String toJSON() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("{");
        buffer.append(String.format("\"touser\":\"%s\"", this.touser)).append(",");
        buffer.append(String.format("\"template_id\":\"%s\"", this.template_id)).append(",");
        buffer.append(String.format("\"page\":\"%s\"", this.page)).append(",");
        buffer.append(String.format("\"form_id\":\"%s\"", this.form_id)).append(",");
        buffer.append(String.format("\"topcolor\":\"%s\"", this.topcolor)).append(",");
        buffer.append("\"data\":{");
        TemplateData param = null;
        for (int i = 0; i < this.data.size(); i++) {
            param = data.get(i);
            // 判断是否追加逗号
            if (i < this.data.size() - 1) {
                buffer.append(String.format("\"%s\": {\"value\":\"%s\",\"color\":\"%s\"},", param.getName(), param.getValue(), param.getColor()));
            } else {
                buffer.append(String.format("\"%s\": {\"value\":\"%s\",\"color\":\"%s\"}", param.getName(), param.getValue(), param.getColor()));
            }

        }
        buffer.append("}");
        buffer.append("}");
        return buffer.toString();
    }

    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }
}
