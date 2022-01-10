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
				<form id="chatForm">
					<div class="chat_start_main">상담 CHAT</div>
					<div class="chat_main" style="display: none;">
						<div class="modal-header" style="height: 20%;">상담 CHAT</div>
						<div class="modal-content" id="chat" style="height: 60%;"></div>
						<div class="modal-footer">
							<input type="text" id="message" class="form-control"
								style="height: 20%;" placeholder="메세지를 입력하세요" />
						</div>
					</div>
					<button class="">send</button>
				</form>
				
				<!-- 수정 -->
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
				<!-- 수정 -->
			</div>
		</div>
	</div>
</div>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
	//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
	var socket = null;
	
	$(document).ready(function() {
		if (!isEmpty($("#member_email").val()))
			connectWS();
	});
	
	$(".chat_start_main").click(function() {
		$(this).css("display", "none");
		$(".chat_main").css("display", "inline");
	})
	
	$(".chat_main .modal-header").click(function() {
		$(".chat_start_main").css("display", "inline");
		$(".chat_main").css("display", "none");
	});

	function connectWS() {
		var sock = new SockJS("/echo");
		socket = sock;
		sock.onopen = function() {
			console.log('info: connection opened.');
		};
		sock.onmessage = function(e) {
			console.log(e);
			var strArray = e.data.split(":");
			if (e.data.indexof(":") > -1) {
				$(".chat_start_main").text(strArray[0] + "님이 메세지를 보냈습니다.");
			} else {
			}
			$("#chat").append(e.data + "<br/>");
		}
		sock.onclose = function() {
			$("#chat").append("연결 종료");
			setTimeout(function() {
				conntectWs();
			}, 10000);
		}
		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};

		$("#chatForm").submit(function(event) {
			event.preventDefault();
			sock.send($("#message").val());
			$("#message").val('').focus();
		});
	}
</script>