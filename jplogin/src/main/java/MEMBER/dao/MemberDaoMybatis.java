package MEMBER.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import MEMBER.domain.MemberVO;

@Repository
public class MemberDaoMybatis implements MemberDao{

	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void insertNormal(MemberVO memberVO) {		
		sqlSessionTemplate.insert("memberDao.insertNormal", memberVO);
	}

	@Override
	public void insertParcelOut(MemberVO memberVO) {		
		sqlSessionTemplate.insert("memberDao.insertParcelOut", memberVO);
	}
	
	public int idCheck(String id) {		
		int result = sqlSessionTemplate.selectOne("memberDao.idCheck",id); 
		return result;
	}
}
