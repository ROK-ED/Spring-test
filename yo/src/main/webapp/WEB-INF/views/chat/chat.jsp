<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script>
	var webSocket = {
		init : function(param) {
			this._url = param.url;
			this._initSocket();
		},
		sendChat : function() {
			this._sendMessage($('#message').val());
			$('#message').val('');
		},
		receiveMessage : function(str) {
			$('#divChatData').append('<div>' + str + '</div>');
		},
		closeMessage : function(str) {
			$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
		},
		disconnect : function() {
			this._socket.close();
		},
		_initSocket : function() {
			this._socket = new SockJS(this._url);
			this._socket.onmessage = function(evt) {
				webSocket.receiveMessage(evt.data);
			};
			this._socket.onclose = function(evt) {
				webSocket.closeMessage(evt.data);
			}
		},
		_sendMessage : function(str) {
			this._socket.send(str);
		}
	};
</script>

<script type="text/javascript">
	$(document).ready(function() {
		webSocket.init({
			url : '<c:url value="/chatting" />'
		});
	});
</script>

<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/chat_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">chatting</div>
	</div>
</div>

<div class="contact_form_section">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="container">

					<!-- chat room start -->
					<div class="col-6">
						<label><b>Chat</b></label>
					</div>
					<div class="card example-1 scrollbar-ripe-malinka">
						<div id="divChatData"></div>
					</div>
					
					<div>
						<div class="input-group mb-3">
							<input type="text" id="message" class="form-control"
								aria-label="Recipient's username"
								aria-describedby="button-addon2"
								onkeypress="if(event.keyCode==13){webSocket.sendChat();}">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="btnSend" onclick="webSocket.sendChat()">전송</button>
							</div>
						</div>
					</div>
					<!-- chat room end -->

				</div>
			</div>
		</div>
	</div>
</div>