package com.platform.service;

import com.platform.entity.SysNoticeUserEntity;

import java.util.List;
import java.util.Map;

/**
 * 通知和用户关系表Service接口
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-11-16 22:00:57
 */
public interface SysNoticeUserService {

    /**
     * 根据主键查询实体
     *
     * @param id 主键
     * @return 实体
     */
    SysNoticeUserEntity queryObject(String id);

    /**
     * 分页查询
     *
     * @param map 参数
     * @return list
     */
    List<SysNoticeUserEntity> queryList(Map<String, Object> map);

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
     * @param sysNoticeUser 实体
     * @return 保存条数
     */
    int save(SysNoticeUserEntity sysNoticeUser);

    /**
     * 根据主键更新实体
     *
     * @param sysNoticeUser 实体
     * @return 更新条数
     */
    int update(SysNoticeUserEntity sysNoticeUser);

    /**
     * 根据主键删除
     *
     * @param id
     * @return 删除条数
     */
    int delete(String id);

    /**
     * 根据主键批量删除
     *
     * @param ids
     * @return 删除条数
     */
    int deleteBatch(String[] ids);
}
