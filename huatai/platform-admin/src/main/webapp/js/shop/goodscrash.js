$(function () {
    $("#jqGrid").jqGrid({
        url: '../goodscrash/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '商品', name: 'goodsName', index: 'goods_id', width: 80},
            {label: '搭配商品', name: 'goodsCrashName', index: 'goods_crash_id', width: 80},
            {label: '搭配产品', name: 'goodsSpecificationValue', index: 'product_crash_id', width: 80},
            {label: '搭配商品价格，需要小于原始价格', name: 'retailCrashPrice', index: 'retail_crash_price', width: 80}],
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
        goodsCrash: {},
        ruleValidate: {
            name: [
                {required: true, message: '名称不能为空', trigger: 'blur'}
            ]
        },
        q: {
            goodsName: ''
        },
        goodss: [],
        products: []
    },
    methods: {
        changeGoodsCrash: function (opt) {
            var goodsId = opt.value;
            $.get("../product/queryByGoodsId/" + goodsId, function (r) {
                vm.products = r.list;
            });
        },
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.goodsCrash = {};
            vm.getGoodss();
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
            vm.getGoodss();
        },
        saveOrUpdate: function (event) {
            var url = vm.goodsCrash.id == null ? "../goodscrash/save" : "../goodscrash/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.goodsCrash),
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
                    url: "../goodscrash/delete",
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
            $.get("../goodscrash/info/" + id, function (r) {
                vm.goodsCrash = r.goodsCrash;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'goodsName': vm.q.goodsName},
                page: page
            }).trigger("reloadGrid");
            vm.handleReset('formValidate');
        },
        handleSubmit: function (name) {
            handleSubmitValidate(this, name, function () {
                vm.saveOrUpdate()
            });
        },
        handleReset: function (name) {
            handleResetForm(this, name);
        },
        getGoodss: function () {
            $.get("../goods/queryAll/", function (r) {
                vm.goodss = r.list;
            });
        }
    }
});