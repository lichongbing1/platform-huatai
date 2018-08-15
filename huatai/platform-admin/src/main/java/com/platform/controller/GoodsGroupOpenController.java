package com.platform.controller;

import com.platform.entity.GoodsGroupOpenEntity;
import com.platform.service.GoodsGroupOpenService;
import com.platform.utils.Query;
import com.platform.utils.PageUtils;
import com.platform.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Controller
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-10-23 22:06:59
 */
@Controller
@RequestMapping("goodsgroupopen")
public class GoodsGroupOpenController {
    @Autowired
    private GoodsGroupOpenService goodsGroupOpenService;

    /**
     * 查看列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("goodsgroupopen:list")
    @ResponseBody
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<GoodsGroupOpenEntity> goodsGroupOpenList = goodsGroupOpenService.queryList(query);
        int total = goodsGroupOpenService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(goodsGroupOpenList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("goodsgroupopen:info")
    @ResponseBody
    public R info(@PathVariable("id") Long id) {
        GoodsGroupOpenEntity goodsGroupOpen = goodsGroupOpenService.queryObject(id);

        return R.ok().put("goodsGroupOpen", goodsGroupOpen);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("goodsgroupopen:save")
    @ResponseBody
    public R save(@RequestBody GoodsGroupOpenEntity goodsGroupOpen) {
        goodsGroupOpenService.save(goodsGroupOpen);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("goodsgroupopen:update")
    @ResponseBody
    public R update(@RequestBody GoodsGroupOpenEntity goodsGroupOpen) {
        goodsGroupOpenService.update(goodsGroupOpen);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("goodsgroupopen:delete")
    @ResponseBody
    public R delete(@RequestBody Long[] ids) {
        goodsGroupOpenService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 查看所有列表
     */
    @RequestMapping("/queryAll")
    @ResponseBody
    public R queryAll(@RequestParam Map<String, Object> params) {

        List<GoodsGroupOpenEntity> list = goodsGroupOpenService.queryList(params);

        return R.ok().put("list", list);
    }

    /**
     * 取消团购订单
     */
    @RequestMapping("/cancelGroup")
    @RequiresPermissions("goodsgroupopen:update")
    @ResponseBody
    public R cancelGroup(@RequestBody Integer id) {
        int result = goodsGroupOpenService.cancelGroup(id);
        if (result == 0) {
            return R.error("取消失败");
        }
        return R.ok();
    }

}
