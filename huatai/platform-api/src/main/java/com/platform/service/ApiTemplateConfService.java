package com.platform.service;

import com.platform.dao.TemplateConfDao;
import com.platform.entity.TemplateConfVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 微信模板消息日志Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 16:49:29
 */
@Service
public class ApiTemplateConfService {
    private TemplateConfDao templateConfMapper;

    public TemplateConfVo queryObject(Integer id) {
        return templateConfMapper.queryObject(id);
    }

    public List<TemplateConfVo> queryList(Map<String, Object> map) {
        return templateConfMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return templateConfMapper.queryTotal(map);
    }

}
