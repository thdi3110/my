package MEMBER.dao;

import MEMBER.domain.MemberVO;

public interface MemberDao {
	
	 public abstract void insertNormal(MemberVO memberVO);
	 
	 public abstract void insertParcelOut(MemberVO memberVO);
	 
	 public abstract int idCheck(String id);
}
