package com.platform.controller;

import java.util.List;
import java.util.Map;

import com.platform.entity.ProductEntity;
import com.platform.service.ProductService;
import com.platform.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.platform.entity.ProductStoreRelaEntity;
import com.platform.service.ProductStoreRelaService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-27 19:12:46
 */
@Controller
@RequestMapping("productstorerela")
public class ProductStoreRelaController {
    @Autowired
    private ProductStoreRelaService productStoreRelaService;
    @Autowired
    private ProductService productService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<ProductStoreRelaEntity> productStoreRelaList = productStoreRelaService.queryList(query);
        int total = productStoreRelaService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(productStoreRelaList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    public R info(@PathVariable("id") Integer id) {
        ProductStoreRelaEntity productStoreRela = productStoreRelaService.queryObject(id);

        return R.ok().put("productStoreRela", productStoreRela);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("productstorerela:save")
    @ResponseBody
    public R save(@RequestBody ProductStoreRelaEntity productStoreRela) {
//        if (null == productStoreRela.getProductId() && StringUtils.isNotEmpty(productStoreRela.getProductSn())) {
//            ProductEntity productEntity = productService.queryObjectBySn(productStoreRela.getProductSn());
//            productStoreRela.setProductId(productEntity.getId());
//            productStoreRela.setGoodsId(productEntity.getGoodsId());
//        }
        if (null == productStoreRela.getProductId() || null == productStoreRela.getGoodsId()
                || null == productStoreRela.getStoreId()) {
            return R.error("信息不全，保存失败");
        }
        ProductStoreRelaEntity productStoreRelaDb = productStoreRelaService.queryByStoreIdProductId(productStoreRela.getStoreId(), productStoreRela.getProductId());
        if (null != productStoreRelaDb) {
            productStoreRela.setId(productStoreRelaDb.getId());
            productStoreRelaService.update(productStoreRela);
        } else {
            productStoreRelaService.save(productStoreRela);
        }
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("productstorerela:update")
    @ResponseBody
    public R update(@RequestBody ProductStoreRelaEntity productStoreRela) {
        if (null == productStoreRela.getProductId() || null == productStoreRela.getGoodsId()
                || null == productStoreRela.getStoreId()) {
            return R.error("信息不全，保存失败");
        }
        productStoreRelaService.update(productStoreRela);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("productstorerela:delete")
    @ResponseBody
    public R delete(@RequestBody Integer[] ids) {
        productStoreRelaService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<ProductStoreRelaEntity> list = productStoreRelaService.queryList(params);

        return R.ok().put("list", list);
    }
}
