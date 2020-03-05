package MEMBER.service;

import org.springframework.stereotype.Service;

import MEMBER.dao.MemberDao;
import MEMBER.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao;
	
	public MemberDao getMemberDao() {
		return memberDao;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void writeNormal(MemberVO memberVO) {
		memberDao.insertNormal(memberVO);
	}
	
	public void writeParcelOut(MemberVO memberVO) {
		memberDao.insertParcelOut(memberVO);
	}
	
	public int idCheck(String id) {
		int result = memberDao.idCheck(id);
		return result;
	}
	
}
