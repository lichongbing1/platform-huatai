$(function () {
    let shippingStatus = getQueryString("shippingStatus");
    let payStatus = getQueryString("payStatus");
    let orderStatus = getQueryString("orderStatus");
    let orderType = getQueryString("orderType");
    let url = '../order/list?1';
    if (shippingStatus) {
        url += '&shippingStatus=' + shippingStatus;
    }
    if (payStatus) {
        url += '&payStatus=' + payStatus;
    }
    if (orderStatus) {
        url += '&orderStatus=' + orderStatus;
    }
    if (orderType) {
        url += '&orderType=' + orderType;
    }
    $("#jqGrid").jqGrid({
        url: url,
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '订单号', name: 'orderSn', index: 'order_sn', width: 160},
            {label: '会员', name: 'userName', index: 'user_name', width: 80},
            {
                label: '订单类型', name: 'orderType', index: 'order_type', width: 80, formatter: function (value) {
                if (value == '1') {
                    return '普通订单';
                } else if (value == '2') {
                    return '团购订单';
                } else if (value == '3') {
                    return '砍价订单';
                }
                return '-';
            }
            },
            {
                label: '订单状态', name: 'orderStatus', index: 'order_status', width: 80, formatter: function (value) {
                if (value == '0') {
                    return '待付款';
                } else if (value == '101') {
                    return '订单已取消';
                } else if (value == '102') {
                    return '订单已删除';
                } else if (value == '201') {
                    return '订单已付款';
                } else if (value == '300') {
                    return '订单已发货';
                } else if (value == '301') {
                    return '用户确认收货';
                } else if (value == '401') {
                    return '退款';
                } else if (value == '402') {
                    return '完成';
                }
                return value;
            }
            },
            // {
            //     label: '发货状态',
            //     name: 'shippingStatus',
            //     index: 'shipping_status',
            //     width: 60,
            //     formatter: function (value) {
            //         if (value == '0') {
            //             return '未发货';
            //         } else if (value == '1') {
            //             return '已发货';
            //         } else if (value == '2') {
            //             return '已收货';
            //         } else if (value == '4') {
            //             return '退货';
            //         }
            //         return value;
            //     }
            // },
            // {
            //     label: '付款状态', name: 'payStatus', index: 'pay_status', width: 80,
            //     formatter: function (value) {
            //         if (value == '0') {
            //             return '未付款';
            //         } else if (value == '1') {
            //             return '付款中';
            //         } else if (value == '2') {
            //             return '已付款';
            //         }
            //         return value;
            //     }
            // },
            // {label: '收货人', name: 'consignee', index: 'consignee', width: 80},
            // {label: '省', name: 'province', index: 'province', width: 20 },
            // {label: '地市', name: 'city', index: 'city', width: 20 },
            // {label: '区县', name: 'district', index: 'district', width: 20 },
            // {label: '收货地址', name: 'address', index: 'address', width: 80},
            // {label: '联系电话', name: 'mobile', index: 'mobile', width: 80},
            // {label: '补充说明', name: 'postscript', index: 'postscript', width: 80 },
            // {label: '快递公司Id', name: 'shippingId', index: 'shipping_id', width: 80 },
            // {label: '付款方', name: 'payName', index: 'pay_name', width: 80},
            // {label: '快递费用', name: 'shippingFee', index: 'shipping_fee', width: 80},
            {label: '实际支付', name: 'actualPrice', index: 'actual_price', width: 60},
            // {label: '', name: 'integral', index: 'integral', width: 80 },
            // {label: '', name: 'integralMoney', index: 'integral_money', width: 80 },
            {label: '订单总价', name: 'orderPrice', index: 'order_price', width: 60},
            // {label: '商品总价', name: 'goodsPrice', index: 'goods_price', width: 60},
            {
                label: '下单时间', name: 'addTime', index: 'add_time', width: 120,
                formatter: function (value) {
                    return transDate(value);
                }
            },
            {label: '骑手', name: 'shippingName', index: 'shipping_name', width: 80},
            // {label: '配送单号', name: 'shippingNo', index: 'shipping_No', width: 80},
            {
                label: '操作', width: 180, align: 'center', sortable: false, formatter: function (value, col, row) {
                let htmlStr = '';
                if (hasPermission('order:refund')) {
                    if (row.orderStatus == 201 || row.orderStatus == 301 || row.orderStatus == 300) {
                        htmlStr = '<button class="btn btn-outline btn-danger ivu-btn-small" onclick="vm.refundUpdate(' + row.id + ')"><i class="fa fa-info-circle"></i>&nbsp;取消</button>&nbsp;';
                    }
                }
                htmlStr += '<button class="btn btn-outline btn-info" onclick="vm.lookDetail(' + row.id + ')"><i class="fa fa-info-circle"></i>详情</button>&nbsp;' +
                    '<button class="btn btn-outline btn-primary" onclick="vm.printDetail(' + row.id + ')"><i class="fa fa-print"></i>打印</button>';
                return htmlStr;
            }
            }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
});


$(function () {
    $("#jqRiderGrid").jqGrid({
        url: '../rider/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '姓名', name: 'name', index: 'name'},
            {label: '手机号', name: 'mobile', index: 'mobile', width: 120}
        ],
        viewrecords: true,
        height: 400,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqRiderGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            $("#jqRiderGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
});

let vm = new Vue({
    el: '#rrapp',
    data: {
        showDiv: 1, // 1查询 2编辑 3发货 4选择骑手 5退款
        title: null,
        order: {},
        shippings: [],
        q: {
            orderSn: '',
            orderStatus: ''
        },
        riderq: {
            name: '',
            mobile: ''
        },
        riderVo: {id: 0, name: ''},
        refundMoney: 0
    },
    methods: {
        query: function () {
            vm.reload();
        },
        sendGoods: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showDiv = 3;
            vm.title = "选择骑手";
            $.get("../order/info/" + id, function (r) {
                vm.order = r.order;
            });
        },
        confirm: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            confirm('确定收货？', function () {
                $.ajax({
                    type: "POST",
                    url: "../order/confirm",
                    contentType: "application/json",
                    data: JSON.stringify(id),
                    dataType: "json",
                    success: function (r) {

                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        openComment: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            openWindow({
                type: 2,
                title: '评价',
                content: '../shop/comment.html?orderId=' + id
            });
        },
        saveOrUpdate: function (event) {
            $.ajax({
                type: "POST",
                url: '../order/sendGoods',
                contentType: "application/json",
                data: JSON.stringify(vm.order),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        reload: function (event) {
            vm.showDiv = 1;
            let page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {
                    'orderSn': vm.q.orderSn,
                    'orderStatus': vm.q.orderStatus
                },
                page: page
            }).trigger("reloadGrid");
        },
        lookDetail: function (rowId) { //第三步：定义编辑操作
            vm.showDiv = 2;
            vm.title = "详情";
            $.get("../order/info/" + rowId, function (r) {
                vm.order = r.order;
            });
        },
        printDetail: function (rowId) {
            openWindow({
                type: 2,
                title: '<i class="fa fa-print"></i>票据预览',
                content: '../shop/orderPrint.html?orderId=' + rowId
            })
        },
        // 用户选择
        riderSelectPanal: function () {
            openWindow({
                title: "选择用户",
                area: ['580px', '500px'],
                content: jQuery("#riderSelectLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var grid = $("#jqRiderGrid");
                    var rowKey = grid.getGridParam("selrow");
                    if (!rowKey) {
                        iview.Message.error("请选择一条记录");
                        return;
                    }

                    var selectedIDs = grid.getGridParam("selarrrow");
                    if (selectedIDs.length > 1) {
                        iview.Message.error("只能选择一条记录");
                        return;
                    }

                    var id = selectedIDs[0];

                    if (id == null) {
                        return;
                    }
                    vm.riderSelectList = false;
                    vm.riderVo.id = id;
                    vm.riderVo.name = grid.getRowData(rowKey).name;
                    layer.close(index);
                }
            });
        },
        riderQuery: function () {
            vm.riderReload();
        },
        reloadRiderSearch: function () {
            vm.riderq = {
                name: '',
                mobile: ''
            }
            vm.riderReload();
        },
        riderReload: function (event) {
            vm.showDiv = 3;
            vm.riderSelectList = false;
            let page = $("#jqRiderGrid").jqGrid('getGridParam', 'page');
            $("#jqRiderGrid").jqGrid('setGridParam', {
                postData: {
                    name: vm.riderq.name,
                    mobile: vm.riderq.mobile
                },
                page: page
            }).trigger("reloadGrid");
            vm.handleReset('formValidate');
        },
        scanTakeOrder: function (event) {
            let riderId = vm.riderVo.id;
            let orderId = vm.order.id;
            $.ajax({
                type: "POST",
                url: '../order/scanTakeOrder',
                data: {orderId: orderId, riderId: riderId},
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        refund: function (rowId) {
            vm.showDiv = 5;
            vm.refundMoney = 0;
            Ajax.request({
                url: "../order/info/" + rowId,
                async: true,
                successCallback: function (r) {
                    vm.order = r.order;
                    vm.refundMoney = r.order.actualPrice;
                }
            });
        },
        refundUpdate: function (rowId) {
            // if (null == vm.refundMoney) {
            //     iview.Message.error("退款金额不能为空");
            //     return;
            // }
            // if (vm.refundMoney < 0.01) {
            //     iview.Message.error("退款金额不能小于0.01");
            //     return;
            // }
            let params = {};
            // params.refundMoney = vm.refundMoney;
            params.orderId = rowId;

            $.ajax({
                type: "POST",
                url: '../order/cancel',
                data: params,
                success: function (r) {
                    if (r.code === 0) {
                        alert('取消成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        }
    },
    created: function () {
        let vue = this;
        $.get("../shipping/queryAll", function (r) {
            vue.shippings = r.list;
        });
    }
});