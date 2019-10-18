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
<script type="text/javascript">
	// 验证登录名
	function checkName(){
		// 获取用户输入的登录名
		var user_name = $("#user_name").val();
		// 进行判断，说明没有输入登录名
		 if(user_name.trim() == ""){
			// 给提示
			$("#prompt").addClass("error");
			$("#prompt").html("用户名不能为空");
		}else{
			// 登录名不为空，ajax请求，验证
			var url = "${pageContext.request.contextPath }/user_checkName.action";
			var param = {"user_name":user_name};
			
			$.post(url,param,function(data){
				// 操作data，进行判断
			    if(data && data == "no"){
					 // 提示
					$("#prompt").removeClass("error");
					$("#prompt").html("请登录"); 
				}
				else{
					$("#prompt").addClass("error");
					$("#prompt").html("用户名不存在，请先注册"); 
				}  
			});
		} 
	}
</script>
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
	            <li><a href="${pageContext.request.contextPath }/admin_information.action"><span class="glyphicon glyphicon-asterisk" ></span></a></li>
	        </ul> 
	    </div>
    </nav>
    <br><br><br>
	<div class="col-center-block" style="text-align:center;">
	    <form class="form-horizontal col-center-block" role="form" method="post" action="${pageContext.request.contextPath }/user_login.action" >
		  <div class="form-group">
		    <label for="lastname" class="col-sm-3 control-label">用户</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="user_name" name="user_name" placeholder="请输入用戶名" onblur="checkName()">
		    </div>
		    <label  id="prompt" for="lastname" ></label>
		  </div>
		  <div class="form-group">
		    <label for="lastname" class="col-sm-3 control-label">密码</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="user_password" name="user_password" placeholder="请输入密码">
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