package com.platform.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.platform.entity.RiderEntity;
import com.platform.service.RiderService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2018-03-05 17:48:57
 */
@Controller
@RequestMapping("rider")
public class RiderController {
    @Autowired
    private RiderService riderService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("rider:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<RiderEntity> riderList = riderService.queryList(query);
        int total = riderService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(riderList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("rider:info")
    @ResponseBody
    public R info(@PathVariable("id") Integer id) {
        RiderEntity rider = riderService.queryObject(id);

        return R.ok().put("rider", rider);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("rider:save")
    @ResponseBody
    public R save(@RequestBody RiderEntity rider) {
        riderService.save(rider);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("rider:update")
    @ResponseBody
    public R update(@RequestBody RiderEntity rider) {
        riderService.update(rider);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("rider:delete")
    @ResponseBody
    public R delete(@RequestBody Integer[] ids) {
        riderService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<RiderEntity> list = riderService.queryList(params);

        return R.ok().put("list", list);
    }
}
