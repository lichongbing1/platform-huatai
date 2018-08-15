package com.platform.controller;

import java.util.List;
import java.util.Map;

import com.platform.service.BargainOpenRecordService;
import com.platform.utils.Query;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.platform.entity.BargainOpenRecordEntity;
import com.platform.utils.PageUtils;
import com.platform.utils.R;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-08 23:00:10
 */
@Controller
@RequestMapping("bargainopenrecord")
public class BargainOpenRecordController {
    @Autowired
    private BargainOpenRecordService bargainOpenRecordService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bargainopenrecord:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<BargainOpenRecordEntity> bargainOpenRecordList = bargainOpenRecordService.queryList(query);
        int total = bargainOpenRecordService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(bargainOpenRecordList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bargainopenrecord:info")
    @ResponseBody
    public R info(@PathVariable("id") Long id) {
        BargainOpenRecordEntity bargainOpenRecord = bargainOpenRecordService.queryObject(id);

        return R.ok().put("bargainOpenRecord", bargainOpenRecord);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bargainopenrecord:save")
    @ResponseBody
    public R save(@RequestBody BargainOpenRecordEntity bargainOpenRecord) {
        bargainOpenRecordService.save(bargainOpenRecord);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bargainopenrecord:update")
    @ResponseBody
    public R update(@RequestBody BargainOpenRecordEntity bargainOpenRecord) {
        bargainOpenRecordService.update(bargainOpenRecord);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bargainopenrecord:delete")
    @ResponseBody
    public R delete(@RequestBody Long[]ids) {
        bargainOpenRecordService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<BargainOpenRecordEntity> list = bargainOpenRecordService.queryList(params);

        return R.ok().put("list", list);
    }
}
