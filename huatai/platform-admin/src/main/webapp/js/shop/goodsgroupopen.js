$(function () {
    let groupId = getQueryString("groupId");
    $("#jqGrid").jqGrid({
        url: '../goodsgroupopen/list?groupId=' + groupId,
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '开团Id', name: 'groupId', index: 'group_id', width: 80, hidden: true},
            {label: '开团人', name: 'userName', index: 'user_id', width: 80},
            {
                label: '开团时间', name: 'openTime', index: 'open_time', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {
                label: '结束时间', name: 'endTime', index: 'end_time', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {
                label: '状态', name: 'attendStatus', index: 'attend_status', width: 80, formatter: function (value) {
                if (value === 0) {
                    return '待付款';
                } else if (value == 1) {
                    return '拼团中';
                } else if (value == 2) {
                    return '拼团成功';
                } else if (value == 3) {
                    return '拼团失败';
                }
                return '-';
            }
            },
            {label: '当前参团人数', name: 'attendNum', index: 'attend_num', width: 80}],
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
        goodsGroupOpen: {},
        ruleValidate: {
            name: [
                {required: true, message: '名称不能为空', trigger: 'blur'}
            ]
        },
        q: {
            name: ''
        },
        selStatus: [{id: 0, name: '待付款'}, {id: 1, name: '拼团中'}, {id: 2, name: '拼团成功'}, {id: 3, name: '拼团失败'}]
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.goodsGroupOpen = {};
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
        saveOrUpdate: function (event) {
            let url = vm.goodsGroupOpen.id == null ? "../goodsgroupopen/save" : "../goodsgroupopen/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.goodsGroupOpen),
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
                    url: "../goodsgroupopen/delete",
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
            $.get("../goodsgroupopen/info/" + id, function (r) {
                vm.goodsGroupOpen = r.goodsGroupOpen;
            });
        },
        reload: function (event) {
            vm.showList = true;
            let page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'name': vm.q.name},
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
        cancelGroup: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            confirm('确定要取消选中的团购？', function () {
                // this.$Loading.start();
                $.ajax({
                    type: "POST",
                    url: "../goodsgroupopen/cancelGroup",
                    contentType: "application/json",
                    data: JSON.stringify(id),
                    success: function (r) {
                        // this.$Loading.finish();
                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        } else {
                            alert(r.msg);
                        }
                    },
                    error: function (r) {
                        // this.$Loading.error();
                    }
                });
            });
        },
    }
});