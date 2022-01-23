$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'erp/erpgoods/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true,hidden: true },
            { label: '标题', name: 'title', width: 150, formatter: function(value, options, row){
                    return '<a href="' + row.url +'" target="_blank">'+value+'</a>';
                }},
			{ label: '产品编号', name: 'code', index: 'code', width: 60 },
            { label: '店铺', name: 'shopName', width: 60, formatter: function(value, options, row){
                    return '<a href="' + row.shopUrl +'" target="_blank">'+value+'</a>';
                }},
            { label: '图片', name: 'imgs', index: 'imgs',width: 80, formatter: function(value, options, row){
                return '<image src="'+value+'" width="150px" height="150px"/>'
                }},
			{ label: '发货地', name: 'fromAddr', index: 'from_addr', width: 60 },
			{ label: '起批量', name: 'minBuy', index: 'min_buy', width: 40 },
			{ label: '进货价', name: 'price', index: 'price', width: 40 },
			{ label: '快递费', name: 'courierFee', index: 'courier_fee', width: 40 },
			{ label: '发货时间', name: 'deliveryTime', index: 'delivery_time', width: 40 },
            { label: '状态', name: 'status', width: 40, formatter: function(value, options, row){
                    return value == '0' ?
                        '<span class="label label-danger">禁用</span>' :
                        '<span class="label label-success">正常</span>';
                }},
            { label: '状态', name: 'collectionStatus', width: 40, formatter: function(value, options, row){
                var html = "";
                if(value == '0'){
                    html = "<span class=\"label label-danger\">未采集</span>";
                }else if(value == '1'){
                    html = "<span class=\"label label-warning\">采集未上线</span>";
                }else{
                    html = "<span class=\"label label-success\">已上线</span>";
                }
                return html;
            }},
			{ label: '创建时间', name: 'createTime', index: 'create_time', width: 80 }
        ],
		viewrecords: true,
        height: 650,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		erpGoods: {
		    status: '1',
            collectionStatus: '1'
        },
        shops: {},
        types: {},
        q: {
		    title: '',
            code: '',
            shopid: '',
            typeid: ''
        }
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.erpGoods = {
                status: '1',
                collectionStatus: '0',
                shopid: '',
                goodTypes: ''
            };
            vm.getShops();
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            vm.getShops();
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
            var goodtypes = layui.transfer.getData('goodtype'); //获取右侧数据
            vm.erpGoods.goodTypes = "";
            for(let type of goodtypes){
                vm.erpGoods.goodTypes += type.value + ",";
            }

            if(vm.erpGoods.goodTypes.length > 0){
                vm.erpGoods.goodTypes = vm.erpGoods.goodTypes.substring(0,vm.erpGoods.goodTypes.length-1);
            }

		    $('#btnSaveOrUpdate').button('loading').delay(1000).queue(function() {
                var url = vm.erpGoods.id == null ? "erp/erpgoods/save" : "erp/erpgoods/update";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.erpGoods),
                    success: function(r){
                        if(r.code === 0){
                             layer.msg("操作成功", {icon: 1});
                             vm.reload();
                             $('#btnSaveOrUpdate').button('reset');
                             $('#btnSaveOrUpdate').dequeue();
                        }else{
                            layer.alert(r.msg);
                            $('#btnSaveOrUpdate').button('reset');
                            $('#btnSaveOrUpdate').dequeue();
                        }
                    }
                });
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			var lock = false;
            layer.confirm('确定要删除选中的记录？', {
                btn: ['确定','取消'] //按钮
            }, function(){
               if(!lock) {
                    lock = true;
		            $.ajax({
                        type: "POST",
                        url: baseURL + "erp/erpgoods/delete",
                        contentType: "application/json",
                        data: JSON.stringify(ids),
                        success: function(r){
                            if(r.code == 0){
                                layer.msg("操作成功", {icon: 1});
                                $("#jqGrid").trigger("reloadGrid");
                            }else{
                                layer.alert(r.msg);
                            }
                        }
				    });
			    }
             }, function(){
             });
		},
		getInfo: function(id){
			$.get(baseURL + "erp/erpgoods/info/"+id, function(r){
                vm.erpGoods = r.erpGoods;
                vm.getGoodTypes();
            });
		},
        getShops: function(){
            $.ajax({
                type: "POST",
                url: baseURL + "erp/erpshop/queryAll",
                contentType: "application/json",
                data: null,
                success: function(r){
                    if(r.code == 0){
                        vm.shops = r.shops;
                    }else{
                        layer.alert(r.msg);
                    }
                }
            });
        },
        getTypes: function(){
            $.get(baseURL + "erp/erptype/queryAll", function(r){
                vm.types = r.erpTypes;
            });
        },
        generateCode: function(){
            var goodtypes = layui.transfer.getData('goodtype'); //获取右侧数据

            vm.erpGoods.goodTypes = "";
            for(let type of goodtypes){
                vm.erpGoods.goodTypes += type.value + ",";
            }

            if(vm.erpGoods.goodTypes.length > 0){
                vm.erpGoods.goodTypes = vm.erpGoods.goodTypes.substring(0,vm.erpGoods.goodTypes.length-1);
            }

		    if(!vm.erpGoods.shopid || !vm.erpGoods.goodTypes || vm.erpGoods.goodTypes.length <= 0){
                layer.alert("请先选择店铺和分类");
		        return;
            }
            $.ajax({
                type: "POST",
                url: baseURL + "erp/erpgoods/generateCode",
                contentType: "application/json",
                data: JSON.stringify(vm.erpGoods),
                success: function(r){
                    if(r.code == 0){
                        vm.$set(vm.erpGoods,"code",r.goodsCode);
                    }else{
                        layer.alert(r.msg);
                    }
                }
            });
        },
        getGoodTypes: function(){
		    if(vm.erpGoods.shopid) {
                layui.use(['transfer', 'layer', 'util'], function () {
                    var $ = layui.$
                        , transfer = layui.transfer
                    $.get(baseURL + "erp/erptype/queryById/" + vm.erpGoods.shopid, function (r) {
                        var data1 = [];
                        for (let erpType of r.erpTypes) {
                            data1.push({
                                "value": erpType.id,
                                "title": erpType.code + '-' + erpType.name,
                                "disabled": erpType.status == '1' ? false : true
                            });
                        }

                        //实例调用
                        transfer.render({
                            elem: '#goodtype'
                            ,
                            data: data1
                            ,
                            id: 'goodtype' //定义唯一索引
                            ,
                            showSearch: true
                            ,
                            title: ['待选区', '已选区']
                            ,
                            value: (vm.erpGoods.goodTypes != null && vm.erpGoods.goodTypes != '' && vm.erpGoods.goodTypes.length > 0) ? vm.erpGoods.goodTypes.split(",") : []
                        })
                    });
                });
            }
        },
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'title': vm.q.title,'code': vm.q.code,'shopid': vm.q.shopid,'typeid': vm.q.typeid},
                page:page
            }).trigger("reloadGrid");
		}
	},
    created:function (){
        this.getShops();
        this.getTypes();
    }
});