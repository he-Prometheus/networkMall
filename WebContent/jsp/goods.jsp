<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<title>商品详情页</title>
</head>
<script type="text/javascript">
/* 加入购物车  */
function addOrder(id){
 	 $.ajax({
 		    url : "${pageContext.request.contextPath }/order_add.action",
 	        async : true,
 	        type : "POST",
 	        data : {
 	            "order_id" : id
 	        },
 	        success : function(data) {
 	        	alert(data);
 	            window.location.reload();
 	        },
 	        error : function() {
 	            alert("添加失败");
 	        },
 	        dataType : "text"
 	    });
 }
/*  添加评论 */
function toComment(id){
	var content = $("#com_content").val();
	 $.ajax({
		    url : "${pageContext.request.contextPath }/comment_add.action",
	        async : false,
	        type : "POST",
	        data : {
	            "com_id" : id,
	            "com_content":content
	        },
	        success : function(data) {
	        	alert(data);
	            window.location.reload();
	        },
	        error : function() {
	            alert("提交失败");
	            window.location.reload();
	        },
	        dataType : "text"
	    });
}

/* 删除评论 */
function delComment(id){
	 $.ajax({
		    url : "${pageContext.request.contextPath }/comment_delete.action",
	        async : false,
	        type : "POST",
	        data : {
	            "com_id" : id
	        },
	        success : function(data) {
	        	alert(data);
	            window.location.reload();
	        },
	        error : function() {
	            alert("提交失败");
	            window.location.reload();
	        },
	        dataType : "text"
	    });
}


//购买商品 
function buyGoods(){
	 $.ajax({
         type: "POST",
         dataType: "json",
         url:"${pageContext.request.contextPath }/payment_buyGoods.action",
         data: $('#pay').serialize(),
         success: function (data) {
        	 alert(data);
	         window.location.reload();
         },
         error : function() {
            alert("交易失败");
            window.location.reload();
         },
         dataType : "text"
     });
} 

