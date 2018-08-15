package com.platform.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.platform.dao.ApiCommentMapper;
import com.platform.dao.ApiCommentPictureMapper;
import com.platform.dao.ApiOrderMapper;
import com.platform.entity.CommentPictureVo;
import com.platform.entity.CommentVo;
import com.platform.entity.OrderVo;
import com.platform.util.ApiBaseAction;
import com.platform.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service
public class ApiCommentService {
    @Autowired
    private ApiCommentMapper commentDao;
    @Autowired
    private ApiCommentPictureMapper commentPictureDao;
    @Autowired
    private ApiOrderMapper apiOrderMapper;

    public CommentVo queryObject(Integer id) {
        return commentDao.queryObject(id);
    }


    public List<CommentVo> queryList(Map<String, Object> map) {
        return commentDao.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return commentDao.queryTotal(map);
    }

    public int queryhasPicTotal(Map<String, Object> map) {
        return commentDao.queryhasPicTotal(map);
    }

    @Transactional
    public int save(CommentVo comment) {
        return commentDao.save(comment);
    }


    @Transactional
    public Long save(JSONObject jsonParam, Long userId) {
        Integer typeId = jsonParam.getInteger("typeId");
        Integer mannerScore = jsonParam.getInteger("mannerScore");
        Integer speedScore = jsonParam.getInteger("speedScore");
        Long orderId = jsonParam.getLong("orderId");
        JSONArray goodsList = jsonParam.getJSONArray("goodsList");
        if (goodsList.size() > 0) {
            for (int i = 0; i < goodsList.size(); i++) {
                JSONObject goodsObj = goodsList.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                String comment = goodsObj.getString("comment");
                String goods_name = goodsObj.getString("goods_name");
                String goods_specification_name_value = goodsObj.getString("goods_specification_name_value");
                JSONArray pics = goodsObj.getJSONArray("pics");
                Long goods_id = goodsObj.getLong("goods_id");
                Long product_id = goodsObj.getLong("product_id");
                Integer score = goodsObj.getInteger("score");
                //
                CommentVo commentEntity = new CommentVo();
                commentEntity.setTypeId(typeId);
                commentEntity.setValueId(goods_id);
                commentEntity.setContent(comment);
                commentEntity.setStatus(0);
                commentEntity.setDeliveryLevel(speedScore);
                commentEntity.setEvalLevel(mannerScore);
                commentEntity.setGoodsSpecifitionNameValue(goods_specification_name_value);
                commentEntity.setGoodsLevel(score);
                commentEntity.setUserId(userId);
                commentEntity.setAddTime(System.currentTimeMillis() / 1000);
                commentEntity.setProductId(product_id);
                commentEntity.setOrderId(orderId);
                commentEntity.setValueName(goods_name);
                commentDao.save(commentEntity);
                // pics
                if (null == pics || pics.size() < 1) {
                    continue;
                }
                for (int index = 0; index < pics.size(); index++) {
                    CommentPictureVo pictureVo = new CommentPictureVo();
                    pictureVo.setComment_id(commentEntity.getId());
                    pictureVo.setPic_url(pics.getString(index));
                    pictureVo.setSort_order(index + 1);
                    commentPictureDao.save(pictureVo);
                }
            }
        }
        // 更新订单评价
        OrderVo orderVo = apiOrderMapper.queryObject(orderId);
        orderVo.setComment_count(orderVo.getComment_count() + 1);
        apiOrderMapper.update(orderVo);
        return orderId;
    }


    public void update(CommentVo comment) {
        commentDao.update(comment);
    }


    public void delete(Integer id) {
        commentDao.delete(id);
    }


    public void deleteBatch(Integer[] ids) {
        commentDao.deleteBatch(ids);
    }

    public List<Map> queryOrderTotal(Map<String, Object> map) {
        return commentDao.queryOrderTotal(map);
    }

}
