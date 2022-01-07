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
				<form id="frm" action="boardInsert.do" method="get">
					<div class="form-group">
						<label for="board_title">Title</label> <input type="text"
							class="form-control" id="title" name="title" placeholder="Title">
					</div>
					<div class="form-group">
						<label for="board_content">Content</label>
						<textarea class="form-control" id="content" name="content" rows="15"
							placeholder="Content"></textarea>
					</div>
					<div class="form-row float-right">
						<input type="submit" class="btn btn-primary" value="submit">
					</div>
					<div class="form-row float-left">
						<input type="reset" class="btn btn-danger" value="reset">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<br>
<br>