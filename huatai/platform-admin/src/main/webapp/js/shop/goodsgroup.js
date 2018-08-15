$(function () {
    $("#jqGrid").jqGrid({
        url: '../goodsgroup/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '团购主题', name: 'title', index: 'title', width: 80},
            {
                label: '活动图片', name: 'itemPicUrl', index: 'item_pic_url', width: 80, formatter: function (value) {
                return transImg(value);
            }
            },
            {
                label: '缩列图', name: 'abbrPicUrl', index: 'abbr_pic_url', width: 80, formatter: function (value) {
                return transImg(value);
            }
            },
            {label: '广告语', name: 'adDesc', index: 'ad_desc', width: 80},
            // {label: '开团次数', name: 'launchNum', index: 'launch_num', width: 80},
            {label: '商品', name: 'goodsName', index: 'goods_id', width: 120},
            {label: '排序', name: 'sortOrder', index: 'sort_order', width: 80},
            {label: '最低开团人数', name: 'minOpenGroup', index: 'min_open_group', width: 80},
            {label: '子标题', name: 'subtitle', index: 'subtitle', width: 80},
            {label: '团购价格', name: 'retailMinPrice', index: 'retail_min_price', width: 80},
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
                label: '状态',
                name: 'openStatus',
                index: 'open_status',
                width: 80,
                formatter: function (value) {
                    if (value == 1) {
                        return '<span class="label label-success">开团中</span>';
                    } else if (value == 2) {
                        return '<span class="label label-primary">过期</span>';
                    } else if (value == 3) {
                        return '<span class="label label-danger">已删除</span>';
                    }
                    return '-';
                }
            },
            {label: '开团有效期', name: 'validDays', index: 'valid_days', width: 80}],
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
        goodsGroup: {},
        ruleValidate: {
            title: [
                {required: true, message: '标题不能为空', trigger: 'blur'}
            ]
        },
        goodss: [],
        q: {
            subtitle: '',
            title: '',
            goodsName: ''
        },
        selStatus: [{id: 1, name: '开团中'}, {id: 2, name: '过期'}, {id: 3, name: '失效'}]
    },
    methods: {
        toRecord: function () {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            openWindow({
                type: 2,
                area: ['90%', '100%'],
                title: '开团记录',
                content: '../shop/goodsgroupopen.html?groupId=' + id
            });
        },
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.goodsGroup = {};
            vm.getGoods();
        },
        update: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
            vm.getGoods();
        },
        getGoods: function () {
            $.get("../goods/queryAll/", function (r) {
                vm.goodss = r.list;
            });
        },
        saveOrUpdate: function (event) {
            let url = vm.goodsGroup.id == null ? "../goodsgroup/save" : "../goodsgroup/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.goodsGroup),
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
                    url: "../goodsgroup/delete",
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
            $.get("../goodsgroup/info/" + id, function (r) {
                vm.goodsGroup = r.goodsGroup;
            });
        },
        reload: function (event) {
            vm.showList = true;
            let page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'subtitle': vm.q.subtitle, 'title': vm.q.title, 'goodsName': vm.q.goodsName},
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
        handleSuccess: function (res, file) {
            vm.goodsGroup.itemPicUrl = file.response.url;
        },
        eyeImage: function () {
            var url = vm.goodsGroup.itemPicUrl;
            eyeImage(url);
        },
        handleAbbrSuccess: function (res, file) {
            vm.goodsGroup.abbrPicUrl = file.response.url;
        },
        eyeAbbrImage: function () {
            var url = vm.goodsGroup.abbrPicUrl;
            eyeImage(url);
        }
    }
});