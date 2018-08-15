package com.platform.controller;

import java.util.List;
import java.util.Map;

import com.platform.entity.SysNoticeUserEntity;
import com.platform.service.SysNoticeUserService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 通知和用户关系表Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-11-16 22:00:57
 */
@Controller
@RequestMapping("sys/noticeuser")
public class SysNoticeUserController {
    @Autowired
    private SysNoticeUserService sysNoticeUserService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:noticeuser:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<SysNoticeUserEntity> sysNoticeUserList = sysNoticeUserService.queryList(query);
        int total = sysNoticeUserService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(sysNoticeUserList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:noticeuser:info")
    @ResponseBody
    public R info(@PathVariable("id") String id) {
        SysNoticeUserEntity sysNoticeUser = sysNoticeUserService.queryObject(id);

        return R.ok().put("sysNoticeUser", sysNoticeUser);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:noticeuser:save")
    @ResponseBody
    public R save(@RequestBody SysNoticeUserEntity sysNoticeUser) {
        sysNoticeUserService.save(sysNoticeUser);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:noticeuser:update")
    @ResponseBody
    public R update(@RequestBody SysNoticeUserEntity sysNoticeUser) {
        sysNoticeUserService.update(sysNoticeUser);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:noticeuser:delete")
    @ResponseBody
    public R delete(@RequestBody String[]ids) {
        sysNoticeUserService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<SysNoticeUserEntity> list = sysNoticeUserService.queryList(params);

        return R.ok().put("list", list);
    }
}
