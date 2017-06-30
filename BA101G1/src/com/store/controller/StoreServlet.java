package com.store.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;

public class StoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// �Ӧ�index.jsp���ШD �Ӧ�store.jsp���ШD
		if ("get_store".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				 **********************/
				String str = req.getParameter("store_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�Ӯa����r");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/store/store.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				StoreService storeSvc = new StoreService();
				List<StoreVO> storelist = storeSvc.getName(str);
				if (storelist.isEmpty()) {
					errorMsgs.add("�d�L���");
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/store/store.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 *************/
				req.setAttribute("storelist", storelist); // ��Ʈw���X��StoreVO����,�s�Jreq
				String url = "/store/store.jsp";

				/*
				 * if ("get_store_a".equals(action)) url =
				 * "/store/listSearchStore.jsp"; //
				 * ���\���/store/listSearchStore.jsp else if
				 * ("get_store_b".equals(action)) url = "/store.jsp"; // ���\���
				 * /store.jsp
				 */

				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
				System.out.println(successView);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/store/store.jsp");
				failureView.forward(req, res);
			}
		}

		if ("get_zone".equals(action)) { // �Ӧ�store.jsp���ШD

			String str = req.getParameter("store_zone");
			StoreService storeSvc = new StoreService();

			List<StoreVO> storelist = storeSvc.getZone(str);
			req.setAttribute("storelist", storelist); // ��Ʈw���X��storeVO����,�s�Jreq
			req.setAttribute("store_zone", str);
			
			String url = "/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
			System.out.println(successView);
			successView.forward(req, res);
		}

		if ("getStoreClass".equals(action)) { // �Ӧ�storeClass.jsp���ШD
			String str = req.getParameter("sc_id");
			StoreService storeSvc = new StoreService();

			List<StoreVO> storelist = storeSvc.getStoreClass(str);
			req.setAttribute("storelist", storelist); // ��Ʈw���X��storeVO����,�s�Jreq

			String url = "/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
			System.out.println(successView);
			successView.forward(req, res);
<<<<<<< HEAD
		} 
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp ���ШD
			  
			  			List<String> errorMsgs = new LinkedList<String>();
			  			// Store this set in the request scope, in case we need to
			  			// send the ErrorPage view.
			  			req.setAttribute("errorMsgs", errorMsgs);
			  			
			  			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j		
			  			
			  			try {
			  				/***************************1.�����ШD�Ѽ�****************************************/
			  				String store_id = new String(req.getParameter("store_id"));
			  				
			  				/***************************2.�}�l�d�߸��****************************************/
			  				StoreService storeSvc = new StoreService();
			  				StoreVO storeVO = storeSvc.getOneStore(store_id);
			  								
			  				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
			  				req.setAttribute("storeVO", storeVO); // ��Ʈw���X��empVO����,�s�Jreq
			  				System.out.println("storeVO=" +storeVO);
			  				String url = "/backend/store/update_store_input.jsp";
			  				RequestDispatcher successView = req.getRequestDispatcher(url);
			  				
			  				// ���\���update_emp_input.jsp
			  				
			  				successView.forward(req, res);
			  
			  				/***************************��L�i�઺���~�B�z************************************/
			  			} catch (Exception e) {
			  				errorMsgs.add("�ק��ƨ��X�ɥ���:"+ e.getMessage());
			  				RequestDispatcher failureView = req
			  						.getRequestDispatcher(requestURL);
			  				failureView.forward(req, res);
			  			}
			  		}
			  		
			  		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			  			
			  			List<String> errorMsgs = new LinkedList<String>();
			  			// Store this set in the request scope, in case we need to
			  			// send the ErrorPage view.
			  			req.setAttribute("errorMsgs", errorMsgs);
			  			
			  			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j �� �i /emp/listEmps_ByCompositeQuery.jsp�j
			  		
			  			try {
			  				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
			  				String store_id = new String(req.getParameter("store_id").trim());
			  				String store_name = req.getParameter("store_name").trim();
			  				String store_addr = req.getParameter("store_addr").trim();				
			  System.out.println(store_id);
			  System.out.println(store_name);
			  System.out.println(store_addr);
			  				String store_phone = null;
			  				try {
			  					store_phone = new String(req.getParameter("store_phone").trim());
			  				} catch (NumberFormatException e) {
			  					errorMsgs.add("�q�ܽж�Ʀr.");
			  				}
			  				
			  				System.out.println(store_phone);
			  				String store_state = req.getParameter("store_state");
			  				
			  				StoreVO storeVO = new StoreVO();
			  				storeVO.setStore_id(store_id);
			  				storeVO.setStore_name(store_name);
			  				storeVO.setStore_addr(store_addr);
			  				storeVO.setStore_phone(store_phone);
			  				storeVO.setStore_state(store_state);
			  				
			  				// Send the use back to the form, if there were errors
			  				if (!errorMsgs.isEmpty()) {
			  					req.setAttribute("storeVO", storeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
			  					RequestDispatcher failureView = req
			  							.getRequestDispatcher("/backend/store/update_store_input.jsp");
			  					failureView.forward(req, res);
			  					return; //�{�����_
			  				}
			  				
			  				/***************************2.�}�l�ק���*****************************************/
			  				StoreService storeSvc = new StoreService();
			  				storeVO = storeSvc.updateStore2(store_phone,store_addr,store_name,  store_state,store_id);
			  				System.out.println("XXXXXXXXXXXX");
			  				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/								
			  				
			                  
			  				String url ="/backend/store/ListAllStore.jsp";
			  				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
			  				successView.forward(req, res);
			  
			  				/***************************��L�i�઺���~�B�z*************************************/
			  			} catch (Exception e) {
			  				errorMsgs.add("�ק��ƥ���:"+ e.getMessage());
			  				RequestDispatcher failureView = req
			  						.getRequestDispatcher("/backend/store/update_store_input.jsp");
			  				failureView.forward(req, res);
			  			}
			  		}
		
