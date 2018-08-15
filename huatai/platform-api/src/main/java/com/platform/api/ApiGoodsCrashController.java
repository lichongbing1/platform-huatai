package com.platform.api;

import com.platform.util.ApiBaseAction;
import com.platform.annotation.LoginUser;
import com.platform.entity.GoodsCrashVo;
import com.platform.entity.UserVo;
import com.platform.service.ApiGoodsCrashService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * API搭配减价管理
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 15:31
 */
@RestController
@RequestMapping("/api/goodscrash")
public class ApiGoodsCrashController extends ApiBaseAction {
    @Autowired
    private ApiGoodsCrashService apiGoodsCrashService;

    /**
     * 获取优惠券列表
     */
    @RequestMapping("list")
    public Object list(@LoginUser UserVo loginUser, Long goodsId) {

        Map param = new HashMap();
        param.put("goods_id", goodsId);
        List<GoodsCrashVo> crashVos = apiGoodsCrashService.queryList(param);
        return toResponsSuccess(crashVos);
    }
}
