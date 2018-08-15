package com.platform.service;

import com.platform.dao.ApiGoodsSpecificationMapper;
import com.platform.entity.GoodsSpecificationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class ApiGoodsSpecificationService {
    @Autowired
    private ApiGoodsSpecificationMapper apiGoodsSpecificationMapper;


    public GoodsSpecificationVo queryObject(Integer id) {
        return apiGoodsSpecificationMapper.queryObject(id);
    }


    public List<GoodsSpecificationVo> queryList(Map<String, Object> map) {
        return apiGoodsSpecificationMapper.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return apiGoodsSpecificationMapper.queryTotal(map);
    }


    public void save(GoodsSpecificationVo goods) {
        apiGoodsSpecificationMapper.save(goods);
    }


    public void update(GoodsSpecificationVo goods) {
        apiGoodsSpecificationMapper.update(goods);
    }


    public void delete(Integer id) {
        apiGoodsSpecificationMapper.delete(id);
    }


    public void deleteBatch(Integer[] ids) {
        apiGoodsSpecificationMapper.deleteBatch(ids);
    }

    public String[] queryNamesByIds(String[] ids) {
        String[] goodsSepcifitionValue = null;
        Map specificationParam = new HashMap();
        specificationParam.put("ids", ids);
        List<GoodsSpecificationVo> specificationEntities = queryList(specificationParam);
        goodsSepcifitionValue = new String[specificationEntities.size()];
        for (int i = 0; i < specificationEntities.size(); i++) {
            goodsSepcifitionValue[i] = specificationEntities.get(i).getValue();
        }
        return goodsSepcifitionValue;
    }

    /**
     * 按规格名称分组
     */
    public List<Map> queryByGoodsIdGroupByNames(Long goodsId) {
        Map specificationParam = new HashMap();
        specificationParam.put("fields", "gs.*, s.name");
        specificationParam.put("goods_id", goodsId);
        specificationParam.put("specification", true);
        specificationParam.put("sidx", "s.sort_order");
        specificationParam.put("order", "asc");
        List<GoodsSpecificationVo> goodsSpecificationEntityList = apiGoodsSpecificationMapper.queryList(specificationParam);

        List<Map> specificationList = new ArrayList();
        //按规格名称分组
        for (int i = 0; i < goodsSpecificationEntityList.size(); i++) {
            GoodsSpecificationVo specItem = goodsSpecificationEntityList.get(i);
            //
            List<GoodsSpecificationVo> tempList = null;
            for (int j = 0; j < specificationList.size(); j++) {
                if (specificationList.get(j).get("specification_id").equals(specItem.getSpecification_id())) {
                    tempList = (List<GoodsSpecificationVo>) specificationList.get(j).get("valueList");
                    break;
                }
            }
            //
            if (null == tempList) {
                Map temp = new HashMap();
                temp.put("specification_id", specItem.getSpecification_id());
                temp.put("name", specItem.getName());
                tempList = new ArrayList();
                tempList.add(specItem);
                temp.put("valueList", tempList);
                specificationList.add(temp);
            } else {
                for (int j = 0; j < specificationList.size(); j++) {
                    if (specificationList.get(j).get("specification_id").equals(specItem.getSpecification_id())) {
                        tempList = (List<GoodsSpecificationVo>) specificationList.get(j).get("valueList");
                        tempList.add(specItem);
                        break;
                    }
                }
            }
        }
        return specificationList;
    }

}
