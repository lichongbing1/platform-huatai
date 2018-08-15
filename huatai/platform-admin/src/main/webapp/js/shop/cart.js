$(function () {
    let userId = getQueryString("userId");
    let url = '../cart/list';
    if (userId) {
        url += '?userId=' + userId;
    }
    $("#jqGrid").jqGrid({
        url: url,
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '会员', name: 'userName', index: 'user_name', width: 20},
            // {label: 'sessionId', name: 'sessionId', index: 'session_id', width: 80 },
            {label: '商品', name: 'goodsName', index: 'goods_name', width: 100},
            {label: '商品序列号', name: 'goodsSn', index: 'goods_sn', width: 30},
            // {label: '产品Id', name: 'productId', index: 'product_id', width: 80 },
            {label: '规格名称', name: 'goodsName', index: 'goods_name', width: 80},
            {label: '市场价', name: 'marketPrice', index: 'market_price', width: 20},
            {label: '零售价格', name: 'retailPrice', index: 'retail_price', width: 30},
            {label: '数量', name: 'number', index: 'number', width: 20},
            {label: '规格属性', name: 'goodsSpecificationNameValue', index: 'goods_specification_name_value', width: 100}
            // {label: 'product表对应的goods_specifition_ids', name: 'goodsSpecificationIds', index: 'goods_specification_ids', width: 80 },
            // {label: '', name: 'checked', index: 'checked', width: 80 },
            // {label: '商品图片', name: 'listPicUrl', index: 'list_pic_url', width: 80 }
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

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        cart: {},
        q: {
            name: ''
        }
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.cart = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.cart.id == null ? "../cart/save" : "../cart/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.cart),
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
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../cart/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
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
        getInfo: function (id) {
            $.get("../cart/info/" + id, function (r) {
                vm.cart = r.cart;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'name': vm.q.name},
                page: page
            }).trigger("reloadGrid");
        }
    }
});