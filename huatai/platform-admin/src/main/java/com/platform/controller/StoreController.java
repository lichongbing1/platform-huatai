package com.platform.controller;

import com.platform.entity.StoreEntity;
import com.platform.service.StoreService;
import com.platform.utils.PageUtils;
import com.platform.utils.Query;
import com.platform.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-12-02 00:53:32
 */
@Controller
@RequestMapping("store")
public class StoreController {
    @Autowired
    private StoreService storeService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("store:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<StoreEntity> storeList = storeService.queryList(query);
        int total = storeService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(storeList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("store:info")
    @ResponseBody
    public R info(@PathVariable("id") Integer id) {
        StoreEntity store = storeService.queryObject(id);

        return R.ok().put("store", store);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("store:save")
    @ResponseBody
    public R save(@RequestBody StoreEntity store) {
        storeService.save(store);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("store:update")
    @ResponseBody
    public R update(@RequestBody StoreEntity store) {
        storeService.update(store);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("store:delete")
    @ResponseBody
    public R delete(@RequestBody Integer[] ids) {
        storeService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<StoreEntity> list = storeService.queryList(params);

        return R.ok().put("list", list);
    }
}
