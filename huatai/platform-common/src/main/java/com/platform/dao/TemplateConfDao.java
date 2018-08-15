package com.platform.dao;

import com.platform.entity.TemplateConfVo;

/**
 * 微信模板消息日志Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 16:49:29
 */
public interface TemplateConfDao extends BaseDao<TemplateConfVo> {

    TemplateConfVo queryByTypeId(Integer templateType);

}
