package com.platform.service;

import com.platform.dao.QzBargainMapper;
import com.platform.dao.QzGroupMapper;
import com.platform.dao.QzOrderMapper;
import com.platform.entity.TemplateConfVo;
import com.platform.quartz.OrderTask;
import com.platform.utils.DateUtils;
import com.platform.utils.MapUtils;
import com.platform.utils.StringUtils;
import com.platform.dao.TemplateConfDao;
import com.platform.utils.wxtemplate.TemplateData;
import com.platform.utils.wxtemplate.WxTemplate;
import com.platform.utils.wxtemplate.WxTemplateUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * @author zhouzhengde(CN)
 * @date 2017/12/4.
 */
@Service
public class QzOrderService {
    private static Log logger = LogFactory.getLog(OrderTask.class);
    @Autowired
    private TemplateConfDao templateConfDao;
    @Autowired
    private QzBargainMapper qzBargainMapper;
    @Autowired
    private QzGroupMapper qzGroupMapper;
    @Autowired
    private QzOrderMapper qzOrderMapper;

    /**
     * 砍价进度提醒，提前三天提醒
     */
    @Transactional
    public void bargainProgressRemind() {
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainProgressRemind is start ");
        TemplateConfVo templateConfVo = templateConfDao.queryByTypeId(6); //  模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
        if (null == templateConfVo) {
            return;
        }
        List<Map> bargainList = qzBargainMapper.queryRemindBargainList();

        if (null != bargainList && bargainList.size() > 0) {
            for (Map map : bargainList) {
                Long id = MapUtils.getLong("id", map);
                String open_id = MapUtils.getString("open_id", map);
                Long bargain_id = MapUtils.getLong("bargain_id", map);
                Integer bargain_num = MapUtils.getInteger("bargain_num", map);
                String name = MapUtils.getString("name", map);
                Integer goods_number = MapUtils.getInteger("goods_number", map);
                Date end_time = MapUtils.getDate("end_time", map);
                String form_id = MapUtils.getString("form_id", map);
                if (StringUtils.isNullOrEmpty(form_id) || goods_number < 1) {
                    continue;
                }
                WxTemplate tem = new WxTemplate();
                tem.setTemplate_id(templateConfVo.getTemplateId());
                tem.setTopcolor("#00DD00");
                tem.setTouser(open_id);
                tem.setPage("/pages/bargainDetail/bargainDetail?openId=" + id + "&bargainId=" + bargain_id);
                tem.setForm_id(form_id);

                List<TemplateData> paras = new ArrayList<TemplateData>();
                paras.add(new TemplateData("keyword1", name, "#000000"));
                paras.add(new TemplateData("keyword2", templateConfVo.getDesc(), "#000000"));
                paras.add(new TemplateData("keyword3", "已有人" + bargain_num + "砍价", "#000000"));

                //剩余时长
                long time = (end_time.getTime() - System.currentTimeMillis()) / 1000;

                long hour = time / 3600;
                long minite = time / 60 % 60;
                long second = (time - hour * 3600 - minite * 60);

                String body = hour + "时" + minite + "分" + second + "秒";

                paras.add(new TemplateData("keyword4", body, "#000000"));
                paras.add(new TemplateData("keyword5", goods_number + "", "#000000"));

                tem.setData(paras);
                WxTemplateUtil.sendMessage(tem);
            }
        }
        logger.info(">>>>>>>>>>>>>>>>>>>>bargainProgressRemind is end ");
    }

