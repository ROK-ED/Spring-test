<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.scrollbar-juicy-peach::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-juicy-peach::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-juicy-peach::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left top, right top, from(#ffecd2),
		to(#fcb69f));
	background-image: -webkit-linear-gradient(left, #ffecd2 0%, #fcb69f 100%);
	background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
}

.scrollbar-young-passion::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-young-passion::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-young-passion::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left top, right top, from(#ff8177),
		color-stop(0%, #ff867a), color-stop(21%, #ff8c7f),
		color-stop(52%, #f99185), color-stop(78%, #cf556c), to(#b12a5b));
	background-image: -webkit-linear-gradient(left, #ff8177 0%, #ff867a 0%, #ff8c7f 21%,
		#f99185 52%, #cf556c 78%, #b12a5b 100%);
	background-image: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185
		52%, #cf556c 78%, #b12a5b 100%);
}

.scrollbar-lady-lips::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-lady-lips::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-lady-lips::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#ff9a9e),
		color-stop(99%, #fecfef), to(#fecfef));
	background-image: -webkit-linear-gradient(bottom, #ff9a9e 0%, #fecfef 99%, #fecfef 100%);
	background-image: linear-gradient(to top, #ff9a9e 0%, #fecfef 99%, #fecfef 100%);
}

.scrollbar-lady-lips {
	scrollbar-color: #ff9a9e #F5F5F5;
}

.scrollbar-sunny-morning::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-sunny-morning::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-sunny-morning::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #f6d365 0%, #fda085 100%);
	background-image: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
}

.scrollbar-sunny-morning {
	scrollbar-color: #f6d365 #F5F5F5;
}

.scrollbar-rainy-ashville::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-rainy-ashville::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-rainy-ashville::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#fbc2eb),
		to(#a6c1ee));
	background-image: -webkit-linear-gradient(bottom, #fbc2eb 0%, #a6c1ee 100%);
	background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);
}

.scrollbar-frozen-dreams::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-frozen-dreams::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-frozen-dreams::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#fdcbf1),
		color-stop(1%, #fdcbf1), to(#e6dee9));
	background-image: -webkit-linear-gradient(bottom, #fdcbf1 0%, #fdcbf1 1%, #e6dee9 100%);
	background-image: linear-gradient(to top, #fdcbf1 0%, #fdcbf1 1%, #e6dee9 100%);
}

.scrollbar-warm-flame::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-warm-flame::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-warm-flame::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);
	background-image: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);
}

.scrollbar-night-fade::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-night-fade::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-night-fade::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#a18cd1),
		to(#fbc2eb));
	background-image: -webkit-linear-gradient(bottom, #a18cd1 0%, #fbc2eb 100%);
	background-image: linear-gradient(to top, #a18cd1 0%, #fbc2eb 100%);
}

.scrollbar-night-fade {
	scrollbar-color: #a18cd1 #F5F5F5;
}

.scrollbar-spring-warmth::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-spring-warmth::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-spring-warmth::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#fad0c4),
		to(#ffd1ff));
	background-image: -webkit-linear-gradient(bottom, #fad0c4 0%, #ffd1ff 100%);
	background-image: linear-gradient(to top, #fad0c4 0%, #ffd1ff 100%);
}

.scrollbar-winter-neva::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-winter-neva::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-winter-neva::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #a1c4fd 0%, #c2e9fb 100%);
	background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
}

.scrollbar-dusty-grass::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-dusty-grass::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-dusty-grass::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #d4fc79 0%, #96e6a1 100%);
	background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
}

.scrollbar-dusty-grass {
	scrollbar-color: #d4fc79 #F5F5F5;
}

.scrollbar-tempting-azure::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-tempting-azure::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-tempting-azure::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #84fab0 0%, #8fd3f4 100%);
	background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
}

.scrollbar-heavy-rain::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-heavy-rain::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-heavy-rain::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#cfd9df),
		to(#e2ebf0));
	background-image: -webkit-linear-gradient(bottom, #cfd9df 0%, #e2ebf0 100%);
	background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
}

.scrollbar-amy-crisp::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-amy-crisp::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-amy-crisp::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #a6c0fe 0%, #f68084 100%);
	background-image: linear-gradient(120deg, #a6c0fe 0%, #f68084 100%);
}

.scrollbar-mean-fruit::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-mean-fruit::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-mean-fruit::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #fccb90 0%, #d57eeb 100%);
	background-image: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%);
}

.scrollbar-mean-fruit {
	scrollbar-color: #fccb90 #F5F5F5;
}

.scrollbar-deep-blue::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-deep-blue::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-deep-blue::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #e0c3fc 0%, #8ec5fc 100%);
	background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
}

.scrollbar-deep-blue {
	scrollbar-color: #8ec5fc #F5F5F5;
}

.scrollbar-ripe-malinka::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-ripe-malinka::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-ripe-malinka::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #f093fb 0%, #f5576c 100%);
	background-image: linear-gradient(120deg, #f093fb 0%, #f5576c 100%);
}

.scrollbar-ripe-malinka {
	scrollbar-color: #f5576c #F5F5F5;
}

.scrollbar-cloudy-knoxville::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-cloudy-knoxville::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-cloudy-knoxville::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-linear-gradient(330deg, #fdfbfb 0%, #ebedee 100%);
	background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
}

.scrollbar-morpheus-den::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-morpheus-den::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-morpheus-den::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#30cfd0),
		to(#330867));
	background-image: -webkit-linear-gradient(bottom, #30cfd0 0%, #330867 100%);
	background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
}

.scrollbar-morpheus-den {
	scrollbar-color: #330867 #F5F5F5;
}

.scrollbar-rare-wind::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-rare-wind::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-rare-wind::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#a8edea),
		to(#fed6e3));
	background-image: -webkit-linear-gradient(bottom, #a8edea 0%, #fed6e3 100%);
	background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
}

.scrollbar-rare-wind {
	scrollbar-color: #a8edea #F5F5F5;
}

.scrollbar-near-moon::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.scrollbar-near-moon::-webkit-scrollbar {
	width: 12px;
	background-color: #F5F5F5;
}

.scrollbar-near-moon::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-image: -webkit-gradient(linear, left bottom, left top, from(#5ee7df),
		to(#b490ca));
	background-image: -webkit-linear-gradient(bottom, #5ee7df 0%, #b490ca 100%);
	background-image: linear-gradient(to top, #5ee7df 0%, #b490ca 100%);
}

.scrollbar-near-moon {
	scrollbar-color: #b490ca #F5F5F5;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
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
		data-image-src="resources/images/reservation_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">chatting</div>
	</div>
</div>

<div class="contact_form_section">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="container">
					<!-- 채팅방 -->
					<div class="col-6">
						<label><b>Chat</b></label>
					</div>
					<div class="card example-1 scrollbar-ripe-malinka">
						<div id="divChatData" class="card-body"></div>
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
				</div>
			</div>
		</div>
	</div>
</div>