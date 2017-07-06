package com.man.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.man.model.ManagerService;
import com.man.model.ManagerVO;

public class ManServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// 查詢
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出單一管理員");    // 資料庫取出的set物件,存入request
			try {
				String str = req.getParameter("man_id");
				if (str == null || (str.trim().length() == 0)) {
					errorMsgs.add("請輸入員工編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				String man_id = null;
				try {
					man_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("輸入格式錯誤");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				ManagerVO managerVO = manSvc.getOneMan(man_id);
				if (managerVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
				failureView.forward(req, res);
			}

		}
		// 修改
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "修改單一管理員");    // 資料庫取出的set物件,存入request
			try {
				String man_id = new String(req.getParameter("man_id"));
				ManagerService managerSvc = new ManagerService();
				ManagerVO managerVO = managerSvc.getOneMan(man_id);
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/listAllMan.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有管理員");    // 資料庫取出的set物件,存入request
			try {
				String man_id = new String(req.getParameter("man_id"));

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_pw = req.getParameter("man_pw");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					man_name = req.getParameter("man_name");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					man_phone = req.getParameter("man_phone");
				}
				if (req.getParameter("man_pw") == null || req.getParameter("man_pw").trim().isEmpty()) {
					errorMsgs.add("請輸入密碼");
				} else {
					man_pw = req.getParameter("man_pw");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					man_mail = req.getParameter("man_mail");
				}

				ManagerVO managerVO = new ManagerVO();
				managerVO.setMan_id(man_id);
				managerVO.setMan_name(man_name);
				managerVO.setMan_phone(man_phone);
				managerVO.setMan_pw(man_pw);
				managerVO.setMan_mail(man_mail);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("managerVO", managerVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/UpdateMan.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				managerVO = manSvc.updateMan(man_id, man_name, man_phone, man_pw, man_mail);

				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/UpdateMan.jsp");
				failureView.forward(req, res);
			}
		}
		// 新增

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "新增單一管理員");    // 資料庫取出的set物件,存入request
			try {
				// String man_name="";
				// try{
				// man_name=req.getParameter("man_name").trim();
				// }catch(Exception e){
				// man_name="";
				// errorMsgs.add("請輸入名字");
				// }
				// String man_phone="";
				// try{
				// man_phone=new String(req.getParameter("man_phone").trim());
				// }catch (Exception e) {
				// man_phone="";
				// errorMsgs.add("請輸入電話");
				// }
				// String man_pw=null;
				// try{
				// man_pw=new String(req.getParameter("man_pw").trim());
				// }catch (Exception e) {
				// man_pw="";
				// errorMsgs.add("請輸入密碼");
				// }
				//
				// String man_mail=null;
				// try{
				// man_mail=new String(req.getParameter("man_mail").trim());
				// }catch (Exception e) {
				// man_mail="";
				// errorMsgs.add("請輸入信箱");
				// }

				String man_name = req.getParameter("man_name");
				String man_phone = req.getParameter("man_phone");
				String man_mail = req.getParameter("man_mail");

				if (req.getParameter("man_name") == null || req.getParameter("man_name").trim().isEmpty()) {
					errorMsgs.add("請輸入名字");
				} else {
					man_name = req.getParameter("man_name");
				}
				if (req.getParameter("man_phone") == null || req.getParameter("man_phone").trim().isEmpty()) {
					errorMsgs.add("請輸入電話");
				} else {
					man_phone = req.getParameter("man_phone");
				}
				if (req.getParameter("man_mail") == null || req.getParameter("man_mail").trim().isEmpty()) {
					errorMsgs.add("請輸入信箱");
				} else {
					man_mail = req.getParameter("man_mail");
				}
				int ran=(int)(Math.random()*1000000);
				
				String man_pw=String.valueOf(ran);
				ManagerVO managerVO = new ManagerVO();
				managerVO.setMan_name(man_name);
				managerVO.setMan_phone(man_phone);
				managerVO.setMan_pw(man_pw);
				managerVO.setMan_mail(man_mail);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("managerVO", managerVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				ManagerService manSvc = new ManagerService();
				managerVO = manSvc.addMan(man_name, man_phone, man_pw, man_mail);
				req.setAttribute("managerVO", managerVO);
				
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				// errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
				failureView.forward(req, res);
			}

		}
		// 刪除

		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有管理員");    // 資料庫取出的set物件,存入request
			try {
				String man_id = new String(req.getParameter("man_id"));

				ManagerService manSvc = new ManagerService();
				manSvc.deleteMan(man_id);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/ListAllMan.jsp");
				failureView.forward(req, res);
			}
		}
		// 列出所有管理員include
		
		if ("listAll".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
			req.setAttribute("whichPage", "列出所有管理員");    // 資料庫取出的set物件,存入request
//			try {
//				String man_id = new String(req.getParameter("man_id"));
//				
//				ManagerService manSvc = new ManagerService();
//				manSvc.deleteMan(man_id);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
//				failureView.forward(req, res);
//			}
		}
		// login 登入檢查
		if ("loginCHK".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			errorMsgs.add("");
			/******************我新增的帳密條件判斷*********************/
			String account = req.getParameter("loginUser").trim();
			String password = req.getParameter("loginPwd").trim();
			HttpSession session = req.getSession();
			ManagerService manSvc = new ManagerService();
			
			session.setAttribute("errorMsgs", errorMsgs);
			session.setAttribute("location" , req.getRequestURI());
			try {
				if(account.isEmpty()){
					errorMsgs.add("員工編號不能為空");
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					return;
				}
				if(manSvc.getOneMan(account)==null){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("請輸入正確員工編號");
					return;
				}
				if(manSvc.getOneMan(account).getMan_id()==null){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("請輸入正確員工編號");
					return;
				}
				if(password.isEmpty()){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("密碼不能為空");
					return;
				}
				if(!manSvc.getOneMan(account).getMan_pw().equals(password)){
					res.sendRedirect(req.getContextPath()+"/backend/man/login_man.jsp");
					errorMsgs.add("請輸入正確密碼");
					return;
				}
				/******************我新增的帳密條件判斷*********************/
			String man_id = null;
			ManagerVO managerVO = manSvc.getOneMan(man_id);
			
				/*String str = req.getParameter("man_id");
				if (str == null || (str.trim().length() == 0)) {
					errorMsgs.add("請輸入員工編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}
				

				try {
					man_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("輸入格式錯誤");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}

				if (managerVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
					failureView.forward(req, res);
					return;
				}*/
				errorMsgs.removeAll(errorMsgs);
				req.setAttribute("managerVO", managerVO);
				String url = "/backend/man/select_man.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/select_man.jsp");
				failureView.forward(req, res);
			}

		}
		
	}
}
