package com.platform.service.impl;

import com.platform.dao.FormIdsDao;
import com.platform.entity.FormIdsEntity;
import com.platform.service.FormIdsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

/**
 * 小程序form_id收集Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 15:32:50
 */
@Service("formidsService")
public class FormIdsServiceImpl implements FormIdsService {
    @Autowired
    private FormIdsDao formIdsDao;

    @Override
    public FormIdsEntity queryObject(Long id) {
        return formIdsDao.queryObject(id);
    }

    @Override
    public List<FormIdsEntity> queryList(Map<String, Object> map) {
        return formIdsDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return formIdsDao.queryTotal(map);
    }

    @Override
    public int save(FormIdsEntity formIds) {
        return formIdsDao.save(formIds);
    }

    @Override
    public int update(FormIdsEntity formIds) {
        return formIdsDao.update(formIds);
    }

    @Override
    public int delete(Integer id) {
        return formIdsDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return formIdsDao.deleteBatch(ids);
    }

    @Override
    public FormIdsEntity getFormIds(Long userId) {
        return formIdsDao.queryByUserId(userId);
    }

    @Override
    public void releaseFormIds(Long formId) {
        FormIdsEntity entity = queryObject(formId);
        entity.setValidNum(entity.getValidNum() - 1);
        formIdsDao.update(entity);
    }

    @Override
    public int save(Long userId, String formId, Integer validNum) {
        // 保存form_id
        FormIdsEntity formIdsVo = new FormIdsEntity();
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, 7);
        formIdsVo.setExpireTime(calendar.getTime());
        formIdsVo.setFormId(formId);
        formIdsVo.setValidNum(3);
        formIdsVo.setUserId(userId);
        return formIdsDao.save(formIdsVo);
    }
}
