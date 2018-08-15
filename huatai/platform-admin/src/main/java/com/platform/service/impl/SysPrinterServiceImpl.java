package com.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.platform.dao.SysPrinterDao;
import com.platform.entity.SysPrinterEntity;
import com.platform.service.SysPrinterService;

/**
 * 飞鸽打印机Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 00:41:31
 */
@Service("sysPrinterService")
public class SysPrinterServiceImpl implements SysPrinterService {
    @Autowired
    private SysPrinterDao sysPrinterDao;

    @Override
    public SysPrinterEntity queryObject(Integer id) {
        return sysPrinterDao.queryObject(id);
    }

    @Override
    public List<SysPrinterEntity> queryList(Map<String, Object> map) {
        return sysPrinterDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return sysPrinterDao.queryTotal(map);
    }

    @Override
    public int save(SysPrinterEntity sysPrinter) {
        return sysPrinterDao.save(sysPrinter);
    }

    @Override
    public int update(SysPrinterEntity sysPrinter) {
        return sysPrinterDao.update(sysPrinter);
    }

    @Override
    public int delete(Integer id) {
        return sysPrinterDao.delete(id);
    }

    @Override
    public int deleteBatch(Integer[]ids) {
        return sysPrinterDao.deleteBatch(ids);
    }
}
