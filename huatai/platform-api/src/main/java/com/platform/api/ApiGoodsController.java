package com.platform.api;

import com.platform.annotation.IgnoreAuth;
import com.platform.annotation.LoginUser;
import com.platform.entity.*;
import com.platform.service.*;
import com.platform.util.ApiBaseAction;
import com.platform.util.ApiPageUtils;
import com.platform.utils.DateUtils;
import com.platform.utils.Query;
import com.platform.utils.enums.CouponTypeEnum;
import com.qiniu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-08-11 08:32<br>
 * 描述: ApiIndexController <br>
 */
@RestController
@RequestMapping("/api/goods")
public class ApiGoodsController extends ApiBaseAction {
    @Autowired
    private ApiGoodsService goodsService;
    @Autowired
    private ApiGoodsSpecificationService goodsSpecificationService;
    @Autowired
    private ApiProductService productService;
    @Autowired
    private ApiGoodsGalleryService goodsGalleryService;
    @Autowired
    private ApiGoodsIssueService goodsIssueService;
    @Autowired
    private ApiAttributeService attributeService;
    @Autowired
    private ApiCommentService commentService;
    @Autowired
    private ApiUserService userService;
    @Autowired
    private ApiCommentPictureService commentPictureService;
    @Autowired
    private ApiCollectService collectService;
    @Autowired
    private ApiFootprintService footprintService;
    @Autowired
    private ApiCategoryService categoryService;
    @Autowired
    private ApiSearchHistoryService searchHistoryService;
    @Autowired
    private ApiRelatedGoodsService relatedGoodsService;
    @Autowired
    private ApiCouponService apiCouponService;
    @Autowired
    private ApiUserCouponService apiUserCouponService;
    @Autowired
    private ApiCartService cartService;
    @Autowired
    private ApiAdService apiAdService;
    @Autowired
    private ApiBrandService apiBrandService;

    /**
     */
    @IgnoreAuth
    @RequestMapping("index")
    public Object index(@LoginUser UserVo loginUser) {
        //
        Map param = new HashMap();
        List<GoodsVo> goodsList = goodsService.queryList(param);
        //
        return toResponsSuccess(goodsList);
    }

    /**
     * 获取sku信息，用于购物车编辑时选择规格
     */
    @IgnoreAuth
    @RequestMapping("sku")
    public Object sku(@LoginUser UserVo loginUser, Long goodsId) {
        Map<String, Object> resultObj = new HashMap();
        //
        GoodsVo goodsVo = goodsService.queryObject(goodsId);
        //
        List<Map> goodsSpecificationEntityList = goodsSpecificationService.queryByGoodsIdGroupByNames(goodsId);
        //
        Map param = new HashMap();
        param.put("goods_id", goodsId);
        param.put("store_id", getStoreId());
        List<ProductVo> productEntityList = productService.queryList(param);
        //
        resultObj.put("goodsVo", goodsVo);
        resultObj.put("specificationList", goodsSpecificationEntityList);
        resultObj.put("productList", productEntityList);
        return toResponsSuccess(resultObj);
    }

    /**
     * 商品画廊数据
     */
    @IgnoreAuth
    @RequestMapping("goodsGallery")
    public Object goodsGallery(Integer goods_id) {
        Map param = new HashMap();
        param.put("goods_id", goods_id);
        List<GoodsGalleryVo> gallery = goodsGalleryService.queryList(param);
        return toResponsSuccess(gallery);
    }