    /**
     * 团购进度提醒，提前一天提醒
     */
    @Transactional
    public void groupProgressRemind() {
        logger.info(">>>>>>>>>>>>>>>>>>>>groupProgressRemind is start ");
        TemplateConfVo templateConfVo = templateConfDao.queryByTypeId(4); //  模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
        if (null == templateConfVo) {
            return;
        }
        List<Map> groupList = qzGroupMapper.queryRemindGroupList();

        if (null != groupList && groupList.size() > 0) {
            for (Map map : groupList) {
                Long id = MapUtils.getLong("id", map);
                String open_id = MapUtils.getString("open_id", map);
                Long group_id = MapUtils.getLong("group_id", map);
                Integer attend_num = MapUtils.getInteger("attend_num", map);
                String name = MapUtils.getString("name", map);
                Date open_time = MapUtils.getDate("open_time", map);
                Date end_time = MapUtils.getDate("end_time", map);
                String form_id = MapUtils.getString("form_id", map);
                BigDecimal retail_min_price = MapUtils.getBigDecimal("retail_min_price", map);
                if (StringUtils.isNullOrEmpty(form_id)) {
                    continue;
                }
                WxTemplate tem = new WxTemplate();
                tem.setTemplate_id(templateConfVo.getTemplateId());
                tem.setTopcolor("#00DD00");
                tem.setTouser(open_id);
                tem.setPage("/pages/groupDetail/groupDetail?id=" + group_id);
                tem.setForm_id(form_id);

                List<TemplateData> paras = new ArrayList<TemplateData>();
                paras.add(new TemplateData("keyword1", name, "#000000"));
                paras.add(new TemplateData("keyword2", DateUtils.format(open_time, DateUtils.DATE_PATTERN), "#000000"));
                paras.add(new TemplateData("keyword3", "已有" + attend_num + "人参与", "#000000"));
                //剩余时长
                long time = (end_time.getTime() - System.currentTimeMillis()) / 1000;
                long hour = time / 3600;
                long minite = time / 60 % 60;
                long second = (time - hour * 3600 - minite * 60);
                String body = hour + "时" + minite + "分" + second + "秒";
                paras.add(new TemplateData("keyword3", body, "#000000"));
                paras.add(new TemplateData("keyword4", retail_min_price.setScale(2, BigDecimal.ROUND_HALF_DOWN).toString() + "元", "#000000"));
                paras.add(new TemplateData("keyword5", templateConfVo.getDesc(), "#000000"));
                tem.setData(paras);
                WxTemplateUtil.sendMessage(tem);
            }
        }
        logger.info(">>>>>>>>>>>>>>>>>>>>groupProgressRemind is end ");
    }

    /**
     * 更新过期的团购订单
     */
    @Transactional
    public void pastGroupRemind() {
        logger.info(">>>>>>>>>>>>>>>>>>>>pastGroupRemind is start ");
        TemplateConfVo templateConfVo = templateConfDao.queryByTypeId(3); //  模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
        if (null == templateConfVo) {
            return;
        }
        List<Map> groupList = qzGroupMapper.queryPastGroupList();

        if (null != groupList && groupList.size() > 0) {
            for (Map map : groupList) {
                Long id = MapUtils.getLong("id", map);
                String open_id = MapUtils.getString("open_id", map);
                Long group_id = MapUtils.getLong("group_id", map);
                Integer attend_num = MapUtils.getInteger("attend_num", map);
                String name = MapUtils.getString("name", map);
                String form_id = MapUtils.getString("form_id", map);
                Integer min_open_group = MapUtils.getInteger("min_open_group", map);
                BigDecimal retail_min_price = MapUtils.getBigDecimal("retail_min_price", map);
                if (StringUtils.isNullOrEmpty(form_id)) {
                    continue;
                }
                WxTemplate tem = new WxTemplate();
                tem.setTemplate_id(templateConfVo.getTemplateId());
                tem.setTopcolor("#00DD00");
                tem.setTouser(open_id);
                tem.setPage("/pages/groupDetail/groupDetail?id=" + group_id);
                tem.setForm_id(form_id);

                List<TemplateData> paras = new ArrayList<TemplateData>();
                paras.add(new TemplateData("keyword1", name, "#000000"));
                paras.add(new TemplateData("keyword2", attend_num + "/" + min_open_group, "#000000"));
                paras.add(new TemplateData("keyword3", retail_min_price + "元", "#000000"));
                paras.add(new TemplateData("keyword4", templateConfVo.getDesc(), "#000000"));
                tem.setData(paras);
                WxTemplateUtil.sendMessage(tem);
                // 更新团购失败订单
                Map updateFailParams = new HashMap();
                updateFailParams.put("id", id);
                qzGroupMapper.updatePastGroup(updateFailParams);
            }
        }
        logger.info(">>>>>>>>>>>>>>>>>>>>pastGroupRemind is end ");
    }

