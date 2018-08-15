package com.platform.controller;

import java.util.List;
import java.util.Map;

import com.platform.entity.BargainOpenEntity;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.platform.service.BargainOpenService;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-26 22:18:35
 */
@Controller
@RequestMapping("bargainopen")
public class BargainOpenController {
    @Autowired
    private BargainOpenService bargainOpenService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bargainopen:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<BargainOpenEntity> bargainOpenList = bargainOpenService.queryList(query);
        int total = bargainOpenService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(bargainOpenList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bargainopen:info")
    @ResponseBody
    public R info(@PathVariable("id") Long id) {
        BargainOpenEntity bargainOpen = bargainOpenService.queryObject(id);

        return R.ok().put("bargainOpen", bargainOpen);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bargainopen:save")
    @ResponseBody
    public R save(@RequestBody BargainOpenEntity bargainOpen) {
        bargainOpenService.save(bargainOpen);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bargainopen:update")
    @ResponseBody
    public R update(@RequestBody BargainOpenEntity bargainOpen) {
        bargainOpenService.update(bargainOpen);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bargainopen:delete")
    @ResponseBody
    public R delete(@RequestBody Long[]ids) {
        bargainOpenService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<BargainOpenEntity> list = bargainOpenService.queryList(params);

        return R.ok().put("list", list);
    }
}
