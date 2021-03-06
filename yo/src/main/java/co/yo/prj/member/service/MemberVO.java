package co.yo.prj.member.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String member_email; //*이메일(아이디) pk
	private String member_pwd; //*비밀번호
	private String member_name; //*이름
	private String member_nick; //*별명
	private Date member_date; //가입일 default sysdate
	private String member_tel; //연락처
	private String member_addr; //주소
	private String member_author; //권한 default USER
	private double member_x; //위도 default 0
	private double member_y; //경도 default 0
	
}
