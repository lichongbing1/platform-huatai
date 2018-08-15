package com.platform.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.platform.entity.RiderRecruitEntity;
import com.platform.service.RiderRecruitService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;

/**
 * 骑手招聘信息设置Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-16 20:43:31
 */
@Controller
@RequestMapping("riderrecruit")
public class RiderRecruitController {
    @Autowired
    private RiderRecruitService riderRecruitService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("riderrecruit:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<RiderRecruitEntity> riderRecruitList = riderRecruitService.queryList(query);
        int total = riderRecruitService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(riderRecruitList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("riderrecruit:info")
    @ResponseBody
    public R info(@PathVariable("id") Integer id) {
        RiderRecruitEntity riderRecruit = riderRecruitService.queryObject(id);

        return R.ok().put("riderRecruit", riderRecruit);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("riderrecruit:save")
    @ResponseBody
    public R save(@RequestBody RiderRecruitEntity riderRecruit) {
        riderRecruitService.save(riderRecruit);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("riderrecruit:update")
    @ResponseBody
    public R update(@RequestBody RiderRecruitEntity riderRecruit) {
        riderRecruitService.update(riderRecruit);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("riderrecruit:delete")
    @ResponseBody
    public R delete(@RequestBody Integer[] ids) {
        riderRecruitService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<RiderRecruitEntity> list = riderRecruitService.queryList(params);

        return R.ok().put("list", list);
    }
}
