<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<script>
	$(document).ready(function() {
		$('#myTable').DataTable();
	});
</script>

<div class="super_container">
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/board_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">board</div>
		</div>
	</div>

	<div class="home">
		<div class="home_content">
			<table id="myTable" class="table table-bordered">
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Date</th>
						<th>Re_Date</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="board">
						<tr>
							<td>${board.board_id }</td>
							<td>${board.board_title }</td>
							<td>${board.board_date }</td>
							<td>${board.board_date_re }</td>
							<td>${board.member_email }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>





