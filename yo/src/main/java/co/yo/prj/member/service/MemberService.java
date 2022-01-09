package co.yo.prj.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberselect(MemberVO member); //로그인 or Select
	int memberInsert(MemberVO member);
	int memberUpdate(MemberVO member);
	int memberDelete(MemberVO member);
	MemberVO memebrUpdateSelect(MemberVO member); //수정용 셀렉트
	boolean isIdCheck(String member_email);
	List<MemberVO> memberSearch(String key, String data);
}
