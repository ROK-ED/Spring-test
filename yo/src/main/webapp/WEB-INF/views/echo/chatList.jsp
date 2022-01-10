<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<div class="col-6">
						<label><b>채팅방</b></label>
					</div>

					<div>
						<div id="msgArea" class="col"></div>
						<div class="col-6">
							<div class="input-group mb-3">
								<input type="text" id="msg" class="form-control"
									aria-label="Recipient's username"
									aria-describedby="button-addon2">

								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="button-send">전송</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-6"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
	var sock = new SockJS("/replyEcho");

	sock.onopen = function(event) {
		console.log('Info: connection opened.');
		setTimeout(function() {
			connect();
		}, 1000);
	}

	sock.onmessage = function(event) {
		console.log(event.data + '\n');
	}

	sock.onclose = function(event) {
		console.log('Info: connection closed.');
	};
	sock.onclose = function(err) {
		console.log('Error:', err);
	};

	$('#button-send').on('click', function(evt) {
		evt.preventDafault();
		if (socket.readyState !== 1)
			return;
		let msg = $('msgArea').val();
		ws.send(msg);
	});
</script>