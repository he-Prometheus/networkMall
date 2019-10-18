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
<title>商品修改页</title>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
    <div class="navbar-header">
         <ul class="nav navbar-nav">
         <li class="active"><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=0">商城首页</a></li>
         </ul>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=1">书籍文具</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=2">鞋服配饰</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=3">电器用品</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=4">数码科技</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=5">其他</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li id="after1"><a href="${pageContext.request.contextPath }/user_info.action"><span class="glyphicon glyphicon-user"></span>${existUser.user_name }个人中心</a></li>
            <li><a href="${pageContext.request.contextPath }/admin_information.action"><span class="glyphicon glyphicon-asterisk" ></span></a></li>
        </ul> 
    </div>
	</div>
</nav>

<br><br><br><br>
<form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/goods_update.action" method="post" enctype="multipart/form-data">
  <!-- 隐藏商品主键 -->
  <input type="hidden" name="goods_id" value="${goods.goods_id }">
  <!--  隐藏商品图片名称 -->
  <c:forEach items="${goods.imgs}" var="img" varStatus="status">
    <input type="checkbox" name="img_url" value="${img.img_url}" checked="checked" style="display:none"/> 
  </c:forEach>      
  <div class="form-group">
    <label for="firstname" class="col-xs-3 control-label">商品名称</label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="firstname" placeholder="请输入商品名称" name="goods_name" value="${goods.goods_name }">
    </div>
  </div>
  
   <div class="form-group">
    <label for="lastname" class="col-xs-3 control-label">商品分类</label>
    <div class="col-xs-6">
       <select class="form-control" name="category">
			<option selected="selected" value="1" name="category">书籍文具</option>
			<option value="2" name="category">鞋服配饰</option>
			<option value="3" name="category">电器用品</option>		
			<option value="4" name="category">数码科技</option>	
			<option value="5" name="category">其他</option>	
	   </select>	
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-xs-3 control-label">商品价格（￥）</label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="lastname" placeholder="请输入商品价格" name="goods_price" value="${goods.goods_price }">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-xs-3 control-label">商品描述</label>
    <div class="col-xs-6">
       <textarea class="form-control" rows="3" name="goods_desc">${goods.goods_desc }</textarea>
    </div>
  </div>
  
   <div class="form-group">
    <label for="lastname" class="col-xs-3 control-label">文件上传</label>
    <div class="col-xs-6">
        <input type="file" id="inputfile" name="upload"> <br>
        <input type="file" id="inputfile" name="upload"> <br>
        <input type="file" id="inputfile" name="upload"> <br>
    </div>
  </div>
  <div class="form-group">
    <div class="col-xs-offset-5 col-xs-5">
      <button type="submit" class="btn btn-default">提交</button>
    </div>
  </div>
</form>
</body>
</html>