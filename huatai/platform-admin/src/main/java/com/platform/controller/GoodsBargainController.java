package com.platform.controller;

import java.util.List;
import java.util.Map;

import com.platform.utils.Query;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.platform.entity.GoodsBargainEntity;
import com.platform.service.GoodsBargainService;
import com.platform.utils.PageUtils;
import com.platform.utils.R;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-26 21:51:11
 */
@Controller
@RequestMapping("goodsbargain")
public class GoodsBargainController {
    @Autowired
    private GoodsBargainService goodsBargainService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goodsbargain:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<GoodsBargainEntity> goodsBargainList = goodsBargainService.queryList(query);
        int total = goodsBargainService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(goodsBargainList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goodsbargain:info")
    @ResponseBody
    public R info(@PathVariable("id") Integer id) {
        GoodsBargainEntity goodsBargain = goodsBargainService.queryObject(id);

        return R.ok().put("goodsBargain", goodsBargain);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("goodsbargain:save")
    @ResponseBody
    public R save(@RequestBody GoodsBargainEntity goodsBargain) {
        goodsBargainService.save(goodsBargain);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("goodsbargain:update")
    @ResponseBody
    public R update(@RequestBody GoodsBargainEntity goodsBargain) {
        goodsBargainService.update(goodsBargain);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("goodsbargain:delete")
    @ResponseBody
    public R delete(@RequestBody Integer[]ids) {
        goodsBargainService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<GoodsBargainEntity> list = goodsBargainService.queryList(params);

        return R.ok().put("list", list);
    }
}