=======
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp ��
													// /dept/listEmps_ByDeptno.jsp
													// ���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|:
																// �i�ର�i/emp/listAllEmp.jsp�j
																// ��
																// �i/dept/listEmps_ByDeptno.jsp�j
																// �� �i
																// /dept/listAllDept.jsp�j

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String store_id = new String(req.getParameter("store_id"));

				/*************************** 2.�}�l�d�߸�� ****************************************/
				StoreService storeSvc = new StoreService();
				StoreVO storeVO = storeSvc.getOneStore(store_id);

				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 ************/
				req.setAttribute("storeVO", storeVO); // ��Ʈw���X��empVO����,�s�Jreq
				System.out.println("storeVO=" + storeVO);
				String url = "/backend/store/update_store_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);

				// ���\���update_emp_input.jsp

				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƨ��X�ɥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");

			try {
				/***************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				 **********************/
				String store_id = new String(req.getParameter("store_id").trim());
				String store_name = req.getParameter("store_name").trim();
				String store_addr = req.getParameter("store_addr").trim();
				System.out.println(store_id);
				System.out.println(store_name);
				System.out.println(store_addr);
				String store_phone = null;
				try {
					store_phone = new String(req.getParameter("store_phone").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("�q�ܽж�Ʀr.");
				}

				System.out.println(store_phone);
				String store_state = req.getParameter("store_state");

				StoreVO storeVO = new StoreVO();
				storeVO.setStore_id(store_id);
				storeVO.setStore_name(store_name);
				storeVO.setStore_addr(store_addr);
				storeVO.setStore_phone(store_phone);
				storeVO.setStore_state(store_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("storeVO", storeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/store/update_store_input.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				StoreService storeSvc = new StoreService();
				storeVO = storeSvc.updateStore2(store_phone, store_addr, store_name, store_state, store_id);
				System.out.println("XXXXXXXXXXXX");
				/**************************** 3.�ק粒��,�ǳ����(Send the Success view)*************/

				String url = "/backend/store/ListAllStore.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/store/update_store_input.jsp");
				failureView.forward(req, res);
			}
		}

>>>>>>> branch '笨' of https://github.com/w837501/BA101G1.git
		if ("getProduct_By_Store".equals(action)) { // �Ӧ�storeClass.jsp���ШD
			String str = req.getParameter("store_id");
			
			StoreService storeSvc = new StoreService();
			ProductService productSvc = new ProductService();
			
			StoreVO storeVO = storeSvc.getOneStore(str);
			List<ProductVO> productlist = productSvc.getProductByStore(str);
			
			req.setAttribute("storeVO", storeVO);
			req.setAttribute("productlist", productlist); // ��Ʈw���X��storeVO����,�s�Jreq

			String url = "/store/listProductByStore.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
			System.out.println(successView);
			successView.forward(req, res);
		}
		
<<<<<<< HEAD
=======
		if ("getStoreHot".equals(action)) { // �Ӧ�storeClass.jsp���ШD
			String str = req.getParameter("store_star");
			int store_star = Integer.parseInt(str);
			StoreService storeSvc = new StoreService();
			
			List<StoreVO> storelist = storeSvc.getHot(store_star);
			req.setAttribute("storelist", storelist);
			
			String url = "/store/store.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
			System.out.println(successView);
			successView.forward(req, res);
		}
>>>>>>> branch '笨' of https://github.com/w837501/BA101G1.git
	}
}