</script>
<body>
    <jsp:include page="../top.jsp" flush="true"/>

	<div class="container">
	<div style="box-shadow: inset 0.5px -0.5px 0.5px #444, inset -0.5px 0.5px 0.5px #444;">	
    <fieldset>
        <legend>商品详情</legend>
    <div class="row">
        <div class="col-xs-4" style="background-color: #ffffff;height:300px;">
            <div id="myCarousel" class="carousel slide"  >
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" ></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>   
			<!-- 轮播（Carousel）项目 -->
			 
			<div class="carousel-inner">
			   <c:forEach items="${goodsDetails.imgs}" var="img" varStatus="status">
			    <c:if test="${status.count*1 == 1}">
			    	<div class="item active" style="width:200px;height:300px">
			    </c:if>
			    <c:if test="${status.count*1>1}">
			    	<div class="item" style="width:200px;height:300px">
			    </c:if>
					<img src="${pageContext.request.contextPath }/img/${img.img_url}" class="img-rounded" alt="${status.count} slide" width="300px" height="260px">
				</div>
				</c:forEach>
			</div>
			
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div> 
		
        </div>
        <div class="col-xs-6" style="background-color: #ffffff;height:300px;">
            <div class="row">
                <div class="col-xs-12" style="background-color: #ffffff; ">
                    <ul class="list-group">
                        <!-- 判断是不是用户上传 -->
                        <c:if test="${not empty goodsDetails.user}">
						<li class="list-group-item"> 
							<a href="#">
          					<span class="glyphicon glyphicon-user">商品主人：${goodsDetails.user.user_name}</span>
        					</a>
						</li>
						<li class="list-group-item">
							联系方式：${goodsDetails.user.user_email}
						</li>
						</c:if>
						
						<!-- 判断是不是管理员上传 -->
						<c:if test="${not empty goodsDetails.adm}">
						<li class="list-group-item"> 
							<a href="#">
          					<span class="glyphicon glyphicon-user">商品主人：${goodsDetails.adm.adm_name}</span>
        					</a>
						</li>
						<li class="list-group-item">
							联系方式：2967627664@qq.com
						</li>
						</c:if>
							
						<li class="list-group-item">
							商品名称：${goodsDetails.goods_name}
						</li>
						<li class="list-group-item">
							商品价格： ${goodsDetails.goods_price }元
						</li>
						<li class="list-group-item">
							商品上传时间： ${goodsDetails.goods_modified_time }元
						</li>
						<c:if test="${empty goodsDetails.belong}">
						    <li class="list-group-item">
								<button class="btn btn-default" onclick="addOrder(${goodsDetails.goods_id})">添加到购物车</button>
							</li>
							<li class="list-group-item">
								<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">购买</button>
							</li>
						</c:if>
						<c:if test="${not empty goodsDetails.belong }">
						    <li class="list-group-item">
								该商品已被购买
							</li>
						</c:if>
					</ul>
                </div>
            </div>
        </div>
    </div>
        <br><br>
        <div class="col-xs-10" style="box-shadow: inset 0.5px -0.5px 0.5px #33CCFF, inset -0.5px 0.5px 0.5px #33CCFF;">
        	<span class="glyphicon glyphicon-user">${goodsDetails.user.user_name}</span>:
        	<h5> ${goodsDetails.goods_desc }～</h5>
        </div>	
    </div>
    </fieldset>
    <br> <br>
    <br><br>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
			       <%--  <form id="pay" class="form-horizontal" role="form" action="${pageContext.request.contextPath }/payment_buyGoods.action" method="get"> --%>
			        <form id="pay" class="form-horizontal" role="form"  onsubmit="return fales">
					    <br> <br><br>
					  <!-- 隐藏商品主键 -->
					  <input type="hidden" name="pay_goods_id" value="${goodsDetails.goods_id }">
					  <input type="hidden" name="pay_sell_id" value="${goodsDetails.user.user_id }">
					  <input type="hidden" name="pay_buy_id" value="${existUser.user_id  }">
					  <div class="form-group">
					    <label for="firstname" class="col-xs-3 control-label">支付密码</label>
					    <div class="col-xs-6">
					      <input type="text" class="form-control" id="firstname" placeholder="支付密码就是登陆密码" name="password">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-xs-offset-5 col-xs-5">
					      <a type="button" class="btn btn-default" onclick="buyGoods()">提交</a>
					    </div>
					  </div>
					</form>
				</div>
			</div>
		</div>
    <div>
    <fieldset>
        <legend>商品评论</legend>
        <div class="col-xs-12" style="background-color: #ffffff;box-shadow: inset 0.5px -0.5px  #444, inset -0.5px 0.5px  #444;">
            <c:forEach items="${goodsDetails.goodsComments}" var="comment">
               <form role="form">
				<div class="form-group">
					<p style="float:right">
						<span class="glyphicon glyphicon-time">${comment.com_audit_time}</span>
						<a onclick="delComment(${comment.com_id })">
							<span class="glyphicon glyphicon-remove"></span> 
						</a>
					</p>
					<label for="name"><span class="glyphicon glyphicon-user">${comment.user.user_name}</span>:</label>
					<textarea class="form-control" rows="2" readonly="readonly">${comment.com_content}</textarea>
				</div>
			</form>
  			<hr>
        	</c:forEach>
   			<form role="form">
				<div class="form-group">
					<div>
					<label for="name"><span class="glyphicon glyphicon-user">${existUser.user_name }</span>:</label>
					<p style="float:right">
						<button class="btn btn-default" onclick="toComment(${goodsDetails.goods_id})">
						    <span class="glyphicon glyphicon-ok"></span>
					    </button>
				    </p>
					<input type="text" class="form-control" id="com_content" name="com_content">
				    </div>
					</div>
			</form>
        
        </div>	
    </fieldset>
    </div>
    <br><br><br>
    <div style="box-shadow: inset 0.5px -0.5px 0.5px #444, inset -0.5px 0.5px 0.5px #444;">
    <fieldset>
        <legend>同类商品</legend>
        <div class="container">    
	    <div class="row" >
			<c:forEach items="${listGoods}" var="goods" begin="0" end="3">
		    <div class="col-xs-6 col-sm-4 col-md-3 " >
		        <div class="thumbnail thumbnail-border" style="width:240px;height:360px">
		        	<div style="width:200px;height:150px">
		        	<c:forEach items="${goods.imgs}" begin="0" end="0" var="img">
		        	 <img src="./img/${img.img_url}"
		                 alt="通用的占位符缩略图"  width="150px" height="180px">
		             </c:forEach>      
		            </div>
		            <div class="caption">
		                <h3>${goods.goods_name }</h3>
		                <p>${goods.goods_price }元</p>
		                <p>
		                    <a href="${pageContext.request.contextPath }/goods_Details?id=${goods.goods_id}" class="btn btn-primary" role="button">
		                        详情
		                    </a>
		                </p>
		            </div>
		        </div>
		    </div>
		  </c:forEach>   
        </div>	
        </div>	
    </div>
    </fieldset>
    </div>
	</div>
</body>
</html>