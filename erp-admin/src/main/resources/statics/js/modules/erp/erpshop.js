$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'erp/erpshop/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true,hidden: true },
            { label: '店铺名称（类别数）', name: 'title', width: 80, formatter: function(value, options, row){
                return '<a href="' + row.url +'" target="_blank">'+value+'<span style="color:red">('+row.typecount+')</span></a>';
                }},
            { label: '商品数', name: 'goodsCount', width: 60 },
            { label: '编码', name: 'code', width: 60 },
            { label: '类别', name: 'typenames', width: 80 },
            { label: '发货地', name: 'fromAddr', index: 'from_addr', width: 60 },
            { label: '状态', name: 'status', width: 60, formatter: function(value, options, row){
                    return value == '0' ?
                        '<span class="label label-danger">禁用</span>' :
                        '<span class="label label-success">正常</span>';
                }},
			{ label: '创建时间', name: 'createTime', index: 'create_time', width: 80 }
        ],
		viewrecords: true,
        height: 550,
        rowNum: 30,
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
		erpShop: {
		    status: '1'
        },
        q: {
            title: '',
            code: ''
        }
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.erpShop = {
                status: '1'
            };

            layui.use(['transfer', 'layer', 'util'], function(){
                var $ = layui.$
                    ,transfer = layui.transfer
                $.get(baseURL + "erp/erptype/queryAll", function(r){
                    var data1 = [];
                    for(let erpType of r.erpTypes){
                        data1.push({"value": erpType.id, "title": erpType.name, "disabled": erpType.status == '1' ? false : true});
                    }

                    //实例调用
                    transfer.render({
                        elem: '#shoptype'
                        ,data: data1
                        ,id: 'shoptype' //定义唯一索引
                        ,showSearch: true
                        ,title: ['待选区', '已选区']
                    })
                });
            });
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            vm.erpShop = {
                status: '1'
            };
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
		    $('#btnSaveOrUpdate').button('loading').delay(1000).queue(function() {
                var url = vm.erpShop.id == null ? "erp/erpshop/save" : "erp/erpshop/update";

                var shoptypes = layui.transfer.getData('shoptype'); //获取右侧数据

                vm.erpShop.typeIds = "";
                for(let type of shoptypes){
                    vm.erpShop.typeIds += type.value + ",";
                }

                if(vm.erpShop.typeIds.length > 0){
                    vm.erpShop.typeIds = vm.erpShop.typeIds.substring(0,vm.erpShop.typeIds.length-1);
                }

                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    contentType: "application/json",
                    data: JSON.stringify(vm.erpShop),
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
                        url: baseURL + "erp/erpshop/delete",
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
			$.get(baseURL + "erp/erpshop/info/"+id, function(r){
                vm.erpShop = r.erpShop;

                layui.use(['transfer', 'layer', 'util'], function(){
                    var $ = layui.$
                        ,transfer = layui.transfer
                    $.get(baseURL + "erp/erptype/queryAll", function(r){
                        var data1 = [];
                        for(let erpType of r.erpTypes){
                            data1.push({"value": erpType.id, "title": erpType.name, "disabled": erpType.status == '1' ? false : true});
                        }

                        //实例调用
                        transfer.render({
                            elem: '#shoptype'
                            ,data: data1
                            ,id: 'shoptype' //定义唯一索引
                            ,showSearch: true
                            ,title: ['待选区', '已选区']
                            ,value: vm.erpShop.typeIds.split(",")
                        })
                    });
                });
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'title': vm.q.title,'code': vm.q.code},
                page:page
            }).trigger("reloadGrid");
		}
	}
});