    /**
     * 商品详情页数据
     */
    @RequestMapping("detail")
    public Object detail(Long id, Long referrer) {
        Map<String, Object> resultObj = new HashMap();
        //
        Long userId = getUserId();
        Long storeId = getStoreId();
        GoodsVo info = goodsService.queryObjectByStoreId(id, storeId);

        BrandVo brand = apiBrandService.queryObject(info.getBrand_id());
        resultObj.put("brand", brand);

        Map param = new HashMap();
        param.put("goods_id", id);
        param.put("store_id", getStoreId());
        List<Map> specificationList = goodsSpecificationService.queryByGoodsIdGroupByNames(id);
        //
        List<ProductVo> productEntityList = productService.queryList(param);
        //
        List<GoodsGalleryVo> gallery = goodsGalleryService.queryList(param);
        resultObj.put("gallery",gallery);

        Map ngaParam = new HashMap();
        ngaParam.put("fields", "nga.value, na.name");
        ngaParam.put("sidx", "nga.id");
        ngaParam.put("order", "asc");
        ngaParam.put("goods_id", id);
        List<AttributeVo> attribute = attributeService.queryList(ngaParam);
        //
        Map issueParam = new HashMap();
//        issueParam.put("goods_id", id);
        List<GoodsIssueVo> issue = goodsIssueService.queryList(issueParam);
        //
        param.put("value_id", id);
        param.put("type_id", 0);
        Integer commentCount = commentService.queryTotal(param);
        List<CommentVo> hotComment = commentService.queryList(param);
        Map commentInfo = new HashMap();
        if (null != hotComment && hotComment.size() > 0) {
            UserVo commentUser = userService.queryObject(hotComment.get(0).getUserId());
            commentInfo.put("content", hotComment.get(0).getContent());
            commentInfo.put("add_time", DateUtils.timeToStr(hotComment.get(0).getAddTime(), DateUtils.PATTERN_YYYY_MM_DD_HH_MM));
            commentInfo.put("nickname", commentUser.getNickname());
            commentInfo.put("avatar", commentUser.getAvatar());
            Map paramPicture = new HashMap();
            paramPicture.put("comment_id", hotComment.get(0).getId());
            List<CommentPictureVo> commentPictureEntities = commentPictureService.queryList(paramPicture);
            commentInfo.put("pic_list", commentPictureEntities);
        }
        Map comment = new HashMap();
        comment.put("count", commentCount);
        comment.put("data", commentInfo);
        //当前用户是否收藏
        Map collectParam = new HashMap();
        collectParam.put("user_id", getUserId());
        collectParam.put("value_id", id);
        collectParam.put("type_id", 0);
        Integer userHasCollect = collectService.queryTotal(collectParam);
        if (userHasCollect > 0) {
            userHasCollect = 1;
        }
        //记录用户的足迹
        FootprintVo footprintEntity = new FootprintVo();
        footprintEntity.setAdd_time(System.currentTimeMillis() / 1000);
        footprintEntity.setGoods_brief(info.getGoods_brief());
        footprintEntity.setList_pic_url(info.getList_pic_url());
        footprintEntity.setGoods_id(info.getId());
        footprintEntity.setName(info.getName());
        footprintEntity.setRetail_price(info.getRetail_price());
        footprintEntity.setUser_id(userId);
        if (null != referrer) {
            footprintEntity.setReferrer(referrer);
        } else {
            footprintEntity.setReferrer(0L);
        }
        footprintService.save(footprintEntity);
        //
        resultObj.put("info", info);

        resultObj.put("attribute", attribute);
        resultObj.put("userHasCollect", userHasCollect);
        resultObj.put("issue", issue);
        resultObj.put("comment", comment);
        resultObj.put("specificationList", specificationList);
        resultObj.put("productList", productEntityList);
        return toResponsSuccess(resultObj);
    }

