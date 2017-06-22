package com.rev.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemberService;
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
				req.setAttribute("storeList", list);
				for (RevenueVO aaa : list) {
					System.out.println("STORE_ID : " + aaa.getStore_id());
				}
				String url = "/backend/rev/ListStoreRev.jsp";
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
				req.setAttribute("monthList", list);

				String url = "/backend/rev/ListMonthRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o��� : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String revenue_month = req.getParameter("revenue_month");
				String store_id = req.getParameter("store_id");

				if (revenue_month == null || revenue_month.trim().isEmpty()) {
					errorMsgs.add("�п�J���");
				}
				if (store_id == null || store_id.trim().isEmpty()) {
					errorMsgs.add("�п�J�Ӯa�s��");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}

				RevenueService revSvc = new RevenueService();
				List<RevenueVO> list = new LinkedList<RevenueVO>();
				list.add(revSvc.getOneRev(store_id, revenue_month));
				System.out.println("list.size() : " + list.size());
				if (revSvc.getOneRev(store_id, revenue_month) == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev.jsp");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("oneList", list);
				String url = "/backend/rev/ListAllRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o��� : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/Select_Rev");
				failureView.forward(req, res);
			}

		}
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String store_id = req.getParameter("store_id");
				String revenue_month = req.getParameter("revenue_month");

				RevenueService revSvc = new RevenueService();
				RevenueVO revenueVO = revSvc.getOneRev(store_id, revenue_month);

				req.setAttribute("revenueVO", revenueVO);
				String url = "/backend/rev/UpdateRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/ListAllRev.jsp");
				failureView.forward(req, res);
			}
		}
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			List<RevenueVO> list = new LinkedList<RevenueVO>();
			try {
				String store_id = req.getParameter("store_id");
				String revenue_month = req.getParameter("revenue_month");
				String man_id = req.getParameter("man_id");

				String str_store_revenue = req.getParameter("store_revenue");
				String str_store_state = req.getParameter("store_state");

				if (str_store_revenue == null || str_store_revenue.trim().isEmpty()) {
					errorMsgs.add("�п�J��~�B");
				} else {
					str_store_revenue = req.getParameter("store_revenue");
				}

				if (str_store_state == null || str_store_state.trim().isEmpty()) {
					errorMsgs.add("�п�J���A");
				} else {
					str_store_state = req.getParameter("store_state");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/UpdateRev.jsp");
					failureView.forward(req, res);
					return;
				}
				Integer store_revenue = null;
				try {
					store_revenue = new Integer(str_store_revenue);
				} catch (Exception e) {
					errorMsgs.add("�榡�����T");
				}
				Integer store_state = null;
				try {
					store_state = new Integer(str_store_state);
				} catch (Exception e) {
					errorMsgs.add("�榡�����T");
				}

				RevenueVO revenueVO = new RevenueVO();
				revenueVO.setStore_id(store_id);
				revenueVO.setMan_id(man_id);
				revenueVO.setRevenue_month(revenue_month);
				revenueVO.setStore_revenue(store_revenue);
				revenueVO.setState(store_state);
				list.add(revenueVO);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("revenueVO", revenueVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/UpdateRev.jsp");
					failureView.forward(req, res);
					return;
				}
				RevenueService revSvc = new RevenueService();
				revenueVO = revSvc.updateRev(store_id, revenue_month, man_id, store_revenue, store_state);

				req.setAttribute("list", list);
				String url = "/backend/rev/ListOneRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�ק異��" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/UpdateRev.jsp");
				failureView.forward(req, res);
			}
		}
		if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String store_id = req.getParameter("store_id");
				if (store_id == null || store_id.trim().isEmpty()) {
					errorMsgs.add("��J�Ӯa�s��");
				} else {
					store_id = req.getParameter("store_id");
				}
				String revenue_month = req.getParameter("revenue_month");
				if (revenue_month == null || revenue_month.trim().isEmpty()) {
					errorMsgs.add("�п�J���");
				} else {
					revenue_month = req.getParameter("revenue_month");
				}

				String man_id = req.getParameter("man_id");
				if (man_id == null || man_id.trim().isEmpty()) {
					errorMsgs.add("�п�J�޲z���s��");
				} else {
					man_id = req.getParameter("man_id");
				}
				String STR_store_revenue = req.getParameter("store_revenue");
				if (STR_store_revenue == null || STR_store_revenue.trim().isEmpty()) {
					errorMsgs.add("�п�J��~�B");
				} else {
					STR_store_revenue = req.getParameter("store_revenue");
				}

				String STR_state = req.getParameter("state");
				if (STR_state == null || STR_state.trim().isEmpty()) {
					errorMsgs.add("�п�J���A");
				} else {
					STR_state = req.getParameter("state");
				}
				Integer store_revenue = new Integer(STR_store_revenue);
				Integer state = new Integer(STR_state);
				RevenueVO revenueVO = new RevenueVO();
				revenueVO.setStore_id(store_id);
				revenueVO.setRevenue_month(revenue_month);
				revenueVO.setMan_id(man_id);
				revenueVO.setStore_revenue(store_revenue);
				revenueVO.setState(state);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("revenueVO", revenueVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/AddRev.jsp");
					failureView.forward(req, res);
					return;
				}
				RevenueService revSvc = new RevenueService();
				revenueVO = revSvc.addRev(store_id, revenue_month, man_id, store_revenue, state);
				String url = "/backend/rev/ListAllRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {

				System.out.println("123132");
				System.out.println(e.getMessage());
				errorMsgs.add("���зs�W");
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/AddRev.jsp");
				failureView.forward(req, res);
			}

		}
		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String store_id = new String(req.getParameter("store_id"));
				String revenue_month = req.getParameter("revenue_month");
				RevenueService revSvc = new RevenueService();
				revSvc.deleteRev(store_id, revenue_month);
				String url = "/backend/rev/ListAllRev.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/rev/ListAllRev.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
