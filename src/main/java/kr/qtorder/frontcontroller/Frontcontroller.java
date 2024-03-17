package kr.qtorder.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.controller.Command;
import kr.qtorder.controller.FesAddListDeleteService;
import kr.qtorder.controller.FesAddListService;
import kr.qtorder.controller.FesAdminidCheckService;
import kr.qtorder.controller.FesLoginService;
import kr.qtorder.controller.FesMemberJoinService;
import kr.qtorder.controller.FestivalInfoService;
import kr.qtorder.controller.Foodtruck_joinService;
import kr.qtorder.controller.Foodtruck_loginService;
import kr.qtorder.controller.GetTest;
import kr.qtorder.controller.NoticeCreateService;
import kr.qtorder.controller.NoticeDeleteService;
import kr.qtorder.controller.NoticeEditService;
import kr.qtorder.controller.NoticeListSelectService;
import kr.qtorder.controller.StoreSelectService;


@WebServlet("*.do")
public class Frontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<>();
    
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		map.put("test.do", new GetTest());
		map.put("storelist.do", new StoreSelectService());
		map.put("fesAdminPage.do", new FestivalInfoService());
		map.put("fesAdminJoin.do", new FesMemberJoinService());
		map.put("IdCheck.do", new FesAdminidCheckService());
		map.put("fesAdminLogin.do", new FesLoginService());
		map.put("noticeList.do", new NoticeListSelectService());
		map.put("noticeCreate.do", new NoticeCreateService());
		map.put("noticeEdit.do", new NoticeEditService());
		map.put("noticeDelete.do", new NoticeDeleteService());
		map.put("addList.do", new FesAddListService());
		map.put("deleteList.do", new FesAddListDeleteService());
		map.put("fd_join.do", new Foodtruck_joinService());
		map.put("fd_login.do", new Foodtruck_loginService());
		
	}
	
    @Override
    	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	String uri = req.getRequestURI();
			String cp = req.getContextPath();
			String path = uri.substring(cp.length() + 1);
			
			req.setCharacterEncoding("utf-8");
	
			String finalpath = null;
			Command com = null;
			
			// 3. path값이 어떤 요청이냐에 따라서 다른 기능 수행
			if (path.contains("Go")) {
				// Go + 파일이름 + .do
				finalpath = path.replaceAll("Go", "").replaceAll(".do", ".jsp");
			} else {
	
				com = map.get(path);
				
				//요청에 맞는 service를 실행시키겠습니다 
				finalpath = com.execute(req, resp);
			}
			
			if (finalpath != null) {
				resp.sendRedirect(finalpath.replaceAll("redirect:/", ""));
			} else {
				RequestDispatcher rd = req.getRequestDispatcher(finalpath);
				rd.forward(req, resp);
			}
    	}

}
