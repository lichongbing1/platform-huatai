package com.platform.service;

import com.platform.entity.RiderRecruitEntity;

import java.util.List;
import java.util.Map;

/**
 * 骑手招聘信息设置Service接口
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 20:43:31
 */
public interface RiderRecruitService {

    /**
     * 根据主键查询实体
     *
     * @param id 主键
     * @return 实体
     */
    RiderRecruitEntity queryObject(Integer id);

    /**
     * 分页查询
     *
     * @param map 参数
     * @return list
     */
    List<RiderRecruitEntity> queryList(Map<String, Object> map);

    /**
     * 分页统计总数
     *
     * @param map 参数
     * @return 总数
     */
    int queryTotal(Map<String, Object> map);

    /**
     * 保存实体
     *
     * @param riderRecruit 实体
     * @return 保存条数
     */
    int save(RiderRecruitEntity riderRecruit);

    /**
     * 根据主键更新实体
     *
     * @param riderRecruit 实体
     * @return 更新条数
     */
    int update(RiderRecruitEntity riderRecruit);

    /**
     * 根据主键删除
     *
     * @param id
     * @return 删除条数
     */
    int delete(Integer id);

    /**
     * 根据主键批量删除
     *
     * @param ids
     * @return 删除条数
     */
    int deleteBatch(Integer[] ids);
}
