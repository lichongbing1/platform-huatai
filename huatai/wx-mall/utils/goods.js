var api = require('../config/api.js');
var util = require('./util.js');

function getCheckedProductItem(key, gThat) {
    return gThat.data.productList.filter(function (v) {
        if (v.goods_specification_ids == key) {
            return true;
        } else {
            return false;
        }
    });
}

function changeSpecInfo(gThat) {
    let checkedNameValue = getCheckedSpecValue(gThat);

    //设置选择的信息
    let checkedValue = checkedNameValue.filter(function (v) {
        if (v.valueId != 0) {
            return true;
        } else {
            return false;
        }
    }).map(function (v) {
        return v.valueText;
    });
    if (checkedValue.length > 0) {
        gThat.setData({
            checkedSpecText: checkedValue.join('　')
        });
    } else {
        gThat.setData({
            checkedSpecText: '请选择规格数量'
        });
    }
    //根据选中的规格，判断是否有对应的sku信息
    let checkedProduct = getCheckedProductItem(getCheckedSpecKey(gThat), gThat);
    if (checkedProduct && checkedProduct.length > 0) {
        gThat.setData({
            checkedProduct: checkedProduct
        })
    }
}
function getCheckedSpecKey(gThat) {
    let checkedValue = getCheckedSpecValue(gThat).map(function (v) {
        return v.valueId;
    });
    return checkedValue.join('_');
}

//获取选中的规格信息
function getCheckedSpecValue(gThat) {
    let checkedValues = [];
    let _specificationList = gThat.data.specificationList;
    for (let i = 0; i < _specificationList.length; i++) {
        let _checkedObj = {
            nameId: _specificationList[i].specification_id,
            valueId: 0,
            valueText: ''
        };
        for (let j = 0; j < _specificationList[i].valueList.length; j++) {
            if (_specificationList[i].valueList[j].checked) {
                _checkedObj.valueId = _specificationList[i].valueList[j].id;
                _checkedObj.valueText = _specificationList[i].valueList[j].value;
            }
        }
        checkedValues.push(_checkedObj);
    }
    return checkedValues;
}
//判断规格是否选择完整
function isCheckedAllSpec(gThat) {
    return !getCheckedSpecValue(gThat).some(function (v) {
        if (v.valueId == 0) {
            util.showErrorToast('请选齐规格');
            return true;
        }
    });
}

function cutNumber(gThat) {
    gThat.setData({
        number: (this.data.number - 1 > 1) ? this.data.number - 1 : 1
    });
}

function addNumber(gThat) {
    gThat.setData({
        number: this.data.number + 1
    });
}

module.exports = {
    getCheckedProductItem,
    changeSpecInfo,
    getCheckedSpecKey,
    getCheckedSpecValue,
    isCheckedAllSpec
}


