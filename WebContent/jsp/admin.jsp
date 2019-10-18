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
<title>管理员界面</title>
</head>
<script language=javascript>
	// 提交分页的查询的表单
	function to_page(page){
		if(page){
			$("#page").val(page);
		}
		document.getElementById('msg').submit();
	}
</script>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
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
	               <li id="before1"><a href="${pageContext.request.contextPath }/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
	               <li id="before2"><a href="${pageContext.request.contextPath }/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	               <li><a href="${pageContext.request.contextPath }/admin_information.action"><span class="glyphicon glyphicon-asterisk" ></span></a></li>
	        </ul> 
	    </div>
		</div>
	</nav>

    <div class="container">
		<div class="col-sm-12">
			<div class="row">
               <div class="col-xs-2">
			        <ul class="nav nav-pills nav-stacked">
			        <li class="active"><a href="#">管理员中心</a></li>
			        <li><a href="${pageContext.request.contextPath }/goods_findByPage.action">商品列表</a></li>
			        <li><a href="${pageContext.request.contextPath }/user_findByPage.action">用户列表</a></li>
			        <li><a href="${pageContext.request.contextPath }/payment_findByPage.action">交易记录</a></li>
			        </ul>
    		   </div>
   			   <div class="col-sm-10">
   			  
   			       <c:if test="${msg eq 'goods' }"><jsp:include page="./goods/list.jsp" flush="true"/></c:if>
   			       <c:if test="${msg eq 'user' }"><jsp:include page="./user/list.jsp" flush="true"/></c:if>
   			       <c:if test="${msg eq 'payment' }"><jsp:include page="./payment/paymentList.jsp" flush="true"/></c:if>
   			       <c:if test="${not empty msg }">
	   			   <div class="col-sm-4 col-md-3"style="width:100%;text-align:right"></div>
				   <FORM id="msg" action="${pageContext.request.contextPath }/${msg }_findByPage.action" method=post>
						<table cellSpacing=0 cellPadding=0 width="98%" border=0>
						  <TR>
							<TD>
								<SPAN id=pagelink>
									<div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
										共[<B>${page.totalCount}</B>]条记录，共[<B>${page.totalPage}</B>]页
										,
										<c:if test="${ page.pageCode > 1 }">
											[<A onclick="to_page(${page.pageCode-1})">前一页</A>]
										</c:if>
										
										<B>第${page.pageCode}页</B>
										
										<c:if test="${ page.pageCode < page.totalPage }">
											[<A type="button" onclick="to_page(${page.pageCode+1})">后一页</A>] 
										</c:if>
										
										到
										<input type="text" size="1" id="page" name="pageCode" />
										页
										<input type="submit" value="Go" onclick="to_page()"/>
									</div>
								</SPAN>
							</TD>
						</TR>
						</table>
					</FORM>	
					</div>
					</c:if>
   			   </div>
   			</div>   
    	</div>
    </div>
    
</body>
</html>