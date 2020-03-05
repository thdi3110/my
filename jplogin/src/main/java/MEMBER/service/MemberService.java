package MEMBER.service;

import MEMBER.domain.MemberVO;

public interface MemberService {
	
	public abstract void writeNormal(MemberVO memberVO);
	
	public abstract void writeParcelOut(MemberVO memberVO);
	
	public abstract int idCheck(String id);
}
