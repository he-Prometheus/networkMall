<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<title>用户注册</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	// 验证登录名
	function checkName(){
		// 获取用户输入的登录名
		var name = $(".username").val();
		// 进行判断，说明没有输入登录名
		 if(name.trim() == ""){
			// 给提示
			$("#prompt").addClass("error");
			$("#prompt").html("注册名不能为空");
		}else{
			// 登录名不为空，ajax请求，验证
			var url = "${pageContext.request.contextPath }/user_checkName.action";
			var param = {"user_name":name};
			$.post(url,param,function(data){
				// 操作data，进行判断
				  if(data && data == "yes"){
					 // 提示
					$("#prompt").removeClass("error");
					$("#prompt").html("可以注册"); 
				}else{
					$("#prompt").addClass("error");
					$("#prompt").html("注册名已经存在"); 
				}  
				
			});
		} 
	}
	
	//判断密码是否为空
	function checkPass(){
		var password=$(".password").val();
		var len = password.length;
		if(password.trim()==""){
			$("#pass").addClass("error");
			$("#pass").html("密码不能为空格")
		}else{
			$("#pass").addClass("error");
			$("#pass").html("密码已输入"+len+"个数")
		}
	}
	//判断两次密码是否输入一致
	function checkrePass(){
		var password=$(".password").val();
		var repassword=$(".repassword").val();
		if(repassword != password){
			$("#repass").addClass("error");
			$("#repass").html("密码不匹配")
		}
		else{
			$("#repass").removeClass("error");
			$("#repass").html("密码匹配");
		}
	}
	
	//邮箱激活
	function sendE_mail(){
		var email = $(".email").val();
		var url = "${pageContext.request.contextPath}/user_sendEmail.action";
		var param = {"user_email":email};
		$("#sendEmail").html("请等待邮箱激活"); 
		$.post(url,param,function(data){
			// 操作data，进行判断
			  if(data && data == "yes"){
				 // 提示
				$("#sendEmail").removeClass("error");
				$("#sendEmail").html("邮箱激活成功"); 
			}else{
				$("#sendEmail").addClass("error");
				$("#sendEmail").html("邮箱激活失败"); 
			}  
			
		});
		
	}
	
	//生成验证码
	function changeImg(){
	    var imgSrc = $("#imgObj");    
        var src = imgSrc.attr("src");        
        imgSrc.attr("src", chgUrl(src));
	}
	
	//时间戳,防止验证码重复
	function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = "${pageContext.request.contextPath}/user_getCode.action";
        if ((url.indexOf("&") >= 0)) {
            url = url + "?tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
	}
	
	
	//判断验证码是否输入正确,因为jsp页面和session的加载不一致，所以到java后台验证
	function checkCode(){
		var checkcode=$(".code").val();
		var url = "${pageContext.request.contextPath }/user_checkCode.action";
		var param = {"checkcode":checkcode};
		$.post(url,param,function(data){
			if(data && data=="yes"){
				$("#code").removeClass("error");
				$("#code").html("验证码正确"); 
			}else{
				$("#code").removeClass("error");
				$("#code").html("验证码错误"); 
			}
		});
	}
	
	// 可以阻止表单的提交
	function checkForm(){
		// 先让校验名称的方法先执行以下
		// 获取error的数量，如果数量 > 0，说明存在错误，不能提交表单
		if("可以注册"==$("#prompt").html()&&"密码匹配"==$("#repass").html()){
			 if("邮箱激活成功"==$("#sendEmail").html()&&"验证码正确"==$("#code").html()){
				 return true;
			 }else{
				 return false;
			 }
		}
		else{
			return false;
		} 
	}
	
</script>
</head>
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
	         <li id="before2"><a href="${pageContext.request.contextPath }/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	         <li><a href="${pageContext.request.contextPath }/admin_information.action"><span class="glyphicon glyphicon-asterisk" ></span></a></li>
	     </ul> 
	 </div>
	</nav>

	<div class="regist">
		<div class="regist_center">
			<div class="regist_top">
				<div class="left fl">用户注册</div>
				<div class="right fr"><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=0" target="_self">人文商城</a></div>
				<div class="clear"></div>
				<div class="xian center"></div>
			</div>
		</div>
	    <div class="regist_center"> 
		<div class="regist_main center">
		     <form method="post" action="${pageContext.request.contextPath }/user_regist.action" onsubmit="return checkForm()">
				<div class="user">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;
					<input class="username" name="user_name" type="text" onblur="checkName()"/>
					<span id="prompt">请输入注册名</span>
				</div>
				<div class="user">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;
					<input class="password" name="user_password" type="password" onblur="checkPass()"/>
					<span id="pass">请输入6位以上字符</span>
				</div>
				
				<div class="user">确认密码:&nbsp;&nbsp;
					<input class="repassword" name="user_repassword" type="password" onblur="checkrePass()"/>
					<span id="repass">两次密码要输入一致</span>
				</div>
				
				<div class="user">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;
					<input class="email" type="text" name="user_email" onblur="sendE_mail()"/>
					<span id="sendEmail"></span>
				</div>
				<div class="user">
					<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;
						<input class="code" type="text" name="checkcode" onblur="checkCode()"/>
						<img id="imgObj" alt="验证码" src="${pageContext.request.contextPath}/user_getCode.action">
						    <a href="#" onclick="changeImg()">换一张</a>
					    <span id="code"></span>
					</div>
					<div class="clear"></div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="submit" name="submit" value="立即注册" >
				</div>
	       </form>
	   </div>
       </div>		
	</div>
</body>
</HTML>