    /*
      * 　用户转发获取优惠券
     */
    @IgnoreAuth
    @RequestMapping("transferCoupon")
    public Object transferCoupon(@LoginUser UserVo loginUser, Long goods_id, Integer send_type, Long referrer) {
        Map<String, Object> resultObj = new HashMap();
        // 记录推荐人是否可以领取红包，用户登录时校验
        Long userId = getUserId();
        try {
            // 是否已经有可用的转发红包
            Map params = new HashMap();
            params.put("user_id", userId);
            params.put("send_type", send_type);
            params.put("unUsed", true);
            List<CouponVo> enabledCouponVos = apiCouponService.queryUserCoupons(params);
            if ((null == enabledCouponVos || enabledCouponVos.size() == 0)
                    && null != referrer && null != userId) {
                // 获取优惠信息提示
                Map couponParam = new HashMap();
                couponParam.put("enabled", true);
                Integer[] send_types = new Integer[]{CouponTypeEnum.COUPONTYPE2.getIndex()};
                couponParam.put("send_types", send_types);
                List<CouponVo> couponVos = apiCouponService.queryList(couponParam);
                if (null != couponVos && couponVos.size() > 0) {
                    CouponVo couponVo = couponVos.get(0);
                    Map footprintParam = new HashMap();
                    footprintParam.put("goods_id", goods_id);
                    footprintParam.put("referrer", referrer);
                    Integer footprintNum = footprintService.queryTotal(footprintParam);
                    if (null != footprintNum && null != couponVo.getMin_transmit_num()
                            && footprintNum > couponVo.getMin_transmit_num()) {
                        apiCouponService.takeCoupon(couponVo, userId, "", 0L, 1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toResponsSuccess("");
    }

    /**
     * 　获取分类下的商品
     */
    @IgnoreAuth
    @RequestMapping("category")
    public Object category(@LoginUser UserVo loginUser, Integer id) {
        Map<String, Object> resultObj = new HashMap();
        //
        CategoryVo currentCategory = categoryService.queryObject(id);
        //
        CategoryVo parentCategory = categoryService.queryObject(currentCategory.getParent_id());
        Map params = new HashMap();
        params.put("parent_id", currentCategory.getParent_id());
        List<CategoryVo> brotherCategory = categoryService.queryList(params);
        //
        resultObj.put("currentCategory", currentCategory);
        resultObj.put("parentCategory", parentCategory);
        resultObj.put("brotherCategory", brotherCategory);
        return toResponsSuccess(resultObj);
    }

    /**
     * 　　获取商品列表
     */
    @IgnoreAuth
    @RequestMapping("list")
    public Object list(@LoginUser UserVo loginUser, Integer categoryId,
                       Integer brandId, String keyword, Integer isNew, Integer isHot,
                       @RequestParam(value = "page", defaultValue = "1") Integer
                               page, @RequestParam(value = "size", defaultValue = "10") Integer size,
                       String sort, String order) {
        Map params = new HashMap();
        params.put("brand_id", brandId);
        params.put("keyword", keyword);
        params.put("is_new", isNew);
        params.put("is_hot", isHot);
        params.put("page", page);
        params.put("limit", size);
        params.put("order", sort);
        params.put("sidx", order);
        params.put("store_id", getStoreId());
        //
        if (null != sort && sort.equals("price")) {
            params.put("sidx", "a.retail_price");
            params.put("order", order);
        } else {
            params.put("sidx", "a.id");
            params.put("order", "desc");
        }
        //添加到搜索历史
        if (!StringUtils.isNullOrEmpty(keyword)) {
            SearchHistoryVo searchHistoryVo = new SearchHistoryVo();
            searchHistoryVo.setAdd_time(System.currentTimeMillis() / 1000);
            searchHistoryVo.setKeyword(keyword);
            searchHistoryVo.setUser_id(null != loginUser ? loginUser.getId().toString() : "");
            searchHistoryVo.setFrom("");
            searchHistoryService.save(searchHistoryVo);
        }
        //筛选的分类
        List<CategoryVo> filterCategory = new ArrayList();
        CategoryVo rootCategory = new CategoryVo();
        rootCategory.setId(0);
        rootCategory.setName("全部");
        rootCategory.setChecked(false);
        filterCategory.add(rootCategory);
        //
        params.put("fields", "a.category_id");
        params.put("limit", 1);
        List<GoodsVo> goodsVoList = goodsService.queryList(params);
        params.put("limit", size);
        params.remove("fields");
        if (null != goodsVoList && goodsVoList.size() > 0) {
            List<Integer> categoryIds = new ArrayList();
            for (GoodsVo goodsVo : goodsVoList) {
                if (null != goodsVo && null != goodsVo.getCategory_id()) {
                    categoryIds.add(goodsVo.getCategory_id());
                }
            }
            //查找二级分类的parent_id
            Map categoryParam = new HashMap();
            categoryParam.put("ids", categoryIds);
            categoryParam.put("fields", "parent_id");
            List<CategoryVo> parentCategoryList = categoryService.queryList(categoryParam);
            //
            List<Integer> parentIds = new ArrayList();
            for (CategoryVo categoryEntity : parentCategoryList) {
                parentIds.add(categoryEntity.getParent_id());
            }
            //一级分类
            categoryParam = new HashMap();
            categoryParam.put("fields", "id,name");
            categoryParam.put("order", "asc");
            categoryParam.put("sidx", "sort_order");
            categoryParam.put("ids", parentIds);
            List<CategoryVo> parentCategory = categoryService.queryList(categoryParam);
            if (null != parentCategory) {
                filterCategory.addAll(parentCategory);
            }
        }
        //查询列表数据
        params.put("fields", "distinct a.id, a.name, a.list_pic_url, psr1.market_price, psr1.retail_price, a.goods_brief");
        params.put("category_parent_id", categoryId);
        Query query = new Query(params);
        List<GoodsVo> goodsList = goodsService.queryList(query);
        int total = goodsService.queryTotal(query);
        ApiPageUtils goodsData = new ApiPageUtils(goodsList, total, query.getLimit(), query.getPage());
        //搜索到的商品
        for (CategoryVo categoryEntity : filterCategory) {
            if (null != categoryId && categoryEntity.getId() == 0 || categoryEntity.getId() == categoryId) {
                categoryEntity.setChecked(true);
            } else {
                categoryEntity.setChecked(false);
            }
        }
        goodsData.setFilterCategory(filterCategory);
        return toResponsSuccess(goodsData);
    }

    /**
     * 　　获取疯狂折扣商品列表
     */
    @IgnoreAuth
    @RequestMapping("hotGoodsList")
    public Object hotGoodsList(@LoginUser UserVo loginUser, Integer categoryId,
                               String sort, String order) {
        Map reusltObj = new HashMap();
        //
        Long store_id = getStoreId();
        Map params = new HashMap();
        //筛选的分类
        List<CategoryVo> filterCategory = new ArrayList();
        CategoryVo rootCategory = new CategoryVo();
        rootCategory.setId(0);
        rootCategory.setName("全部");
        rootCategory.setChecked(false);
        filterCategory.add(rootCategory);
        //
        params.put("fields", "a.category_id");
        params.put("is_hot", "1");
        params.put("store_id", store_id);

        List<GoodsVo> categoryEntityList = goodsService.queryList(params);
        params.remove("fields");
        if (null != categoryEntityList && categoryEntityList.size() > 0) {
            List<Integer> categoryIds = new ArrayList();
            for (GoodsVo goodsVo : categoryEntityList) {
                if (null == goodsVo || null == goodsVo.getCategory_id()) {
                    continue;
                }
                categoryIds.add(goodsVo.getCategory_id());
            }
            //查找二级分类的parent_id
            Map categoryParam = new HashMap();
            categoryParam.put("ids", categoryIds);
            categoryParam.put("fields", "parent_id");
            List<CategoryVo> parentCategoryList = categoryService.queryList(categoryParam);
            //
            List<Integer> parentIds = new ArrayList();
            for (CategoryVo categoryEntity : parentCategoryList) {
                parentIds.add(categoryEntity.getParent_id());
            }
            //一级分类
            categoryParam = new HashMap();
            categoryParam.put("fields", "id,name");
            categoryParam.put("order", "asc");
            categoryParam.put("sidx", "sort_order");
            categoryParam.put("ids", parentIds);
            List<CategoryVo> parentCategory = categoryService.queryList(categoryParam);
            if (null != parentCategory) {
                filterCategory.addAll(parentCategory);
            }
        }
        params.put("category_parent_id", categoryId);
        params.put("fields", "a.id,a.name,a.goods_brief,a.list_pic_url,psr1.retail_price," +
                "psr1.market_price,b.id as product_id");
        params.put("is_hot", "1");
        params.put("is_delete", 0);
        params.put("store_id", store_id);
        if (!StringUtils.isNullOrEmpty(sort) && !StringUtils.isNullOrEmpty(order)) {
            if (sort.equals("price")) {
                params.put("sidx", "a.retail_price");
                params.put("order", order);
            }
        }
        List<GoodsVo> hotGoods = goodsService.queryHotGoodsList(params);

        reusltObj.put("filterCategory", filterCategory);
        reusltObj.put("goodsList", hotGoods);

        return toResponsSuccess(reusltObj);
    }

    /**
     * 　　新品首发
     */
    @IgnoreAuth
    @RequestMapping("new")
    public Object newAction(@LoginUser UserVo loginUser) {
        Map<String, Object> resultObj = new HashMap();
        Map bannerInfo = new HashMap();
        bannerInfo.put("url", "");
        bannerInfo.put("name", "坚持初心，为你寻觅世间好物");
        bannerInfo.put("img_url", "http://yanxuan.nosdn.127.net/8976116db321744084774643a933c5ce.png");
        resultObj.put("bannerInfo", bannerInfo);
        return toResponsSuccess(resultObj);
    }

    /**
     * 　　人气推荐
     */
    @IgnoreAuth
    @RequestMapping("hot")
    public Object hot(@LoginUser UserVo loginUser) {
        Map<String, Object> resultObj = new HashMap();
        //
        Map param = new HashMap();
        param.put("ad_position_id", 4);
        List<AdVo> bargainBanner = apiAdService.queryList(param);
        if (null != bargainBanner && bargainBanner.size() > 0) {
            Map bannerInfo = new HashMap();
            bannerInfo.put("url", "");
            bannerInfo.put("name", bargainBanner.get(0).getName());
            bannerInfo.put("img_url", bargainBanner.get(0).getImage_url());
            resultObj.put("bannerInfo", bannerInfo);
        } else {
            Map bannerInfo = new HashMap();
            bannerInfo.put("url", "");
            bannerInfo.put("name", "大家都在美平选好物");
            bannerInfo.put("img_url", "https://meiping123.oss-cn-shenzhen.aliyuncs.com/upload/20171125/1057182334dfb2.png");
            resultObj.put("bannerInfo", bannerInfo);
        }
        return toResponsSuccess(resultObj);
    }

    /**
     * 　　商品详情页的大家都在看的商品
     */
    @IgnoreAuth
    @RequestMapping("related")
    public Object related(@LoginUser UserVo loginUser, Long id) {
        Map<String, Object> resultObj = new HashMap();
        Map param = new HashMap();
        param.put("goods_id", id);
        param.put("fields", "related_goods_id");
        List<RelatedGoodsVo> relatedGoodsEntityList = relatedGoodsService.queryList(param);

        List<Integer> relatedGoodsIds = new ArrayList();
        for (RelatedGoodsVo relatedGoodsEntity : relatedGoodsEntityList) {
            relatedGoodsIds.add(relatedGoodsEntity.getRelated_goods_id());
        }
        List<Integer> relatedGoods = new ArrayList();
        if (null == relatedGoodsIds || relatedGoods.size() < 1) {
            //查找同分类下的商品
            GoodsVo goodsCategory = goodsService.queryObject(id);
            if (null != goodsCategory) {
                Map paramRelated = new HashMap();
                paramRelated.put("fields", "a.id, a.name, a.list_pic_url, psr1.retail_price,b.id as product_id");
                paramRelated.put("category_id", goodsCategory.getCategory_id());
                relatedGoods = goodsService.queryList(paramRelated);
            }
        } else {
            Map paramRelated = new HashMap();
            paramRelated.put("goods_ids", relatedGoodsIds);
            paramRelated.put("fields", "a.id, a.name, a.list_pic_url, psr1.retail_price,b.id as product_id");
            relatedGoods = goodsService.queryList(paramRelated);
        }
        resultObj.put("goodsList", relatedGoods);
        return toResponsSuccess(resultObj);
    }

    /**
     * 　　在售的商品总数
     */
    @IgnoreAuth
    @RequestMapping("count")
    public Object count(@LoginUser UserVo loginUser) {
        Map<String, Object> resultObj = new HashMap();
        Map param = new HashMap();
        param.put("is_delete", 0);
        param.put("is_on_sale", 1);
        Integer goodsCount = goodsService.queryTotal(param);
        resultObj.put("goodsCount", goodsCount);
        return toResponsSuccess(resultObj);
    }

    /**
     * 　　获取商品列表
     */
    @IgnoreAuth
    @RequestMapping("productlist")
    public Object productlist(@LoginUser UserVo loginUser, Integer categoryId,
                              Integer isNew, Integer discount,
                              @RequestParam(value = "page", defaultValue = "1") Integer
                                      page, @RequestParam(value = "size", defaultValue = "10") Integer size,
                              String sort, String order) {
        Map params = new HashMap();
        params.put("is_new", isNew);
        params.put("page", page);
        params.put("limit", size);
        params.put("order", sort);
        params.put("sidx", order);
        params.put("store_id", getStoreId());
        //
        if (null != sort && sort.equals("price")) {
            params.put("sidx", "retail_price");
            params.put("order", order);
        } else if (null != sort && sort.equals("sell")) {
            params.put("sidx", "psr1.sell_volume");
            params.put("order", order);
        } else {
            params.put("sidx", "id");
            params.put("order", "desc");
        }
        // 0不限 1特价 2团购
        if (null != discount && discount == 1) {
            params.put("is_hot", 1);
        } else if (null != discount && discount == 2) {
            params.put("is_group", true);
        }
        params.put("category_parent_id", categoryId);
        //查询列表数据
        Query query = new Query(params);
        List<GoodsVo> goodsList = goodsService.queryCatalogProductList(query);
        int total = goodsService.queryTotal(query);

        // 当前购物车中
        List<CartVo> cartList = new ArrayList();
        if (null != getUserId()) {
            Long storeId = getStoreId();
            //查询列表数据
            Map cartParam = new HashMap();
            cartParam.put("user_id", getUserId());
            cartParam.put("store_id", storeId);
            cartList = cartService.queryList(cartParam);
        }
        if (null != cartList && cartList.size() > 0 && null != goodsList && goodsList.size() > 0) {
            for (GoodsVo goodsVo : goodsList) {
                for (CartVo cartVo : cartList) {
                    if (goodsVo.getId().equals(cartVo.getGoods_id())) {
                        goodsVo.setCart_num(cartVo.getNumber());
                    }
                }
            }
        }
        ApiPageUtils goodsData = new ApiPageUtils(goodsList, total, query.getLimit(), query.getPage());
        return toResponsSuccess(goodsData);
    }
}