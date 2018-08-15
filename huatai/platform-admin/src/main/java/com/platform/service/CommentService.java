package com.platform.service;

import com.platform.entity.CommentEntity;

import java.util.List;
import java.util.Map;

/**
 * Service接口
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-28 17:03:40
 */
public interface CommentService {

    /**
     * 根据主键查询实体
     *
     * @param id 主键
     * @return 实体
     */
    CommentEntity queryObject(Integer id);

    /**
     * 分页查询
     *
     * @param map 参数
     * @return list
     */
    List<CommentEntity> queryList(Map<String, Object> map);

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
     * @param comment 实体
     * @return 保存条数
     */
    int save(CommentEntity comment);

    /**
     * 根据主键更新实体
     *
     * @param comment 实体
     * @return 更新条数
     */
    int update(CommentEntity comment);

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

    /**
     * 修改状态
     *
     * @param comment
     * @return
     */
    int toggleStatus(CommentEntity comment);

    /**
     * 批量修改状态
     *
     * @param ids
     * @return
     */
    int toggleStatusBatch(Integer[] ids);
}
