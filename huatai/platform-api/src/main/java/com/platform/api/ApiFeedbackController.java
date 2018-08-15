package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.util.ApiBaseAction;
import com.platform.annotation.LoginUser;
import com.platform.entity.FeedbackVo;
import com.platform.entity.UserVo;
import com.platform.service.ApiFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiFeedbackController <br>
 */
@RestController
@RequestMapping("/api/feedback")
public class ApiFeedbackController extends ApiBaseAction {
    @Autowired
    private ApiFeedbackService feedbackService;

    /**
     * 添加或更新收货地址
     */
    @RequestMapping("save")
    public Object save(@LoginUser UserVo loginUser) {
        JSONObject jsonParam = getJsonRequest();
        FeedbackVo feedback = jsonParam.getObject("feedback",FeedbackVo.class);
        feedback.setUserId(loginUser.getId());
        feedback.setUserName(loginUser.getNickname());
        feedback.setAddTime(new Date());
        feedback.setStatus(1);
        feedbackService.save(feedback);
        return toResponsSuccess("感谢你的反馈");
    }
}