package com.platform.api;

import com.platform.annotation.IgnoreAuth;
import com.platform.entity.SysSmsLogEntity;
import com.platform.service.SysSmsLogService;
import com.platform.utils.DateUtils;
import com.platform.utils.R;
import com.platform.utils.RRException;
import com.platform.utils.RequestUtil;
import com.platform.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 名称：ApiController <br>
 * 描述：Api<br>
 *
 * @author 李鹏军
 * @version 1.0
 * @since 1.0.0
 */
@RestController
@RequestMapping("api")
public class ApiSmsController {
    @Autowired
    private SysSmsLogService smsLogService;

    /**
     * 安全起见，暴露的接口需要配置有效的请求IP
     */
    private static final String VALID_IP = "127.0.0.1";

    /**
     * 发送短信
     * mobile：电话号码字符串，中间用英文逗号间隔
     * content：内容字符串
     * stime：追加发送时间，可为空，为空为及时发送
     *
     * 示例：
     * http://域名:端口/api/sendSms?mobile=13000000000,15209831990&content=发送的短信内容
     */
    @IgnoreAuth
    @RequestMapping("/sendSms")
    public R sendSms(HttpServletRequest request, @RequestParam Map<String, String> params) {
        SysSmsLogEntity smsLog = new SysSmsLogEntity();
        String validIP = RequestUtil.getIpAddrByRequest(request);
        if (VALID_IP.indexOf(validIP) < 0) {
            throw new RRException("非法地址请求！");
        }
        //外部系统调用接口
        smsLog.setUserId(1L);
        smsLog.setMobile(params.get("mobile"));
        smsLog.setContent(params.get("content"));
        String stime = params.get("stime");
        if (StringUtils.isNotEmpty(stime)) {
            smsLog.setStime(DateUtils.convertStringToDate(stime));
        }
        SysSmsLogEntity sysSmsLogEntity = smsLogService.sendSms(smsLog);
        return R.ok().put("result", sysSmsLogEntity);
    }
}
