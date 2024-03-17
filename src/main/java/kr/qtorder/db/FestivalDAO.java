package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FestivalVO;

public class FestivalDAO {
private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<FestivalVO> selectFestival() {
		
		SqlSession session = factory.openSession(true);
		List<FestivalVO> fes_list = session.selectList("selectFestival");
		session.close();
		
		return fes_list;
	}
}
