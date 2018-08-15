package com.platform.quartz;

import com.platform.service.QzOrderService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component("orderTask")
public class OrderTask {
    private static Log logger = LogFactory.getLog(OrderTask.class);

    @Autowired
    QzOrderService qzOrderService;

    /**
     * 方法描述：砍价进度通知
     * 每日凌晨2:00
     */
    @Scheduled(cron = "0 0 2 * * ?")
    public void bargainProgressRemind() {
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainProgressRemind is start ");
        qzOrderService.bargainProgressRemind();
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainProgressRemind is end ");
    }

    /**
     * 方法描述：拼团进度通知
     * 每日凌晨2:00
     */
    @Scheduled(cron = "0 0 2 * * ?")
    public void groupProgressRemind() {
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainProgressRemind is start ");
        qzOrderService.groupProgressRemind();
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainProgressRemind is end ");
    }

    /**
     * 方法描述：砍价过期更新
     * 五分钟更新下失效的订单
     */
    @Scheduled(fixedRate = 1000 * 60 * 5)
    public void bargainPastUpdate() {
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainPastUpdate is start ");
        qzOrderService.updatePastBargain();
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainPastUpdate is end ");
    }

    /**
     * 方法描述：更新过期未支付订单
     * 二分钟更新未付款订单
     */
    @Scheduled(fixedRate = 1000 * 60 * 2)
    public void unpayPastUpdate() {
        logger.info(">>>>>>>>>>>>>>>>>>>>unpayPastUpdate is start ");
        qzOrderService.unpayPastUpdate();
        logger.info(">>>>>>>>>>>>>>>>>>>>unpayPastUpdate is end ");
    }
}


