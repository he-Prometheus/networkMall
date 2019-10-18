<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css"/>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<title>商品编辑页</title>
</head>
<script type="text/javascript">
function deleteGoods(id){
  	 $.ajax({
  		    url : "${pageContext.request.contextPath }/goods_delete.action",
  	        async : true,
  	        type : "POST",
  	        data : {
  	            "goods_id" : id
  	        },
  	        success : function(data) {
  	            alert(data);
  	            // 删除成功后刷新页面
  	            window.location.reload();
  	        },
  	        error : function() {
  	            alert("删除失败");
  	        },
  	        dataType : "text"
  	    });
  }
</script>
<body>
  <a href="${pageContext.request.contextPath }/jsp/goods/add.jsp">
	<span class="glyphicon glyphicon-plus">上传商品</span>
  </a>
 <table class="table table-bordered">
	<caption>上传的商品</caption>
	<thead>
	    <tr>
	    <td width="5%"><a href="${pageContext.request.contextPath }/goods_findByPage.action">全部</a></td>
        <td width="20%"><a href="${pageContext.request.contextPath }/goods_findByPage.action?category=1">书籍文具</a></td>
        <td width="10%"><a href="${pageContext.request.contextPath }/goods_findByPage.action?category=2">鞋服配饰</a></td>
        <td width="35%"><a href="${pageContext.request.contextPath }/goods_findByPage.action?category=3">电器用品</a></td>
        <td width="10%"><a href="${pageContext.request.contextPath }/goods_findByPage.action?category=4">数码科技</a></td>
        <td width="10%"><a href="${pageContext.request.contextPath }/goods_findByPage.action?category=5">其他</a></td>
		<tr>
		    <th width="5%"><input type="checkbox" id="selectAll" ></th>
			<th width="20%">商品名称</th>
			<th width="10%">商品价格</th>
			<th width="35%">商品商品描述</th>
			<th width="10%">商品上传时间</th>
			<th width="10%">编辑商品</th>
		</tr>
		
	</thead>
	<tbody>
	
	<c:forEach items="${page.beanList}" var="goods">
		<tr>
		    <td><input type="checkbox" class="itemSelect"></td>
			<td>${goods.goods_name }</td>
			<td>${goods.goods_price }</td>
			<td>${goods.goods_desc  }</td>
			<td>${goods.goods_modified_time  }</td>
			<th width="10%">
			    <a href="${pageContext.request.contextPath }/goods_edit?goods_id=${goods.goods_id }">修改</a>|
			    <a href="javascript:void(0);" onclick="deleteGoods(${goods.goods_id})">删除</a>
			</th>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>