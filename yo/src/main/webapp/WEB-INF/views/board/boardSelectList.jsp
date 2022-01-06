<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/single_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">the offers</div>
		</div>
	</div>
	<div align="center">
		<table border="1">
			<c:forEach items="${boardList}" var="board">
				<tr>
					<td>${board.board_title }</td>
					<td>&nbsp;</td>
					<td>${board.board_content }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>