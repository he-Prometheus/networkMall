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
<title>用户编辑页</title>
</head>
<script type="text/javascript">
function deleteUser(id){
  	 $.ajax({
  		    url : "${pageContext.request.contextPath }/user_delete.action",
  	        async : true,
  	        type : "POST",
  	        data : {
  	            "user_id" : id
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
	<caption>商品列表</caption>
	<thead>
	    <tr>
        </tr>   
		<tr>
		   <!--  <th width="5%"><input type="checkbox" id="selectAll" ></th> -->
			<th width="15%">用户名</th>
			<th width="10%">用户密码</th>
			<th width="25%">用户邮箱</th>
			<th width="10%">余额（￥）</th>
			<th width="15%">用户注册时间</th>
			<th width="25%">编辑</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${page.beanList}" var="user">
		<tr>
		    <!-- <td width="5%"><input type="checkbox" class="itemSelect"></td> -->
			<td width="15%">${user.user_name }</td>
			<td width="10%">${user.user_password }</td>
			<td width="25%">${user.user_email  }</td>
			<td width="10%">${user.user_money  }</td>
			<td width="15%">${user.registerTime  }</td>
			<th width="25%">
			    <a href="${pageContext.request.contextPath }/user_manage?user_id=${user.user_id}">详情</a>|
			    <a href="${pageContext.request.contextPath }/user_edit?user_id=${user.user_id}">修改</a>|
			    <a href="javascript:void(0);" onclick="deleteUser(${user.user_id})">删除</a>
			</th>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</body>
</html>