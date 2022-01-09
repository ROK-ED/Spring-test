package co.yo.prj;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor //파라미터가 없는 기본 생성자를 생성
public class Message {
	String message = ""; //alert 창 메세지
	String href = ""; //실행 후 이동경로
	
	public Message(String message, String href) {
		this.message = message;
		this.href = href;
	}

}
