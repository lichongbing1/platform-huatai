package com.platform.dao;


import com.platform.entity.FormIdsEntity;
import org.apache.ibatis.annotations.Param;

/**
 * 小程序form_id收集Dao
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 15:32:50
 */
public interface FormIdsDao extends BaseDao<FormIdsEntity> {
    FormIdsEntity queryByUserId(@Param("userId") Long userId);
}
