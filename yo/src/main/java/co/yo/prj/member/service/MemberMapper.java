package co.yo.prj.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	MemberVO memberselect(MemberVO member); //로그인 or Select
	int memberInsert(MemberVO member);
	int memberUpdate(MemberVO member);
	int memberDelete(MemberVO member);
	
	boolean isIdCheck(String id);
	//mapper에서 다름             //들어오는 값이 복수일때 @Param 써야됨
	List<MemberVO> memberSearch(@Param("key") String key, @Param("data") String data); // MemberService와 다른점... 매개변수가 두개 이상일경우...jsp form에서 날아온 데이터를 어노테이션으로 키, 데이터 호출

}
