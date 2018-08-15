$(function () {
    $("#jqGrid").jqGrid({
        url: '../goodsbargain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'id', key: true, hidden: true},
            {label: '标题', name: 'title', index: 'title', width: 80},
            {
                label: '活动条例图片', name: 'itemPicUrl', index: 'item_pic_url', width: 80, formatter: function (value) {
                return transImg(value);
            }
            },
            {
                label: '缩列图', name: 'abbrPicUrl', index: 'abbr_pic_url', width: 80, formatter: function (value) {
                return transImg(value);
            }
            },
            {label: '商品', name: 'goodsName', index: 'goods_id', width: 80},
            // {label: '产品Id', name: 'productId', index: 'product_id', width: 80},
            {label: '子标题', name: 'subtitle', index: 'subtitle', width: 80},
            {label: '每次砍价最高金额', name: 'bargainMoney', index: 'bargain_money', width: 80},
            {label: '商品最低价格', name: 'retailMinPrice', index: 'retail_min_price', width: 80},
            {
                label: '开始时间', name: 'openTime', index: 'open_time', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {
                label: '结束时间', name: 'endTime', index: 'end_time', width: 80, formatter: function (value) {
                return transDate(value);
            }
            },
            {
                label: '状态', name: 'isDelete', index: 'isDelete', width: 60, formatter: function (value) {
                if (value == 1) {
                    return '<span class="label label-danger">已删除</span>';
                } else {
                    return '<span class="label label-success">正常</span>';
                }
            }
            },
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

let vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        goodsBargain: {},
        ruleValidate: {
            title: [
                {required: true, message: '标题不能为空', trigger: 'blur'}
            ]
        },
        goodss: [],
        products: [],
        q: {
            title: ''
        }
    },
    methods: {
        changeGoods: function (opt) {
            var goodsId = opt.value;
            if (null != goodsId) {
                $.get("../product/queryByGoodsId/" + goodsId, function (r) {
                    vm.products = r.list;
                });
            } else {
                vm.products = [];
            }
        },
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.goodsBargain = {};
            vm.getGoods();
        },
        update: function (event) {
            let id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id);
            vm.getGoods();
        },
        getGoods: function () {
            $.get("../goods/queryAll/", function (r) {
                vm.goodss = r.list;
            });
        },
        saveOrUpdate: function (event) {
            let url = vm.goodsBargain.id == null ? "../goodsbargain/save" : "../goodsbargain/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.goodsBargain),
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
                    url: "../goodsbargain/delete",
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
            $.get("../goodsbargain/info/" + id, function (r) {
                vm.goodsBargain = r.goodsBargain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            let page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'title': vm.q.title},
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
            vm.goodsBargain.itemPicUrl = file.response.url;
        },
        eyeImage: function () {
            var url = vm.goodsBargain.itemPicUrl;
            eyeImage(url);
        },
        handleAbbrSuccess: function (res, file) {
            vm.goodsBargain.abbrPicUrl = file.response.url;
        },
        eyeAbbrImage: function () {
            var url = vm.goodsBargain.abbrPicUrl;
            eyeImage(url);
        }
    }
});