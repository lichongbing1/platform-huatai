package com.platform.service.impl;

import com.platform.dao.*;
import com.platform.entity.*;
import com.platform.utils.RRException;
import com.platform.utils.ShiroUtils;
import com.platform.annotation.DataFilter;
import com.platform.service.GoodsService;
import com.platform.utils.StringUtils;
import com.platform.utils.excel.ExcelImport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service实现类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-21 21:19:49
 */
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private GoodsAttributeDao goodsAttributeDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private GoodsGalleryDao goodsGalleryDao;
    @Autowired
    private GoodsSpecificationDao goodsSpecificationDao;
    @Autowired
    private ProductStoreRelaDao productStoreRelaDao;
    @Autowired
    private StoreDao storeDao;
    @Autowired
    private GoodsGroupDao goodsGroupDao;
    @Autowired
    private GoodsBargainDao goodsBargainDao;

    @Override
    public GoodsEntity queryObject(Integer id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("goodsId", id);
        List<GoodsAttributeEntity> attributeEntities = goodsAttributeDao.queryList(map);
        List<ProductEntity> productEntityList = productDao.queryList(map);
        GoodsEntity entity = goodsDao.queryObject(id);
        entity.setAttributeEntityList(attributeEntities);
        entity.setProductEntityList(productEntityList);
        return entity;
    }

    @Override
    @DataFilter(userAlias = "mall_goods.create_user_id", deptAlias = "mall_goods.create_user_dept_id")
    public List<GoodsEntity> queryList(Map<String, Object> map) {
        return goodsDao.queryList(map);
    }

    @Override
    @DataFilter(userAlias = "mall_goods.create_user_id", deptAlias = "mall_goods.create_user_dept_id")
    public int queryTotal(Map<String, Object> map) {
        return goodsDao.queryTotal(map);
    }

    @Override
    @Transactional
    public int save(GoodsEntity goods) {
        SysUserEntity user = ShiroUtils.getUserEntity();
        Map<String, Object> map = new HashMap<>();
        map.put("name", goods.getName());
        List<GoodsEntity> list = queryList(map);
        if (null != list && list.size() != 0) {
            throw new RRException("商品名称已存在！");
        }
        Long id = goodsDao.queryMaxId() + 1;
        goods.setId(id);

        goods.setAddTime(new Date());

        //保存商品详情页面显示的属性
        List<GoodsAttributeEntity> attributeEntityList = goods.getAttributeEntityList();
        if (null != attributeEntityList && attributeEntityList.size() > 0) {
            for (GoodsAttributeEntity item : attributeEntityList) {
                if (null != item.getGoodsId()) {
                    item.setGoodsId(id);
                    goodsAttributeDao.save(item);
                }
            }
        }

        // 产品更新
        List<ProductEntity> productEntityList = goods.getProductEntityList();
        if (null != productEntityList && productEntityList.size() > 0) {
            for (ProductEntity productEntity : productEntityList) {
                if (1 == productEntity.getIsDelete()) {
                    productDao.delete(productEntity);
                    if (null != productEntity.getGoodsSpecificationIds()) {
                        goodsSpecificationDao.delete(productEntity.getGoodsSpecificationIds());
                    }
                }
                if (StringUtils.isNullOrEmpty(productEntity.getGoodsSn())) {
                    throw new RRException("产品编码不能为空！");
                }
                // 判断是否goods_sn重复
                ProductEntity productDb = productDao.queryObjectBySn(productEntity.getGoodsSn());
                if (null != productDb && !productDb.getId().equals(productEntity.getId())) {
                    throw new RRException("产品编码重复！");  // 重复不操作
                }
                goods.setPrimaryProductId(productEntity.getId());
                GoodsSpecificationEntity specificationEntity = new GoodsSpecificationEntity();
                // 规格
                if (StringUtils.isNullOrEmpty(productEntity.getGoodsSpecificationIds())
                        && StringUtils.isNotEmpty(productEntity.getGoodsSpecificationNameValue())) {
                    specificationEntity.setGoodsId(goods.getId());
                    specificationEntity.setSpecificationId(1); // 规格写死
                    specificationEntity.setValue(productEntity.getGoodsSpecificationNameValue());
                    goodsSpecificationDao.save(specificationEntity);
                    productEntity.setGoodsSpecificationNameValue(specificationEntity.getId() + "");
                } else if (StringUtils.isNotEmpty(productEntity.getGoodsSpecificationIds())) {
                    specificationEntity = goodsSpecificationDao.queryObject(productEntity.getGoodsSpecificationIds());
                    specificationEntity.setValue(productEntity.getGoodsSpecificationNameValue());
                    goodsSpecificationDao.update(specificationEntity);
                }
                if (null != productEntity.getId()) {
                    productDao.save(productEntity);
                } else {
                    productDao.update(productEntity);
                }
                // default
                if (null == goods.getPrimaryProductId()) {
                    goods.setPrimaryProductId(productEntity.getId());
                } else if (productEntity.getGoodsDefault() == 1) {
                    goods.setPrimaryProductId(productEntity.getId());
                }
            }
            // default
            for (ProductEntity productEntity : productEntityList) {
                if (null == goods.getPrimaryProductId() && 1 != productEntity.getIsDelete()) {
                    goods.setPrimaryProductId(productEntity.getId());
                    break;
                }
            }
        }

        //商品轮播图
        List<GoodsGalleryEntity> galleryEntityList = goods.getGoodsImgList();
        if (null != galleryEntityList && galleryEntityList.size() > 0) {
            for (GoodsGalleryEntity galleryEntity : galleryEntityList) {
                galleryEntity.setGoodsId(id);
                goodsGalleryDao.save(galleryEntity);
            }
        }

        goods.setIsDelete(0);
        goods.setCreateUserId(user.getUserId());
        goods.setUpdateUserId(user.getUserId());
        goods.setUpdateTime(new Date());
        return goodsDao.save(goods);
    }

    @Override
    @Transactional
    public int update(GoodsEntity goods) {
        Map<String, Long> map = new HashMap<String, Long>();
        map.put("goodsId", goods.getId());

        SysUserEntity user = ShiroUtils.getUserEntity();
        List<GoodsAttributeEntity> attributeEntityList = goods.getAttributeEntityList();

        //商品参数
        if (null != attributeEntityList && attributeEntityList.size() > 0) {
            for (GoodsAttributeEntity goodsAttributeEntity : attributeEntityList) {
                if (null == goodsAttributeEntity.getId() && StringUtils.isNullOrEmpty(goodsAttributeEntity.getAttributeId())) {
                    continue;
                }
                if (goodsAttributeEntity.getIsDelete() == 1) {
                    goodsAttributeDao.delete(goodsAttributeEntity);
                } else if (null != goodsAttributeEntity.getId()) {
                    goodsAttributeEntity.setGoodsId(goods.getId());
                    goodsAttributeDao.update(goodsAttributeEntity);
                } else {
                    goodsAttributeEntity.setGoodsId(goods.getId());
                    goodsAttributeDao.save(goodsAttributeEntity);
                }
            }
        }

        // 产品更新
        List<ProductEntity> productEntityList = goods.getProductEntityList();
        if (null != productEntityList && productEntityList.size() > 0) {
            for (ProductEntity productEntity : productEntityList) {
                if (1 == productEntity.getIsDelete()) {
                    if (null == productEntity.getId()) {
                        continue;
                    }
                    productDao.delete(productEntity);
                    if (null != productEntity.getGoodsSpecificationIds()) {
                        goodsSpecificationDao.delete(productEntity.getGoodsSpecificationIds());
                    }
                    continue;
                }
                if (StringUtils.isNullOrEmpty(productEntity.getGoodsSn())) {
                    throw new RRException("产品编码不能为空！");
                }
                // 判断是否goods_sn重复
                ProductEntity productDb = productDao.queryObjectBySn(productEntity.getGoodsSn());
                if (null != productDb && !productDb.getId().equals(productEntity.getId())) {
                    throw new RRException("产品编码重复！");  // 重复不操作
                }
                GoodsSpecificationEntity specificationEntity = new GoodsSpecificationEntity();
                // 规格
                if (StringUtils.isNullOrEmpty(productEntity.getGoodsSpecificationIds())
                        && StringUtils.isNotEmpty(productEntity.getGoodsSpecificationNameValue())) {
                    specificationEntity.setGoodsId(goods.getId());
                    specificationEntity.setSpecificationId(1); // 规格写死
                    specificationEntity.setValue(productEntity.getGoodsSpecificationNameValue());
                    goodsSpecificationDao.save(specificationEntity);
                    productEntity.setGoodsSpecificationIds(specificationEntity.getId() + "");
                } else if (StringUtils.isNotEmpty(productEntity.getGoodsSpecificationIds())) {
                    specificationEntity = goodsSpecificationDao.queryObject(productEntity.getGoodsSpecificationIds());
                    specificationEntity.setValue(productEntity.getGoodsSpecificationNameValue());
                    goodsSpecificationDao.update(specificationEntity);
                }
                if (null == productEntity.getId()) {
                    productEntity.setGoodsId(goods.getId());
                    productDao.save(productEntity);
                } else {
                    productDao.update(productEntity);
                }
                // default
                if (null == goods.getPrimaryProductId()) {
                    goods.setPrimaryProductId(productEntity.getId());
                } else if (productEntity.getGoodsDefault() == 1) {
                    goods.setPrimaryProductId(productEntity.getId());
                }
            }
            // default
            for (ProductEntity productEntity : productEntityList) {
                if (null == goods.getPrimaryProductId() && 1 != productEntity.getIsDelete()) {
                    goods.setPrimaryProductId(productEntity.getId());
                    break;
                }
            }
        }

        //商品轮播图
        List<GoodsGalleryEntity> galleryEntityList = goods.getGoodsImgList();
        if (null != galleryEntityList && galleryEntityList.size() > 0)

        {
            for (GoodsGalleryEntity galleryEntity : galleryEntityList) {
                if (galleryEntity.getIsDelete() == 1) {
                    goodsGalleryDao.delete(galleryEntity);
                } else if (null != galleryEntity.getId()) {
                    galleryEntity.setGoodsId(goods.getId());
                    goodsGalleryDao.update(galleryEntity);
                } else {
                    galleryEntity.setGoodsId(goods.getId());
                    goodsGalleryDao.save(galleryEntity);
                }
            }
        }
        goods.setUpdateUserId(user.getUserId());
        goods.setUpdateTime(new

                Date());
        return goodsDao.update(goods);
    }

    @Override
    public int delete(Integer id) {
        SysUserEntity user = ShiroUtils.getUserEntity();
        GoodsEntity goodsEntity = goodsDao.queryObject(id);
        goodsEntity.setIsDelete(1);
        goodsEntity.setIsOnSale(0);
        goodsEntity.setUpdateUserId(user.getUserId());
        goodsEntity.setUpdateTime(new Date());
        //更新团购和砍价
        Map params = new HashMap();
        params.put("goodsId", id);
        List<GoodsGroupEntity> groupVos = goodsGroupDao.queryList(params);
        if (null != groupVos && groupVos.size() > 0) {
            for (GoodsGroupEntity groupVo : groupVos) {
                groupVo.setOpenStatus(3);
                goodsGroupDao.update(groupVo);
            }
        }
        List<GoodsBargainEntity> bargainVos = goodsBargainDao.queryList(params);
        if (null != bargainVos && bargainVos.size() > 0) {
            for (GoodsBargainEntity bargainVo : bargainVos) {
                bargainVo.setIsDelete(1);
                goodsBargainDao.update(bargainVo);
            }
        }
        return goodsDao.update(goodsEntity);
    }

    @Override
    @Transactional
    public int deleteBatch(Integer[] ids) {
        int result = 0;
        for (Integer id : ids) {
            result += delete(id);
        }
        return result;
    }

    @Override
    @Transactional
    public int back(Integer[] ids) {
        SysUserEntity user = ShiroUtils.getUserEntity();
        int result = 0;
        for (Integer id : ids) {
            GoodsEntity goodsEntity = queryObject(id);
            goodsEntity.setIsDelete(0);
            goodsEntity.setIsOnSale(1);
            goodsEntity.setUpdateUserId(user.getUserId());
            goodsEntity.setUpdateTime(new Date());
            result += goodsDao.update(goodsEntity);
        }
        return result;
    }

    @Override
    public int enSale(Integer id) {
        SysUserEntity user = ShiroUtils.getUserEntity();
        GoodsEntity goodsEntity = queryObject(id);
        if (1 == goodsEntity.getIsOnSale()) {
            throw new RRException("此商品已处于上架状态！");
        }
        goodsEntity.setIsOnSale(1);
        goodsEntity.setUpdateUserId(user.getUserId());
        goodsEntity.setUpdateTime(new Date());
        return goodsDao.update(goodsEntity);
    }

    @Override
    public int unSale(Integer id) {
        SysUserEntity user = ShiroUtils.getUserEntity();
        GoodsEntity goodsEntity = queryObject(id);
        if (0 == goodsEntity.getIsOnSale()) {
            throw new RRException("此商品已处于下架状态！");
        }
        goodsEntity.setIsOnSale(0);
        goodsEntity.setUpdateUserId(user.getUserId());
        goodsEntity.setUpdateTime(new Date());
        return goodsDao.update(goodsEntity);
    }

    @Override
    public int enSaleBatch(Integer[] ids) {
        int result = 0;
        SysUserEntity user = ShiroUtils.getUserEntity();
        for (Integer id : ids) {
            GoodsEntity goodsEntity = queryObject(id);
            goodsEntity.setIsOnSale(1);
            goodsEntity.setUpdateUserId(user.getUserId());
            goodsEntity.setUpdateTime(new Date());
            result += goodsDao.update(goodsEntity);
        }
        return result;
    }

    @Override
    public int unSaleBatch(Integer[] ids) {
        int result = 0;
        SysUserEntity user = ShiroUtils.getUserEntity();
        for (Integer id : ids) {
            GoodsEntity goodsEntity = queryObject(id);
            goodsEntity.setIsOnSale(0);
            goodsEntity.setUpdateUserId(user.getUserId());
            goodsEntity.setUpdateTime(new Date());
            result += goodsDao.update(goodsEntity);
        }
        return result;
    }

    @Override
    @Transactional
    public int uploadExcel(MultipartFile file) {
        SysUserEntity user = ShiroUtils.getUserEntity();

        List<String[]> list = ExcelImport.getExcelData(file);
        // 取门店名称
        StoreEntity storeEntity = storeDao.queryObjectByName(list.get(0)[3]);
        if (null == storeEntity) {
            return 0;
        }
        //去除表头两行、底部合计
        if (list != null && list.size() > 3) {
            ProductStoreRelaEntity storeRelaEntity;
            ProductEntity productEntity;
            for (int i = 2; i < list.size() - 1; i++) {
                String[] item = list.get(i);
                String goodsSn = item[0];
                productEntity = productDao.queryObjectBySn(goodsSn);
                if (StringUtils.isNullOrEmpty(goodsSn)) {
                    continue;
                }
                if (null == productEntity || null == productEntity.getId()) {
                    continue;
                }
                storeRelaEntity = productStoreRelaDao.queryByStoreIdProductId(storeEntity.getId(), productEntity.getId());
                if (null != storeRelaEntity && null != storeRelaEntity.getId()) {
                    storeRelaEntity.setRetailPrice(new BigDecimal(item[6]));
                    storeRelaEntity.setStockNum(Integer.valueOf(item[3].replace(".00", "")));
                    storeRelaEntity.setStockPrice(new BigDecimal(item[4]));
                    productStoreRelaDao.update(storeRelaEntity);
                } else {
                    storeRelaEntity = new ProductStoreRelaEntity();
                    storeRelaEntity.setGoodsId(productEntity.getGoodsId());
                    storeRelaEntity.setProductId(productEntity.getId());
                    storeRelaEntity.setRetailPrice(new BigDecimal(item[6]));
                    storeRelaEntity.setMarketPrice(new BigDecimal(item[6]));
                    storeRelaEntity.setStockNum(Integer.valueOf(item[3]));
                    storeRelaEntity.setStockPrice(new BigDecimal(item[4]));
                    storeRelaEntity.setStoreId(storeEntity.getId());
                    productStoreRelaDao.save(storeRelaEntity);
                }
            }
        }
        return 1;
    }

    public GoodsEntity queryObjectBySn(String goodsSn) {
        return goodsDao.queryObjectBySn(goodsSn);
    }
}
