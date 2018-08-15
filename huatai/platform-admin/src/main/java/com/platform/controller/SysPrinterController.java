package com.platform.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.platform.entity.SysPrinterEntity;
import com.platform.service.SysPrinterService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;

/**
 * 飞鸽打印机Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 00:41:31
 */
@Controller
@RequestMapping("sys/printer")
public class SysPrinterController {
    @Autowired
    private SysPrinterService sysPrinterService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:printer:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<SysPrinterEntity> sysPrinterList = sysPrinterService.queryList(query);
        int total = sysPrinterService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(sysPrinterList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("sys:printer:info")
    @ResponseBody
    public R info(@PathVariable("id") Integer id) {
        SysPrinterEntity sysPrinter = sysPrinterService.queryObject(id);

        return R.ok().put("sysPrinter", sysPrinter);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:printer:save")
    @ResponseBody
    public R save(@RequestBody SysPrinterEntity sysPrinter) {
        sysPrinterService.save(sysPrinter);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:printer:update")
    @ResponseBody
    public R update(@RequestBody SysPrinterEntity sysPrinter) {
        sysPrinterService.update(sysPrinter);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:printer:delete")
    @ResponseBody
    public R delete(@RequestBody Integer[]ids) {
        sysPrinterService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<SysPrinterEntity> list = sysPrinterService.queryList(params);

        return R.ok().put("list", list);
    }
}
