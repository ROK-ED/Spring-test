<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/board_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">board</div>
	</div>
</div>
<table id="table" class="table table-bordered">
	<thead>
		<tr>
			<th>Title</th>
			<th>Content</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${boardList}" var="board">
			<tr>
				<td>${board.board_title }</td>
				<td>${board.board_content }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


