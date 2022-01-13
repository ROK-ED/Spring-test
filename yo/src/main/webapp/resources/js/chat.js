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