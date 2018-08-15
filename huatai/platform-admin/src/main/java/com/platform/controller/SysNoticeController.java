package com.platform.controller;

import java.util.List;
import java.util.Map;

import com.platform.entity.SysNoticeEntity;
import com.platform.service.SysNoticeService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 通知Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-11-16 22:00:56
 */
@Controller
@RequestMapping("sys/notice")
public class SysNoticeController {
    @Autowired
    private SysNoticeService sysNoticeService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:notice:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<SysNoticeEntity> sysNoticeList = sysNoticeService.queryList(query);
        int total = sysNoticeService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(sysNoticeList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:notice:info")
    @ResponseBody
    public R info(@PathVariable("id") String id) {
        SysNoticeEntity sysNotice = sysNoticeService.queryObject(id);

        return R.ok().put("sysNotice", sysNotice);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:notice:save")
    @ResponseBody
    public R save(@RequestBody SysNoticeEntity sysNotice) {
        sysNoticeService.save(sysNotice);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:notice:update")
    @ResponseBody
    public R update(@RequestBody SysNoticeEntity sysNotice) {
        sysNoticeService.update(sysNotice);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:notice:delete")
    @ResponseBody
    public R delete(@RequestBody String[]ids) {
        sysNoticeService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<SysNoticeEntity> list = sysNoticeService.queryList(params);

        return R.ok().put("list", list);
    }
}
