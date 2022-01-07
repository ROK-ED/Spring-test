<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.js"></script>

<script>
	jQuery(function($) {
		$("#myTable").DataTable();
	});
</script>

<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/board_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">board</div>
	</div>
</div>

<div class="contact_form_section">
	<div class="container">
		<div class="row">
			<div class="col">
				<table id="myTable" class="table table-bordered">
					<thead>
						<tr>
							<th>No</th>
							<th>Title</th>
							<th>Date</th>
							<th>Writer</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="board">
							<tr>
								<td>${board.board_id }</td>
								<td><a href="boardDetail.do?board_id=${board.board_id }">${board.board_title }</a></td>
								<td><fmt:formatDate value="${board.board_date_re }" pattern="yyyy-MM-dd"/></td>
								<td>${board.member_email }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-info btn-block"
					onClick="location.href='boardInsertForm.do'">Register</button>
				<%-- 
				<c:if test="${member_email ne null }">
					<button type="button" class="btn btn-info btn-block" onClick="location.href='boardInsertForm.do'" >Register</button>
				</c:if> --%>
			</div>
		</div>
	</div>
</div>
<br>
<br>
