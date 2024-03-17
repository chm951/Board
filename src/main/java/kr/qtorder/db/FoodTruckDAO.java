package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FesAddListVO;
import kr.qtorder.model.FoodTruckVO;

public class FoodTruckDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<FoodTruckVO> selectFoodTruck() {
		
		SqlSession session = factory.openSession(true);
		List<FoodTruckVO> f_list = session.selectList("selectFoodTruck");
		session.close();
		
		return f_list;
	}
	
	public List<FesAddListVO> selectAddList() {
		
		SqlSession session = factory.openSession(true);
		List<FesAddListVO> addList = session.selectList("selectAddList");
		session.close();
		
		return addList;
	}
		

}