    /**
     * 未评价订单
     */
    @Transactional
    public void orderUnEvaluateRemind() {
        logger.info(">>>>>>>>>>>>>>>>>>>>orderUnEvaluateRemind is start ");
        TemplateConfVo templateConfVo = templateConfDao.queryByTypeId(8); //  模板类型 1订单付款成功 2团购成功 3拼团失败通知 4拼团进度 5砍价成功 6砍价进度 7订单配送 8订单评价提醒
        if (null == templateConfVo) {
            return;
        }
        List<Map> unEvaluateList = qzOrderMapper.queryrderUnEvaluateList();

        if (null != unEvaluateList && unEvaluateList.size() > 0) {
            for (Map map : unEvaluateList) {
                Long id = MapUtils.getLong("id", map);
                String form_id = MapUtils.getString("form_id", map);
                String order_sn = MapUtils.getString("order_sn", map);
                String open_id = MapUtils.getString("open_id", map);
                String goods_name = MapUtils.getString("goods_name", map);
                if (StringUtils.isNullOrEmpty(form_id)) {
                    continue;
                }
                WxTemplate tem = new WxTemplate();
                tem.setTemplate_id(templateConfVo.getTemplateId());
                tem.setTopcolor("#00DD00");
                tem.setTouser(open_id);
                tem.setPage("/pages/ucenter/orderDetail/orderDetail?id=" + id);
                tem.setForm_id(form_id);

                List<TemplateData> paras = new ArrayList<TemplateData>();
                paras.add(new TemplateData("keyword1", goods_name, "#000000"));
                paras.add(new TemplateData("keyword2", order_sn, "#000000"));
                paras.add(new TemplateData("keyword3", templateConfVo.getDesc(), "#000000"));
                tem.setData(paras);
                WxTemplateUtil.sendMessage(tem);
            }
        }
        logger.info(">>>>>>>>>>>>>>>>>>>>orderUnEvaluateRemind is end ");
    }

    /**
     * 砍价取消
     */
    public void updatePastBargain() {
        logger.info(">>>>>>>>>>>>>>>>>>>>updatePastBargain is start ");
        qzBargainMapper.updatePastBargain();
        logger.info(">>>>>>>>>>>>>>>>>>>>updatePastBargain is end ");
    }

    /**
     * 更新过期未支付订单
     */
    @Transactional
    public void unpayPastUpdate() {
        logger.info(">>>>>>>>>>>>>>>>>>>>unpayPastUpdate is start ");
        // 获取快过期订单
        List<Map> pastOrderList = qzOrderMapper.queryPastOrderList();
        if (null != pastOrderList && pastOrderList.size() > 0) {
            for (Map map : pastOrderList) {
                Integer number = MapUtils.getInteger("number", map);
                Integer stock_num = MapUtils.getInteger("stock_num", map);
                Long storeRelaId = MapUtils.getLong("storeRelaId", map);
                Map param = new HashMap();
                param.put("id", storeRelaId);
                param.put("stock_num", stock_num + number);
                qzOrderMapper.updateStockNum(param);
            }
            qzOrderMapper.unpayPastUpdate();
        }
        logger.info(">>>>>>>>>>>>>>>>>>>>unpayPastUpdate is end ");
    }

    public static void main(String[] args) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, 3);

        long time = (calendar.getTime().getTime() - System.currentTimeMillis()) / 1000;
        System.out.println(calendar.getTime().getTime());
        System.out.println(System.currentTimeMillis());
        long hour = time / 3600;
        long minite = time / 60 % 60;
        long second = (time - hour * 3600 - minite * 60);

        String body = hour + "时" + minite + "分" + second + "秒";
        System.out.println(body);
    }
}
