package com.platform.controller;

import com.platform.service.QzOrderService;
import com.platform.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author zhouzhengde(CN)
 * @date 2017/12/4.
 */
@RestController
@RequestMapping("qz/order")
public class QzOrderController {
    @Autowired
    private QzOrderService qzOrderService;

    /**
     * 查看列表
     */
    @RequestMapping("/bargainProgressRemind")
    public R list(@RequestParam Map<String, Object> params) {
        qzOrderService.bargainProgressRemind();
        return R.ok();
    }
}
