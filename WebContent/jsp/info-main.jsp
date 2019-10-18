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
	<title>个人中心</title>
</head>
<script type="text/javascript">
    function deleteOrder(id){
    	 $.ajax({
    		    url : "${pageContext.request.contextPath }/order_delete.action",
    	        async : true,
    	        type : "POST",
    	        data : {
    	            "order_id" : id
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
    
    function findBybuy_ID(id){
    	 $.ajax({
 		    url : "${pageContext.request.contextPath }/payment_findByID.action",
 	        async : true,
 	        type : "POST",
 	        data : {
 	            "pay_buy_id" : id
 	        },
 	        success : function(data) {
 	            alert(data);
 	            // 删除成功后刷新页面
 	            window.location.reload();
 	        },
 	        error : function() {
 	            alert("查找失败");
 	        },
 	        dataType : "text"
 	    });
    }
    
    function deletePayment(id){
     	 $.ajax({
     		    url : "${pageContext.request.contextPath }/payment_delete.action",
     	        async : true,
     	        type : "POST",
     	        data : {
     	            "pay_id" : id
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
 	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
	         
	    </div>
	    <div>
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=0">商城首页</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=1">书籍文具</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=2">鞋服配饰</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=3">电器用品</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=4">运动音乐</a></li>
	            <li><a href="${pageContext.request.contextPath }/showGoods_findByPage.action?category=5">其他</a></li>
	        </ul>
	        <ul class="nav navbar-nav navbar-right">
	            <li id="after2"><a href="${pageContext.request.contextPath }/user_exit.action"><span class="glyphicon glyphicon-user" ></span> 退出登录</a></li>
	            <li><a href="${pageContext.request.contextPath }/admin_information.action"><span class="glyphicon glyphicon-asterisk" ></span></a></li>
	        </ul> 
	    </div>
		</div>
	</nav>
                                              
    <div class="container">
		<div class="col-xs-12">
			<div class="row">
   			 <div class="col-xs-12">
			   	 <div class="panel-group" id="accordion">
			 		 <div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
							   href="#collapseOne">
								个人资料
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							 <fieldset>
							 <ul class="list-group">
								<li class="list-group-item">用户名：<a href="#">${userInfo.user_name }</a></li>
								<li class="list-group-item"> 密码： <a href="#">${userInfo.user_password }</a></li>
								<li class="list-group-item">邮箱： <a href="#">${userInfo.user_email }</a></li>
								<li class="list-group-item"> 
								             余额：  <a href="#">${userInfo.user_money }元</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								  	<button class="btn" data-toggle="modal" data-target="#myModal">
	                                                                                                             添加余额
									</button>
								</li>
								<li class="list-group-item">注册时间： <a href="#">${userInfo.registerTime }</a></li>
								<li class="list-group-item"><a href="${pageContext.request.contextPath }/user_upUser?user_id=${userInfo.user_id}">修改用户名或密码</a></li>
							</ul>
				    		 
				    		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												&times;
											</button>
											<h4 class="modal-title" id="myModalLabel">
												客户添加余额
											</h4>
										</div>
										<div class="modal-body">
											<ul>
												<li><a href="#">1:发送红包到QQ2967627664</a></li>
												<li><a href="#">2：付款时请务必添加备注用户，系统没法记录用户名</a></li>
												<li><a href="#">3：若忘记备注，3日内发送截图和用户名到邮箱<strong>2967627664@qq.com</strong>增加金额</a></li>
												<li><a href="#">4：收到捐赠后，我会尽快根据您的备注为您加金额</a></li>
											</ul>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭
											</button>
										</div>
									</div>
								</div>
				    		 </div>
				    		 
				    		<table class="table table-bordered" border="1" cellspacing="0">
							<caption><button onclick="findBybuy_ID(${userInfo.user_id})">交易记录</button></caption>
							     <thead>
								 	<tr>
										<th width="20%">买方</th>
										<th width="10%">卖方</th>
										<th width="35%">商品</th>
										<th width="10%">价格</th>
										<th width="10%">时间</th>
										<th width="10%">编辑</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${paymentList}" var="payment">
									<tr>
										<td width="20%"><a href="${pageContext.request.contextPath }/user_manage?user_id=${payment.pay_buy_id}">
										    	${payment.pay_buy_name }
										    </a>
									    </td>
										<td><a href="${pageContext.request.contextPath }/user_manage?user_id=${payment.pay_sell_id}">
										    	${payment.pay_sell_name }
										    </a>
										</td>
										<td><a href="${pageContext.request.contextPath }/goods_Details?goods_id=${payment.pay_goods_id}">
										    	${payment.pay_goods_name }
										    </a>
										</td>
										<td>-${payment.pay_price }</td>
										<td>${payment.pay_records_time }</td>
										<th width="10%">
										    <a href="javascript:void(0);" onclick="deletePayment(${payment.pay_id})">删除</a>
										</th>
									</tr>
								</c:forEach>
								</tbody>
						 	</table>
				       		</fieldset> 
						</div>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
							   href="#collapseTwo">
								购物车
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">
							 <fieldset>
					   		<c:forEach items="${userInfo.orders}" var="order">
							    <div class="col-xs-2 col-sm-3 col-md-4 " >
							        <div class="thumbnail" style="width:200px;height:300px">
							       
							        	<div style="width:200px;height:150px">
							        	<c:forEach items="${order.orderGoods.imgs}" begin="0" end="0" var="img">
							        	   <img src="${pageContext.request.contextPath }/img/${img.img_url}"
							                   alt="通用的占位符缩略图"  width="150px" height="180px">
							               </c:forEach> 
							                  
							            </div>
							            <div class="caption">
							                <h3>${order.orderGoods.goods_name }</h3>
							                <p>${order.orderGoods.goods_price }元</p>
							                <p>
							                    <a href="${pageContext.request.contextPath }/goods_Details?goods_id=${order.orderGoods.goods_id}" class="btn btn-primary" role="button">
							                        详情
							                    </a>
							                    <a href="javascript:void(0);" onclick="deleteOrder(${order.order_id})" class="btn btn-primary" role="button">删除</a>
							                </p>
							            </div>
							        </div>
							   </div>
						  </c:forEach>   
						</fieldset> 
						</div>
					</div>
				</div>
			   	<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
							   href="#collapseThree">
								上传的商品
							</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse">
						<div class="panel-body">
							<fieldset>
			                <a href="${pageContext.request.contextPath }/jsp/goods/add.jsp">
								<span class="glyphicon glyphicon-plus">上传商品</span>
							</a>
			   			    <table class="table table-bordered">
			   			        <caption>上传的商品</caption>
								<thead>
								   <!--  <tr>
							        <td colspan="5"><a href="#" ftype="button" value="添加"/> 
							        <a href="#" type="button" value="删除"></td>
						            </tr> -->
									<tr>
									    <th width="5%"><input type="checkbox" id="selectAll" ></th>
										<th width="10%">商品名称</th>
										<th width="10%">商品价格</th>
										<th width="45%">商品商品描述</th>
										<th width="10%">商品上传时间</th>
										<th width="10%">编辑商品</th>
									</tr>
									
								</thead>
								<tbody>
								<c:forEach items="${userInfo.goodsSet }" var="goods">
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
							</fieldset>
						</div>
					</div>
				</div>		 
   			   </div>
   		   </div>
    	</div>
    </div>
    
</body>
</html>