package com.store.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.model.StoreService;
import com.store.model.StoreVO;


public class StoreServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("get_store".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("store_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�Ӯa����r");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				StoreService storeSvc = new StoreService();
				List<StoreVO> storelist = storeSvc.getName(str);
				if (storelist == null) {
					errorMsgs.add("�d�L���");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/store.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("storelist", storelist); // ��Ʈw���X��empVO����,�s�Jreq
				String url ="/store.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���select_page.jsp
				System.out.println(successView);
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/store.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("get_zone".equals(action)) { // �Ӧ�store.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String str = req.getParameter("store_zone");
			StoreService storeSvc = new StoreService();
			
			List<StoreVO> storelist = storeSvc.getZone(str);
			
			req.setAttribute("storelist", storelist); // ��Ʈw���X��storeVO����,�s�Jreq
			
			String url ="/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
			System.out.println(successView);
			successView.forward(req, res);
		} 
	}
}
