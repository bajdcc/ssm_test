<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://github.com/bajdcc" prefix="cc"%>
<!DOCTYPE HTML>
<html>
<head>
<title>ssm</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<cc:css url="~/css/bootstrap.min.css" />
<cc:css url="~/css/bootstrap-table.css" />
<cc:css url="~/css/bootstrap-editable.css" />
<cc:script url="~/js/jquery-1.11.1.js" />
<cc:script url="~/js/bootstrap.min.js" />
<cc:script url="~/js/bootstrap-table.js" />
<cc:script url="~/js/bootstrap-table-zh-CN.js" />
<cc:script url="~/js/bootstrap-table-export.js" />
<cc:script url="~/js/tableExport.js" />
<cc:script url="~/js/bootstrap-table-editable.js" />
<cc:script url="~/js/bootstrap-editable.min.js" />
<script>
	$(document).ready(function() {
		var $table = $('#table'),
        	$remove = $('#remove'),
        	selections = [];
		$table.bootstrapTable({
			url : 'ajaxAllUser',
			height: $(window).height() - $('h1').outerHeight(true),
			pagination : true,
			search : true,
			searchOnEnterKey : true,
			showFooter : true,
			showColumns : true,
			showRefresh : true,
			showToggle : true,
			showPaginationSwitch : true,
			showExport : true,
			showFooter : true,
			detailView : true,
			detailFormatter : function(index, row){
				var html = [];
		        $.each(row, function (key, value) {
		            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
		        });
		        return html.join('');
			},
			idField : "id",
			uniqueId : "id",
			clickToSelect : true,
			toolbar: "#toolbar",
			responseHandler : function (res) {
		        $.each(res, function (i, row) {
		            row.state = $.inArray(row.id, selections) !== -1;
		        });
		        return res;
		    },
			columns : [
		                [
		                    {
		                    	title: '状态',
		                        field: 'state',
		                        checkbox: true,
		                        rowspan: 2,
		                        align: 'center',
		                        valign: 'middle'
		                    }, {
		                        title: '用户ID',
		                        field: 'id',
		                        rowspan: 2,
		                        align: 'center',
		                        valign: 'middle',
		                        sortable: true,
		                        footerFormatter: function(data){return "总数";}
		                    }, {
		                        title: '详细信息',
		                        colspan: 3,
		                        align: 'center'
		                    }
		                ],
		                [
		                    {
		                        field: 'username',
		                        title: '用户名',
		                        sortable: true,
		                        editable: true,
		                        align: 'center',
		                        editable: {
		                            type: 'text',
		                            title: '用户名',
		                            validate: function (value) {
		                                value = $.trim(value);
		                                if (!value) {
		                                    return '不能为空';
		                                }
		                                var data = $table.bootstrapTable('getData'),
		                                    index = $(this).parents('tr').data('index');
		                                console.log(data[index]);
		                                return '';
		                            }
		                        },
		                        footerFormatter: function(data){return data.length;}
		                    }, {
		                        field: 'password',
		                        title: '密码',
		                        sortable: true,
		                        align: 'center',
		                        editable: {
		                            type: 'text',
		                            title: '密码',
		                            validate: function (value) {
		                                value = $.trim(value);
		                                if (!value) {
		                                    return '不能为空';
		                                }
		                                var data = $table.bootstrapTable('getData'),
		                                    index = $(this).parents('tr').data('index');
		                                console.log(data[index]);
		                                return '';
		                            }
		                        },
		                        footerFormatter: function(data){return data.length;}
		                    }, {
		                        field: 'operate',
		                        title: '操作',
		                        align: 'center',
		                        events: {
		                            'click .like': function (e, value, row, index) {
		                                alert('你点击了喜欢按钮，信息： ' + JSON.stringify(row));
		                            },
		                            'click .remove': function (e, value, row, index) {
		                                $table.bootstrapTable('remove', {
		                                    field: 'id',
		                                    values: [row.id]
		                                });
		                            }
		                        },
		                        formatter: function(value, row, index) {
		                            return [
		                                    '<a class="like" href="javascript:void(0)" title="喜欢">',
		                                    '<i class="glyphicon glyphicon-heart"></i>',
		                                    '</a>  ',
		                                    '<a class="remove" href="javascript:void(0)" title="删除">',
		                                    '<i class="glyphicon glyphicon-remove"></i>',
		                                    '</a>'
		                                ].join('');
		                            }
		                    }
		                ]
		            ],
		});
		
		// sometimes footer render error.
		setTimeout(function () {
            $table.bootstrapTable('resetView');
        }, 200);
		
		$table.on('check.bs.table uncheck.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);

            // save your data, here just save the current page
            selections = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.id
            });
            // push or splice the selections if you want to save all data selections
        });
		
		$table.on('all.bs.table', function (e, name, args) {
	        console.log(name, args);
	    });
		
		$remove.click(function () {
            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.id
            });
            $table.bootstrapTable('remove', {
                field: 'id',
                values: ids
            });
            $remove.prop('disabled', true);
        });
		
        $(window).resize(function () {
            $table.bootstrapTable('resetView', {
                height: $(window).height() - $('h1').outerHeight(true)
            });
        });
	});
</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="span2"></div>
			<div class="span6">
				<h1>User Info</h1>
				<div id="toolbar">
        			<button id="remove" class="btn btn-danger" disabled>
            			<i class="glyphicon glyphicon-remove"></i> 删除
        			</button>
    			</div>
				<table id="table"></table>
			</div>
			<div class="span4"></div>
		</div>
	</div>
</body>
</html>
