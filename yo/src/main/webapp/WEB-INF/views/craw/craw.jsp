<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title {
	font-size: 20pt;
	height: 60px;
	margin-bottom: 10px;
}

table tr {
	text-align: center;
}

.big {
	width: 80%;
	margin: auto;
	align: center;
	margin-top: 20px;
	border-radius: 15px;
}

.seongbukNews1, .seongbukNews2 {
	width: 100%;
}

.seongbukNews1 tr, .seongbukNews2 tr {
	height: 50px;
}

div {
	text-align: center;
}

.seongbukNews1 tr, .seongbukNews1 td, .seongbukNews2 tr, .seongbukNews2 td
	{
	border-collapse: separate;
	border-spacing: 1px;
	border: 3px solid #ccc;
}
</style>
</head>


<body>
	<div>
		<div class="home">
			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/contact_background.jpg"></div>
			<div class="home_content">
				<div class="home_title">food........</div>
			</div>
		</div>

		<c:forEach var="img" items="${imgs }">
			<div>
				<img alt="" src="${img }">
			</div>
		</c:forEach>

	</div>
</body>

</html>