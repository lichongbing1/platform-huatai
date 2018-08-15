$(function () {
    $("#jqGrid").jqGrid({
        url: '../productstorerela/list',
        datatype: "json",
        colModel: [
            {label: 'ID', name: 'id', index: 'id', hidden: true, key: true},
            {label: '门店', name: 'storeName', index: 'storeName'},
            {label: '商品类型', name: 'categoryName', index: 'categoryName', width: 80},
            {label: '商品编码', name: 'goodsSn', index: 'goodsSn'},
            {label: '名称', name: 'goodsName', index: 'goodsName', width: 160},
            {label: '产品编码', name: 'productSn', index: 'productSn'},
            {label: '库存', name: 'stockNum', index: 'stockNum', width: 80},
            {label: '零售价格', name: 'retailPrice', index: 'retailPrice', width: 80},
            {label: '市场价', name: 'marketPrice', index: 'marketPrice', width: 80},
            {label: '库存价格', name: 'stockPrice', index: 'stockPrice', width: 80},
            {
                label: '销售量',
                name: 'sellVolume',
                index: 'a.sell_volume',
                width: 80,
                sortable: true,
                onSortCol: function (index, colindex, sortorder) {
                    //列排序事件
                    jQuery("#jqGrid").jqGrid('setGridParam', {page: $('#XtoPage').val()});
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
    $('#goodsDesc').editable({
        inlineMode: false,
        alwaysBlank: true,
        height: '500px', //高度
        minHeight: '200px',
        language: "zh_cn",
        spellcheck: false,
        plainPaste: true,
        enableScript: false,
        imageButtons: ["floatImageLeft", "floatImageNone", "floatImageRight", "linkImage", "replaceImage", "removeImage"],
        allowedImageTypes: ["jpeg", "jpg", "png", "gif"],
        imageUploadURL: '../sys/oss/upload',
        imageUploadParams: {id: "edit"},
        imagesLoadURL: '../sys/oss/queryAll'
    })
});

var ztree;

var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url: "nourl"
        }
    }
};
var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        uploadList: [],
        imgName: '',
        visible: false,
        productStoreRela: {},
        ruleValidate: {
            storeId: [
                {required: true, message: '门店不能为空'}
            ],
            productSn: [
                {required: true, message: '规格编码不能为空'}
            ],
            retailPrice: [
                {required: true, message: '零售价格不能为空'}
            ],
            marketPrice: [
                {required: true, message: '市场价格不能为空'}
            ],
            goodsId: [
                {required: true, message: '商品不能为空'}
            ],
            productId: [
                {required: true, message: '规格不能为空'}
            ]
        },
        q: {
            storeId: '',
            goodsName: '',
            productSn: '',
            goodsSn: ''
        },
        stores: [],
        macros: [],//商品单位
        goodss: {},
        products: [],
    },
    methods: {
        changeGoods: function (opt) {
            var goodsId = opt.value;
            if (null != goodsId && '' != goodsId) {
                $.get("../product/queryByGoodsId/" + goodsId, function (r) {
                    vm.products = r.list;
                });
            } else {
                vm.products = [];
            }
        },
        reloadSearch: function () {
            vm.q = {
                storeId: '',
                goodsName: '',
                productSn: '',
                goodsSn: ''
            }
            vm.reload();
        },
        query: function () {
            vm.reload();
        },
        add: function (event) {
            vm.showList = false;
            vm.title = "新增";
            vm.uploadList = [];
            vm.getMacro();
            vm.getGoods();
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";
            vm.uploadList = [];
            vm.getInfo(id);
            vm.getMacro();
            vm.getGoods();
        },
        /**
         * 获取单位
         */
        getMacro: function () {
            $.get("../sys/macro/queryMacrosByValue?value=goodsUnit", function (r) {
                vm.macros = r.list;
            });
        },
        saveOrUpdate: function (event) {
            var url = vm.productStoreRela.id == null ? "../productstorerela/save" : "../productstorerela/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.productStoreRela),
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
                    url: "../productstorerela/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                vm.reload();
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        getInfo: function (id) {
            $.get("../productstorerela/info/" + id, function (r) {
                vm.productStoreRela = r.productStoreRela;
            });
        },
        getGoods: function () {
            $.get("../goods/queryAll/", function (r) {
                vm.goodss = r.list;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {
                    storeId: vm.q.storeId,
                    goodsName: vm.q.goodsName,
                    goodsSn: vm.q.goodsSn,
                    productSn: vm.q.productSn
                },
                page: page
            }).trigger("reloadGrid");
            vm.handleReset('formValidate');
        },
        uploadExcelSuccess: function () {
            alert('上传成功', function (index) {
                $("#jqGrid").trigger("reloadGrid");
            });
        },
        uploadExcelError: function () {
            alert('上传出现异常');
        },
        handleView(name) {
            this.imgName = name;
            this.visible = true;
        },
        handleRemove(file) {
            // 从 upload 实例删除数据
            const fileList = this.uploadList;
            this.uploadList.splice(fileList.indexOf(file), 1);
        },
        handleSuccess(res, file) {
            // 因为上传过程为实例，这里模拟添加 url
            file.imgUrl = res.url;
            file.name = res.url;
            vm.uploadList.add(file);
        },
        handleBeforeUpload() {
            const check = this.uploadList.length < 5;
            if (!check) {
                this.$Notice.warning({
                    title: '最多只能上传 5 张图片。'
                });
            }
            return check;
        },
        handleSubmit: function (name) {
            handleSubmitValidate(this, name, function () {
                vm.saveOrUpdate()
            });
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
        handleReset: function (name) {
            handleResetForm(this, name);
        }
    },
    mounted() {
        $.get("../store/queryAll", function (r) {
            vm.stores = r.list;
        });
    }
});