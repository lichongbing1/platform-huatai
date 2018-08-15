package com.platform.controller;

import java.util.List;
import java.util.Map;

import com.platform.entity.GoodsCrashEntity;
import com.platform.service.GoodsCrashService;
import com.platform.utils.Query;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.platform.utils.PageUtils;
import com.platform.utils.R;

/**
 * 商品搭配减Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-08-30 18:35:41
 */
@RestController
@RequestMapping("goodscrash")
public class GoodsCrashController {
    @Autowired
    private GoodsCrashService goodsCrashService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goodscrash:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<GoodsCrashEntity> goodsCrashList = goodsCrashService.queryList(query);
        int total = goodsCrashService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(goodsCrashList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goodscrash:info")
    public R info(@PathVariable("id") Integer id) {
        GoodsCrashEntity goodsCrash = goodsCrashService.queryObject(id);

        return R.ok().put("goodsCrash", goodsCrash);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("goodscrash:save")
    public R save(@RequestBody GoodsCrashEntity goodsCrash) {
        goodsCrashService.save(goodsCrash);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("goodscrash:update")
    public R update(@RequestBody GoodsCrashEntity goodsCrash) {
        goodsCrashService.update(goodsCrash);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("goodscrash:delete")
    public R delete(@RequestBody Integer[]ids) {
        goodsCrashService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<GoodsCrashEntity> list = goodsCrashService.queryList(params);

        return R.ok().put("list", list);
    }
}
