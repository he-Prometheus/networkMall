<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/frameset.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
        <meta content="MSHTML 6.00.2900.3492" name=GENERATOR>
	    <link rel="stylesheet" href="css/bootstrap.min.css"/>
       	<script src="js/jquery.min.js"></script>
       	<script src="js/bootstrap.min.js"></script>
		<title>商城首页</title>
	</head>
	<script language=javascript>
	// 提交分页的查询的表单
	function to_page(page){
		if(page){
			$("#page").val(page);
		}
		document.getElementById('goods').submit();
	}
    </script>
	<body >
		<jsp:include page="top.jsp" flush="true"/>

    <div class="container">    
	    <div class="row" >
	     <c:forEach items="${page.beanList}" var="goods">
		    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3" >
		        <div class="thumbnail thumbnail-border" style="width:240px;height:360px;text-align:center">
		        	<div style="width:200px;height:150px">
		        	<c:forEach items="${goods.imgs}" begin="0" end="0" var="img">
		        	 <img src="./img/${img.img_url}"
		                 alt="通用的占位符缩略图"  width="150px" height="180px">
		             </c:forEach>      
		            </div>
		            <br>
		            <div class="caption">
		                <h3>${goods.goods_name }</h3>
		                <p>${goods.goods_price }元</p>
		                <p>
		                    <a href="${pageContext.request.contextPath }/goods_Details?goods_id=${goods.goods_id}" class="btn btn-primary" role="button">
		                        详情
		                    </a>
		                </p>
		            </div>
		        </div>
		    </div>
		  </c:forEach>   
	    </div>
    </div>  
    
     <FORM id="goods" action="${pageContext.request.contextPath }/showGoods_findByPage.action" method=post>
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
    
    </body>
</html>
