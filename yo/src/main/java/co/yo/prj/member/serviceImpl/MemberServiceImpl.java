package co.yo.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yo.prj.member.service.MemberMapper;
import co.yo.prj.member.service.MemberService;
import co.yo.prj.member.service.MemberVO;

@Repository("memberDao")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper map;
	
	@Override
	public List<MemberVO> memberSelectList() {
		return map.memberSelectList();
	}

	@Override
	public MemberVO memberselect(MemberVO member) {
		return map.memberselect(member);
	}

	@Override
	public int memberInsert(MemberVO member) {
		return map.memberInsert(member);
	}

	@Override
	public int memberUpdate(MemberVO member) {
		return map.memberUpdate(member);
	}

	@Override
	public int memberDelete(MemberVO member) {
		return map.memberDelete(member);
	}

	@Override
	public boolean isIdCheck(String member_email) {
		return map.isIdCheck(member_email);
	}

	@Override
	public List<MemberVO> memberSearch(String key, String data) {
		return map.memberSearch(key, data);
	}

	@Override
	public MemberVO memebrUpdateSelect(MemberVO member) {
		return map.memebrUpdateSelect(member);
	}

}
