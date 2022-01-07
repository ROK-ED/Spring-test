package co.yo.prj.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberselect(MemberVO member); //로그인 or Select
	int memberInsert(MemberVO member);
	int memberUpdate(MemberVO member);
	int memberDelete(MemberVO member);
	
	boolean isIdCheck(String id);
	List<MemberVO> memberSearch(String key, String data);
}
