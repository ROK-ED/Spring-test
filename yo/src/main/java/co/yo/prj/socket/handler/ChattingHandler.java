package co.yo.prj.socket.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class ChattingHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String member_nick = (String )session.getAttributes().get("member_nick");
		
		log.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		sessionMap.put(member_nick, session);
		
		// 모든 세션에 채팅 전달
		for (WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(member_nick + "님이 입장 했습니다."));
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String member_nick = (String )session.getAttributes().get("member_nick");
		
		log.info("#ChattingHandler, handleMessage");
		log.info(session.getId() + " : " + message);

		for (WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(member_nick + " : " + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String member_nick = (String )session.getAttributes().get("member_nick");
		
		log.info("#ChattinHandler, afterConnectionClosed");
		sessionList.remove(session);
		for (WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(member_nick + "님이 퇴장 했습니다."));
		}
		//log.info(session.getPrincipal().getName() + "님이 퇴장");
	}
}
