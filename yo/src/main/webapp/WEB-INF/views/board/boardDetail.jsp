<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Title</th>
							<th scope="col">Content</th>
							<th scope="col">Writer</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>${board.board_title }</td>
							<td>${board.board_content }</td>
							<td>${board.member_email }</td>
						</tr>
					</tbody>
				</table>
				<c:if test="${sessionScope.member_email == board.member_email}">
					<div class="form-row float-right">
						<button type="button" class="btn btn-primary"
							onClick="location.href='boardInsertForm.do?board_id=${board.board_id}'">Modify</button>
					</div>
					<div class="form-row float-left">
						<button type="button" class="btn btn-primary"
							onClick="location.href='board.do?cmd=delete&board_id=${board.board_id }'">Delete</button>
					</div>
				</c:if>
				<button type="button" class="btn btn-info btn-block"
					onClick="location.href='boardSelectList.do'">Board List</button>
			</div>
		</div>
	</div>
</div>
<br>
<br>


