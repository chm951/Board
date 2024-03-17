package kr.qtorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FoodTruckDAO;
import kr.qtorder.model.FoodTruckVO;

public class StoreSelectService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		FoodTruckDAO dao = new FoodTruckDAO();
		HttpSession session = request.getSession();
		
		List<FoodTruckVO> foodtruckList = new ArrayList<FoodTruckVO>();
		
		foodtruckList = dao.selectFoodTruck();
		session.setAttribute("selectFoodTruck", foodtruckList);
		
		return "Gostorelist.do";
	}
	
}
