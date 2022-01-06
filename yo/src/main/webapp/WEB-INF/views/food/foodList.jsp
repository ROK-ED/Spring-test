<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/contact_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">foodList</div>
		</div>
	</div>


	<c:forEach items="${foodSelectList}" var="food">
		
	<div class="foodListContainer" id="foodListContainer">
		<div > 음식점 사진</div>
		<div class="intro_title">${food.food_name}</div>
		<div class="foodListBody">
			<p class="intro_text">${food.food_menu}</p></div>
		<div class="foodListFooter"></div>
	</div>


	</c:forEach>

</body>
</html>