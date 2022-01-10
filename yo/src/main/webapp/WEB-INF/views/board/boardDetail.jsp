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
				<div class="container">
					<div class="row align-items-start">
						<div class="col">Title</div>
						<div class="col">Content</div>
						<div class="col">Writer</div>
					</div>
					<div class="row align-items-start">
						<div class="col">${board.board_title }</div>
						<div class="col">${board.board_content }</div>
						<div class="col">${board.member_email }</div>
					</div>
					<div class="form-row float-right">
						<button type="button" class="btn btn-primary"
					onClick="location.href='board.do?cmd=update&board_id=${board.board_id }'">Modify</button>
					</div>
					<div class="form-row float-left">
						<button type="button" class="btn btn-primary"
					onClick="location.href='board.do?cmd=delete&board_id=${board.board_id }'">Delete</button>
					</div>
					<button type="button" class="btn btn-info btn-block"
						onClick="location.href='boardSelectList.do'">Board List</button>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<br>
