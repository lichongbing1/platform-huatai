$(function () {
    $("#jqGrid").jqGrid({
        url: '../store/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '门店名称', name: 'storeName', index: 'store_name', width: 80},
            {label: '门店编号', name: 'storeNumber', index: 'store_number', width: 80},
            {label: '门店地址', name: 'storeAddress', index: 'store_address', width: 80},
            {label: '省份', name: 'provinceName', index: 'province_name', width: 80},
            {label: '城市', name: 'cityName', index: 'city_name', width: 80},
            {label: '区', name: 'countyName', index: 'county_name', width: 80},
            {label: '纬度', name: 'latitude', index: 'latitude', width: 80},
            {label: '经度', name: 'longitude', index: 'longitude', width: 80},
            {label: '配送半径（km）', name: 'coverRadius', index: 'cover_radius', width: 80},
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
        store: {},
        ruleValidate: {
            storeName: [
                {required: true, message: '门店名称不能为空', trigger: 'blur'}
            ],
            storeNumber: [
                {required: true, message: '门店编号不能为空', trigger: 'blur'}
            ]
        },
        q: {
            storeName: '',
            storeNumber: ''
        }
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.store = {};
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
            let url = vm.store.id == null ? "../store/save" : "../store/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.store),
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
                    url: "../store/delete",
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
            $.get("../store/info/" + id, function (r) {
                vm.store = r.store;
            });
        },
        reloadSearch: function () {
            vm.q = {
                storeName: '',
                storeNumber: ''
            }
            vm.reload();
        },
        reload: function (event) {
            vm.showList = true;
            let page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'storeName': vm.q.storeName, 'storeNumber': vm.q.storeNumber},
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