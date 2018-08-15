package com.platform.api;

import com.platform.annotation.IgnoreAuth;
import com.platform.dto.GoodsActivityVo;
import com.platform.entity.UserVo;
import com.platform.service.ApiGoodsActivityService;
import com.platform.util.ApiBaseAction;
import com.platform.util.ApiPageUtils;
import com.platform.utils.Query;
import com.platform.annotation.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiGoodsActivityController <br>
 */
@RestController
@RequestMapping("/api/activity")
public class ApiGoodsActivityController extends ApiBaseAction {
    @Autowired
    private ApiGoodsActivityService apiGoodsActivityService;

    /**
     * 砍价+团购
     *
     * @param loginUser
     * @param page
     * @param size
     * @param type      1砍价 2团购
     * @return
     */
    @IgnoreAuth
    @RequestMapping("list")
    public Object list(@LoginUser UserVo loginUser, @RequestParam(value = "page", defaultValue = "1") Integer page,
                       @RequestParam(value = "size", defaultValue = "10") Integer size, Integer type) {
        Map param = new HashMap();
        param.put("page", page);
        param.put("limit", size);
        param.put("type", type);
        // 多余，防止报错
        param.put("sidx", "id");
        param.put("order", "desc");
        param.put("store_id", getStoreId());
        //查询列表数据
        Query query = new Query(param);
        List<GoodsActivityVo> topicEntities = apiGoodsActivityService.queryList(query);
        int total = apiGoodsActivityService.queryTotal(query);
        ApiPageUtils pageUtil = new ApiPageUtils(topicEntities, total, query.getLimit(), query.getPage());
        return toResponsSuccess(pageUtil);
    }
}