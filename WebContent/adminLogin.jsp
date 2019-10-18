<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>

<style>
.col-center-block {
    float: none;
    display: block;
    margin-left: auto;
    margin-right: auto;
}
</style>


<body>
     <nav class="navbar navbar-default" role="navigation"> 
	    <div class="collapse navbar-collapse" id="example-navbar-collapse">
	       <ul class="nav navbar-nav">
	            <li class="active"><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=0">商城首页</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=1">书籍文具</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=2">鞋服配饰</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=3">电器用品</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=4">运动音乐</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=5">其他</a></li>
	        </ul>
	        <ul class="nav navbar-nav navbar-right"> 
                <li id="before1"><a href="${pageContext.request.contextPath }/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
	            <li id="before2"><a href="${pageContext.request.contextPath }/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	        </ul> 
	    </div>
    </nav>
	
	<br><br><br>
	<div class="col-center-block" style="text-align:center;">
    <form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath }/admin_login.action" width="50%">
		  <div class="form-group">
		    <label for="lastname" class="col-sm-3 control-label">用户</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="adm_name" name="adm_name" placeholder="请输入用戶名">
		      <label id="prompt" for="lastname" ></label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="lastname" class="col-sm-3 control-label">密码</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="adm_password" name="adm_password" placeholder="请输入密码">
		    </div>
		  </div>
		  <br>
		  <div class="form-group">
		    <div class="col-sm-offset-3 col-sm-5">
		      <button type="submit" class="btn btn-default">登录</button>
		    </div>
		  </div>
	</form>
	</div>
</body>
</html>