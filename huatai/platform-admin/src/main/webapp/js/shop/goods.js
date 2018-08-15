$(function () {
    $("#jqGrid").jqGrid({
        url: '../goods/list',
        datatype: "json",
        colModel: [
            {label: 'ID', name: 'id', index: 'id', hidden: true, key: true},
            {label: '商品编码', name: 'goodsSn', index: 'goods_Sn'},
            {label: '商品类型', name: 'categoryName', index: 'category_id', width: 80},
            {label: '名称', name: 'name', index: 'name', width: 160},
            {
                label: '上架', name: 'isOnSale', index: 'is_on_sale', width: 50,
                formatter: function (value) {
                    return transIsNot(value);
                }
            },
            {
                label: '录入日期', name: 'addTime', index: 'add_time', width: 80, formatter: function (value) {
                return transDate(value, 'yyyy-MM-dd');
            }
            },
            {label: '属性类别', name: 'attributeCategoryName', index: 'attribute_category', width: 80},
            // {label: '零售价格', name: 'retailPrice', index: 'retail_price', width: 80},
            // {label: '市场价', name: 'marketPrice', index: 'market_price', width: 80},
            {
                label: '热销', name: 'isHot', index: 'is_hot', width: 80, formatter: function (value) {
                return transIsNot(value);
            }
            },
            {
                label: '活动', name: 'goodsType', index: 'goodsType', width: 80,
                formatter: function (value) {
                    if (value == 2) {
                        return '<span class="label label-warning">团购</span>';
                    } else if (value == 1) {
                        return '<span class="label label-primary">砍价</span>';
                    } else {
                        return '<span class="label label-success">无活动</span>';
                    }
                }
            },],
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
        goods: {
            primaryPicUrl: '',
            listPicUrl: '',
            categoryId: '',
            isOnSale: 1,
            isAppExclusive: 0,
            isLimited: 0,
            isHot: 0,
            categoryName: ''
        },
        ruleValidate: {
            name: [
                {required: true, message: '名称不能为空', trigger: 'blur'}
            ]
        },
        q: {
            name: '',
            goodsSn: '',
            category: '',
            categoryTwo: ''
        },
        attributes: [],
        attributeEntityList: [{'id': '', 'goodsId': '', 'attributeId': '', 'value': ''}],
        productEntityList: [{
            'id': '',
            'goodsId': '',
            'goodsSpecificationIds': '',
            'goodsSpecificationNameValue': '',
            'goodsSn': '',
            'goodsNumber': '',
            'isDelete': 0,
            'goodsDefault': 0
        }],
        categories: [],//一级分类
        categoriesTwo: [],
        macros: [],//商品单位
        attributeCategories: []//属性类别
    },
    methods: {
        delSpeRow: function (index) {
            //最后一行时禁止删除
            if (vm.productEntityList.length == 1) {
                return;
            }
            vm.productEntityList[index].isDelete = 1;
        },
        addSpeRow: function () {
            let goodsId = '';
            if (vm.goods) {
                goodsId = vm.goods.id;
            }
            vm.productEntityList.push({
                'id': '',
                'goodsId': '',
                'goodsSpecificationIds': '',
                'goodsSpecificationNameValue': '',
                'goodsSn': '',
                'goodsNumber': '',
                'isDelete': 0,
                'goodsDefault': 0
            })
        },
        delAttrRow: function (index) {
            //最后一行时禁止删除
            if (vm.attributeEntityList.length == 1) {
                return;
            }
            vm.attributeEntityList[index].isDelete = 1;
        },
        addAttrRow: function () {
            let goodsId = '';
            if (vm.goods) {
                goodsId = vm.goods.id;
            }
            vm.attributeEntityList.push({'id': '', 'goodsId': goodsId, 'attributeId': '', 'value': '', 'isDelete': 0})
        },
        reloadSearch: function () {
            vm.q = {
                name: '',
                goodsSn: '',
                category: '',
                categoryTwo: ''
            }
            vm.reload();
        },
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.uploadList = [];
            vm.goods = {
                primaryPicUrl: '',
                listPicUrl: '',
                categoryId: '',
                isOnSale: 1,
                isAppExclusive: 0,
                isLimited: 0,
                isHot: 0,
                categoryName: ''
            };
            $('#goodsDesc').editable('setHTML', '');
            vm.getCategory();
            vm.macros = [];
            vm.attributeCategories = [];
            vm.getMacro();
            vm.getAttributeCategories();
            vm.getAttributes();
            vm.getSpecification();
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
            vm.getAttributeCategories();
            vm.getGoodsGallery(id);
            vm.getAttributes();
        },
        getAttributes: function () {
            $.get("../attribute/queryAll", function (r) {
                vm.attributes = r.list;
            });
        },
        /**
         * 获取单位
         */
        getMacro: function () {
            $.get("../sys/macro/queryMacrosByValue?value=goodsUnit", function (r) {
                vm.macros = r.list;
            });
        },
        getGoodsGallery: function (id) {//获取商品顶部轮播图
            $.get("../goodsgallery/queryAll?goodsId=" + id, function (r) {
                vm.uploadList = r.list;
            });
        },
        getAttributeCategories: function () {
            $.get("../attributecategory/queryAll", function (r) {
                vm.attributeCategories = r.list;
            });
        },
        saveOrUpdate: function (event) {
            var url = vm.goods.id == null ? "../goods/save" : "../goods/update";
            vm.goods.goodsDesc = $('#goodsDesc').editable('getHTML');
            vm.goods.goodsImgList = vm.uploadList;
            vm.goods.attributeEntityList = vm.attributeEntityList;
            vm.goods.productEntityList = vm.productEntityList;
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(vm.goods),
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
        enSale: function () {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }
            confirm('确定要上架选中的商品？', function () {
                $.ajax({
                    type: "POST",
                    url: "../goods/enSaleBatch",
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
        openSpe: function () {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            openWindow({
                type: 2,
                title: '商品规格',
                content: '../shop/goodsspecification.html?goodsId=' + id
            })
        },
        openPro: function () {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            openWindow({
                type: 2,
                title: '产品设置',
                content: '../shop/product.html?goodsId=' + id
            });
        },
        unSale: function () {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }
            confirm('确定要下架选中的商品？', function () {
                $.ajax({
                    type: "POST",
                    url: "../goods/unSaleBatch",
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
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../goods/delete",
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
            $.get("../goods/info/" + id, function (r) {
                vm.goods = r.goods;
                vm.getCategory();
                if (r.goods.attributeEntityList.length > 0) {
                    vm.attributeEntityList = r.goods.attributeEntityList;
                } else {
                    vm.attributeEntityList = [{'id': '', 'goodsId': '', 'attributeId': '', 'value': ''}];
                }
                if (r.goods.productEntityList.length > 0) {
                    vm.productEntityList = r.goods.productEntityList;
                } else {
                    vm.productEntityList = [{
                        'id': '',
                        'goodsId': '',
                        'goodsSpecificationIds': '',
                        'goodsSpecificationNameValue': '',
                        'goodsSn': '',
                        'goodsNumber': '',
                        'isDelete': 0,
                        'goodsDefault': 0
                    }]
                }
                $('#goodsDesc').editable('setHTML', vm.goods.goodsDesc);
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {
                    'name': vm.q.name,
                    'goodsSn': vm.q.goodsSn,
                    'category': vm.q.category,
                    'categoryTwo': vm.q.categoryTwo
                },
                page: page
            }).trigger("reloadGrid");
            vm.handleReset('formValidate');
        },
        getCategory: function () {
            //加载分类树
            $.get("../category/queryAll", function (r) {
                ztree = $.fn.zTree.init($("#categoryTree"), setting, r.list);
                var node = ztree.getNodeByParam("id", vm.goods.categoryId);
                if (node) {
                    ztree.selectNode(node);
                    vm.goods.categoryName = node.name;
                } else {
                    node = ztree.getNodeByParam("id", 0);
                    ztree.selectNode(node);
                    vm.goods.categoryName = node.name;
                }
            })
        },
        categoryTree: function () {
            openWindow({
                title: "选择类型",
                area: ['300px', '450px'],
                content: jQuery("#categoryLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级菜单
                    vm.goods.categoryId = node[0].id;
                    vm.goods.categoryName = node[0].name;

                    layer.close(index);
                }
            });
        },
        handleView(name) {
            this.imgName = name;
            this.visible = true;
        },
        changeCategories: function (opt) {
            var value = opt.value;
            $.get("../category/getCategorySelectByParent?parentId=" + value, function (r) {
                vm.categoriesTwo = r.list;
                vm.reload();
            });
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
        },
        handleSuccessPicUrl: function (res, file) {
            vm.goods.primaryPicUrl = file.response.url;
        },
        handleSuccessListPicUrl: function (res, file) {
            vm.goods.listPicUrl = file.response.url;
        },
        eyeImagePicUrl: function () {
            var url = vm.goods.primaryPicUrl;
            eyeImage(url);
        },
        eyeImageListPicUrl: function () {
            var url = vm.goods.listPicUrl;
            eyeImage(url);
        },
        eyeImage: function (e) {
            eyeImage($(e.target).attr('src'));
        }
    },
    mounted() {
        this.uploadList = this.$refs.upload.fileList;
        $.get("../category/getCategorySelect", function (r) {
            vm.categories = r.list;
        })
    }
});