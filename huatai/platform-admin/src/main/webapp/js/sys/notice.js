$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/notice/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '通知内容', name: 'context', index: 'context', width: 280},
            {label: '通知标题', name: 'title', index: 'title', width: 150},
            {
                label: '通知来源',
                name: 'soucre',
                index: 'soucre',
                width: 80,
                formatter: function (value) {
                    if (value == 1) {
                        return '普通通知';
                    }
                    if (value == 2) {
                        return '下单通知';
                    }
                    return '-';
                }
            },
            {
                label: '通知状态', name: 'status', index: 'status', width: 80,
                formatter: function (value) {
                    if (value == 0) {
                        return '已发布';
                    }
                    if (value == 1) {
                        return '草稿';
                    }
                    return '-';
                }
            },
            {
                label: '是否紧急', name: 'isUrgent', index: 'is_urgent', width: 80,
                formatter: function (value) {
                    if (value == 1) {
                        return '否';
                    }
                    if (value == 0) {
                        return '是';
                    }
                    return '-';
                }
            },
            {
                label: '发布时间', name: 'releaseTimee', index: 'release_timee', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {
                label: '创建时间', name: 'createTime', index: 'create_time', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {
                label: '修改时间', name: 'updateTime', index: 'update_time', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {label: '创建人', name: 'createId', index: 'create_id', width: 80},
            {label: '修改人', name: 'updateId', index: 'update_id', width: 80},
            {label: '备注', name: 'remark', index: 'remark', width: 80}],
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
        sysNotice: {},
        ruleValidate: {
            name: [
                {required: true, message: '名称不能为空', trigger: 'blur'}
            ]
        },
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
            vm.sysNotice = {};
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
            let url = vm.sysNotice.id == null ? "../sys/notice/save" : "../sys/notice/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.sysNotice),
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
                    url: "../sys/notice/delete",
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
            $.get("../sys/notice/info/" + id, function (r) {
                vm.sysNotice = r.sysNotice;
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
        }
    }
});