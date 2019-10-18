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
<form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/user_update.action" onsubmit="javascript:return confirm('您确认要提交表单吗？');">
  <!-- 隐藏商品主键 -->
  <input type="hidden" name="user_id" value="${editUser.user_id }">
  <div class="form-group">
    <label for="firstname" class="col-xs-3 control-label">用户名称</label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="firstname" placeholder="请输入用户名称" name="user_name"value="${editUser.user_name }">
    </div>
  </div>
   <div class="form-group">
    <label for="firstname" class="col-xs-3 control-label">用户密码</label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="firstname" placeholder="请输入用户密码" name="user_password"value="${editUser.user_password }">
    </div>
  </div>
  <div class="form-group">
    <label for="firstname" class="col-xs-3 control-label">用户邮箱</label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="firstname" placeholder="请输入用户邮箱" name="user_email" readonly="true" value="${editUser.user_email }">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-xs-3 control-label">用户余额</label>
    <div class="col-xs-6">
      <input type="text" class="form-control" id="lastname" name="user_money" readonly="true"  value="${editUser.user_money }">
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-xs-offset-5 col-xs-5">
      <button type="submit" class="btn btn-default">修改</button>
    </div>
  </div>
</form>
</body>
</html>