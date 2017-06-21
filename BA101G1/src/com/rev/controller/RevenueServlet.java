package com.rev.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rev.model.RevenueService;
import com.rev.model.RevenueVO;

public class RevenueServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getStore_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String store_id = req.getParameter("store_id");
				if (store_id == null || store_id.trim().isEmpty()) {
					errorMsgs.add("�п�J���a�s��");
				}

				System.out.println("store_id1 : " + store_id);
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				RevenueService revSvc = new RevenueService();
				List<RevenueVO> list = new LinkedList<RevenueVO>();
				list = revSvc.getByStore(store_id);
				if (list == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("list", list);
				for (RevenueVO aaa : list) {
					System.out.println("STORE_ID : " + aaa.getStore_id());
				}
				String url = "/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o��� : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}
		}

		if ("getMonth_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String revenue_month = req.getParameter("revenue_month");
				if (revenue_month == null || revenue_month.trim().isEmpty()) {
					errorMsgs.add("�п�J���");
				}

				System.out.println("revenue_month : " + revenue_month);
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				RevenueService revSvc = new RevenueService();
				List<RevenueVO> list = new LinkedList<RevenueVO>();
				list = revSvc.getByMonth(revenue_month);
				if (list.size() == 0) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				req.setAttribute("list", list);

				String url = "/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o��� : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}
		}
		
		if("getOne_For_Display".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String revenue_month=req.getParameter("revenue_month");
				String store_id=req.getParameter("store_id");
				
				if(revenue_month==null||revenue_month.trim().isEmpty()){
					errorMsgs.add("�п�J���");
				}
				if(store_id==null||store_id.trim().isEmpty()){
					errorMsgs.add("�п�J�Ӯa�s��");
				}
				
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				
				RevenueService revSvc=new RevenueService();
				List<RevenueVO> list=new LinkedList<RevenueVO>();
				list.add(revSvc.getOneRev(store_id, revenue_month));
				
				if(list.size()==0){
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("list", list);
				String url = "/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o��� : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}
			
		}
		if("getOne_For_Update".equals(action)){
			List<String>errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String store_id=req.getParameter("store_id");
				String revenue_month=req.getParameter("revenue_month");
				
				RevenueService revSvc=new RevenueService();
				RevenueVO revenueVO=revSvc.getOneRev(store_id, revenue_month);
				
				req.setAttribute("revenueVO", revenueVO);
				String url="/backend/rev/UpdateRev.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/rev/ListAllRev.jsp");
				failureView.forward(req, res);
			}
		}
		if("update".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			List<RevenueVO> list=new LinkedList<RevenueVO>();
			try{
				String store_id=req.getParameter("store_id");
				String revenue_month=req.getParameter("revenue_month");
				String man_id=req.getParameter("man_id");
				
				String str_store_revenue=req.getParameter("store_revenue");
				String str_store_state=req.getParameter("store_state");
				
				if(str_store_revenue==null||str_store_revenue.trim().isEmpty()){
					errorMsgs.add("�п�J��~�B");
				}else{
					str_store_revenue=req.getParameter("store_revenue");
				}
				
				if(str_store_state==null||str_store_state.trim().isEmpty()){
					errorMsgs.add("�п�J���A");
				}else{
					str_store_state=req.getParameter("store_state");
				}

				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/UpdateRev.jsp");
					failureView.forward(req, res);
					return;
				}
				Integer store_revenue=null;
				try{
					store_revenue=new Integer(str_store_revenue);
				}catch(Exception e){
					errorMsgs.add("�榡�����T");
				}
				Integer store_state=null;
				try{
					store_state=new Integer(str_store_state);
				}catch(Exception e){
					errorMsgs.add("�榡�����T");
				}
			
				RevenueVO revenueVO=new RevenueVO();
				revenueVO.setStore_id(store_id);
				revenueVO.setMan_id(man_id);
				revenueVO.setRevenue_month(revenue_month);
				revenueVO.setStore_revenue(store_revenue);
				revenueVO.setState(store_state);
				list.add(revenueVO);
				
				if(!errorMsgs.isEmpty()){
					req.setAttribute("revenueVO", revenueVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/UpdateRev.jsp");
					failureView.forward(req, res);
					return;
				}
				RevenueService revSvc=new RevenueService();
				revenueVO=revSvc.updateRev(store_id, revenue_month, man_id, store_revenue, store_state);
				
				req.setAttribute("list", list);
				String url="/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("�ק異��"+e.getMessage());
				RequestDispatcher failureView=req.getRequestDispatcher("/backend/rev/UpdateRev.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
