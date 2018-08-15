$(function () {
    $("#jqGrid").jqGrid({
        url: '../rider/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '骑手姓名', name: 'name', index: 'name', width: 80},
            {label: '身份证号', name: 'idcard', index: 'idcard', width: 80},
            {label: '图片', name: 'idcardPicUrl', index: 'idcard_pic_url', width: 80},
            {label: '手机号', name: 'mobile', index: 'mobile', width: 80},
            {label: '关联用户', name: 'userName', index: 'user_id', width: 80},
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

$(function () {
    $("#jqUserGrid").jqGrid({
        url: '../user/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '账号', name: 'username', index: 'username'},
            {label: '别名', name: 'nickname', index: 'nickname'},
            {label: '手机号', name: 'mobile', index: 'mobile', width: 120},
            {label: '微信Id', name: 'weixinOpenid', index: 'weixinOpenid', width: 300}
            ],
        viewrecords: true,
        height: 400,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqUserGridPager",
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
            $("#jqUserGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
});

let vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        userSelectList:false,
        title: null,
        rider: {},
        ruleValidate: {
            name: [
                {required: true, message: '名称不能为空', trigger: 'blur'}
            ],
            idcard: [
                {required: true, message: '身份证号不能为空', trigger: 'blur'}
            ],
            mobile: [
                {required: true, message: '手机号不能为空', trigger: 'blur'}
            ]
        },
        q: {
            name: ''
        },
        userq: {
            username: '',
            mobile: ''
        }
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.rider = {userName:""};
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
            let url = vm.rider.id == null ? "../rider/save" : "../rider/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.rider),
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
                    url: "../rider/delete",
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
            $.get("../rider/info/" + id, function (r) {
                vm.rider = r.rider;
            });
        },
        reloadSearch: function () {
            vm.q = {
                name: ''
            }
            vm.reload();
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
        handleFormatError: function (file) {
            this.$Notice.warning({
                title: '文件格式不正确',
                desc: '文件 ' + file.name + ' 格式不正确，请上传 jpg 或 png 格式的图片。'
            });
        },
        handleMaxSize: function (file) {
            this.$Notice.warning({
                title: '超出文件大小限制',
                desc: '文件 ' + file.name + ' 太大，不能超过 2M。'
            });
        },
        handleSuccessPicUrl: function (res, file) {
            vm.rider.idcardPicUrl = file.response.url;
        },
        eyeImagePicUrl: function () {
            var url = vm.rider.idcardPicUrl;
            eyeImage(url);
        },
        // 用户选择
        userSelectPanal: function () {
            openWindow({
                title: "选择用户",
                area: ['780px', '700px'],
                content: jQuery("#userSelectLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var grid = $("#jqUserGrid");
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
                    vm.userSelectList = false;
                    vm.rider.userId=id;
                    vm.rider.userName=grid.getRowData(rowKey).username;
                    layer.close(index);
                }
            });
        },
        userQuery: function () {
            vm.userReload();
        },
        reloadUserSearch: function () {
            vm.userq = {
                username: '',
                mobile: ''
            }
            vm.userReload();
        },
        userReload: function (event) {
            vm.showList = false;
            let page = $("#jqUserGrid").jqGrid('getGridParam', 'page');
            $("#jqUserGrid").jqGrid('setGridParam', {
                postData: {username: vm.userq.username,
                    mobile: vm.userq.mobile},
                page: page
            }).trigger("reloadGrid");
            vm.handleReset('formValidate');
        }
    }
});