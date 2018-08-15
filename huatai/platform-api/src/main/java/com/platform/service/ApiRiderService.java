package com.platform.service;

import com.platform.dao.ApiRiderMapper;
import com.platform.dao.ApiRiderOrderMapper;
import com.platform.dao.ApiRiderRecruitMapper;
import com.platform.entity.RiderRecruitVo;
import com.platform.entity.RiderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ApiRiderService {
    @Autowired
    private ApiRiderMapper apiRiderMapper;
    @Autowired
    private ApiRiderOrderMapper apiRiderOrderMapper;
    @Autowired
    private ApiRiderRecruitMapper apiRiderRecruitMapper;

    public RiderVo queryObject(Long id) {
        return apiRiderMapper.queryObject(id);
    }

    public RiderVo queryByUserId(Long id) {
        return apiRiderMapper.queryByUserId(id);
    }


    public List<RiderVo> queryList(Map<String, Object> map) {
        return apiRiderMapper.queryList(map);
    }

    public int queryTotal(Map<String, Object> map) {
        return apiRiderMapper.queryTotal(map);
    }


    public void update(RiderVo riderVo) {
        apiRiderMapper.update(riderVo);
    }

    public void updateLocate(RiderVo riderVo) {
        apiRiderMapper.updateLocate(riderVo);
    }

    /**
     * 查询招聘信息
     *
     * @return
     */
    public RiderRecruitVo queryRecruit() {
        return apiRiderRecruitMapper.queryObject(1);
    }
}
