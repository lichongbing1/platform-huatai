package com.platform.service;

import com.platform.entity.HelpTypeVo;
import com.platform.dao.ApiHelpTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 10:04:20
 */
@Service
public class ApiHelpTypeService {
    @Autowired
    private ApiHelpTypeMapper helpTypeDao;

    public HelpTypeVo queryObject(Integer id) {
        return helpTypeDao.queryObject(id);
    }

    public List<HelpTypeVo> queryList(Map<String, Object> map) {
        return helpTypeDao.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return helpTypeDao.queryTotal(map);
    }

    public int save(HelpTypeVo helpType) {
        return helpTypeDao.save(helpType);
    }

    public int update(HelpTypeVo helpType) {
        return helpTypeDao.update(helpType);
    }

    public int delete(Integer id) {
        return helpTypeDao.delete(id);
    }

    public int deleteBatch(Integer[] ids) {
        return helpTypeDao.deleteBatch(ids);
    }
}
