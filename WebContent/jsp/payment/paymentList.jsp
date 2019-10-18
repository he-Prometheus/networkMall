<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css"/>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<title>支付记录</title>
</head>
<script type="text/javascript">
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
 <table class="table table-bordered">
	<caption>上传的商品</caption>
	<thead>
	 	<tr>
	 	    <th width="5%"><input type="checkbox" id="selectAll" ></th>
			<th width="20%">买方</th>
			<th width="10%">卖方</th>
			<th width="35%">商品</th>
			<th width="10%">价格</th>
			<th width="10%">时间</th>
			<th width="10%">编辑</th>
		</tr>
		
	</thead>
	<tbody>
	
	<c:forEach items="${page.beanList}" var="payment">
		<tr>
		    <td><input type="checkbox" class="itemSelect"></td>
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
			<td>${payment.pay_price }</td>
			<td>${payment.pay_records_time }</td>
			<th width="10%">
			    <a href="javascript:void(0);" onclick="deletePayment(${payment.pay_id})">删除</a>
			</th>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>