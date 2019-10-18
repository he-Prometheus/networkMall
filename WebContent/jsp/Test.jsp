<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>
       	<script src="../js/jquery.min.js"></script>
       	<script src="../js/bootstrap.min.js"></script>
		<title>商城首页</title>
</head>

<body onload="fun()">
	<table>
	<TR
		style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
		<TD>商品名称</TD>
		<TD>商品价格</TD>
		<TD>商品描述</TD>
	</TR>
	<c:forEach items="${userInfo.goodsSet }" var="goods">
	<TR
		style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
		<TD>${goods.goods_name }</TD>
		<TD>${goods.goods_price }</TD>
		<TD>${goods.goods_desc  }</TD>
	
	</TR>
	</c:forEach>
	
		<c:forEach items="${userInfo.orders }" var="order">
	<TR
		style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
		<TD>${order.order_id }</TD>
		
		<TD>${order.orderGoods.goods_name }</TD>
		<TD>${order.orderGoods.goods_price }</TD>
		<TD>${order.orderGoods.goods_desc }</TD>
		<TD>${order.order_modified_time  }</TD>
	</TR>
	</c:forEach>
    </table>
</body>
</html>