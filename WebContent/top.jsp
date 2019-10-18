<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
<script type="text/javascript">

$(document).ready(function () { 
	var user="${existUser.user_name }"; 
    if(user!=null && user.length > 0){
       $("#before1").hide();
       $("#before2").hide();
    }else{
       $("#after1").hide();
       $("#after2").hide();
    }
    
    });

</script>
<style type="text/css">
        body{
            margin-top: 60px;
        }
</style>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
    <div class="navbar-header">
         <ul class="nav navbar-nav">
         <li class="active"><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=0">商城首页</a></li>
         </ul>
    </div>
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=1">书籍文具</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=2">鞋服配饰</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=3">电器用品</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=4">运动音乐</a></li>
            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=5">其他</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
              <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath }/showGoods_findByPage1.action">
            	<div class="form-group">
                	<input type="text" class="form-control" placeholder="Search" name="goods_name">
            	</div>
            	<button type="submit" class="btn btn-default">查找</button>
       		 </form>
             <li id="before1"><a href="${pageContext.request.contextPath }/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
             <li id="before2"><a href="${pageContext.request.contextPath }/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
             <li id="after1"><a href="${pageContext.request.contextPath }/user_info.action"><span class="glyphicon glyphicon-user"></span>${existUser.user_name }个人中心</a></li>
             <li id="after2"><a href="${pageContext.request.contextPath }/user_exit.action"><span class="glyphicon glyphicon-user" ></span> 退出登录</a></li>
             <li><a href="${pageContext.request.contextPath }/admin_information.action"><span class="glyphicon glyphicon-asterisk" ></span></a></li>
        </ul> 
    </div>
	</div>
</nav>

</body>
</html>