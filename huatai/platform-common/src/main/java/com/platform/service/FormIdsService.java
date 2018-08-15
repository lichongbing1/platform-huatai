package com.platform.service;

import com.platform.dao.FormIdsDao;
import com.platform.entity.FormIdsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 小程序form_id收集Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 15:32:50
 */
public interface FormIdsService {

    public FormIdsEntity queryObject(Long id);

    public List<FormIdsEntity> queryList(Map<String, Object> map);

    public int queryTotal(Map<String, Object> map);

    public int save(FormIdsEntity formIds);

    public int save(Long userId, String formId, Integer validNum);

    public int update(FormIdsEntity formIds);

    public int delete(Integer id);

    public int deleteBatch(Integer[] ids);

    public FormIdsEntity getFormIds(Long userId);

    public void releaseFormIds(Long formId);
}
