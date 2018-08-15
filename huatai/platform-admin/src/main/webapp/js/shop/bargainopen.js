$(function () {
    $("#jqGrid").jqGrid({
        url: '../bargainopen/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '砍价Id', name: 'bargainId', index: 'bargain_id', width: 80},
            {label: '发起人', name: 'userName', index: 'user_id', width: 80},
            {
                label: '发起时间', name: 'launchTime', index: 'launch_time', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {label: '订单Id', name: 'orderId', index: 'order_id', width: 80},
            {
                label: '状态',
                name: 'launchStatus',
                index: 'launch_status',
                width: 80,
                formatter: function (value) {
                    if (value == 1) {
                        return '砍价中';
                    } else if (value == 2) {
                        return '完成';
                    } else if (value == 3) {
                        return '取消';
                    }
                    return '-';
                }
            },
            {label: '当前砍价的价格', name: 'retailPrice', index: 'retail_price', width: 80}],
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

let vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        bargainOpen: {launchStatus: ''},
        ruleValidate: {
            name: [
                {required: true, message: '名称不能为空', trigger: 'blur'}
            ]
        },
        q: {
            userName: ''
        },
        selStatus: [{id: 1, name: '砍价中'}, {id: 2, name: '完成'}, {id: 3, name: '取消'}]
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.bargainOpen = {launchStatus: ''};
        },
        update: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        openRecord: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            openWindow({
                title: '砍价记录',
                type: 2,
                content: '../shop/bargainopenrecord.html?openId=' + id
            });
        },
        saveOrUpdate: function (event) {
            let url = vm.bargainOpen.id == null ? "../bargainopen/save" : "../bargainopen/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.bargainOpen),
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
            let ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../bargainopen/delete",
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
            $.get("../bargainopen/info/" + id, function (r) {
                vm.bargainOpen = r.bargainOpen;
            });
        },
        reload: function (event) {
            vm.showList = true;
            let page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'userName': vm.q.userName},
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
        }
    }
});