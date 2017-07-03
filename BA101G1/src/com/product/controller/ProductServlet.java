package com.product.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;



public class ProductServlet extends HttpServlet{
	


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String action = req.getParameter("action");

		if ("getproduct_a".equals(action) || "getproduct_b".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("pro_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�ӫ~����r");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					
					String url = null;
					
					if ("getproduct_a".equals(action))
						url = "/product/productClass.jsp";        // ���\���product/productClass.jsp
					else if ("getproduct_b".equals(action))
						url = "/product/product.jsp";              // ���\���product/product.jsp

					
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				ProductService proSvc = new ProductService();
				List<ProductVO> productlist = proSvc.getName(str);
				
				if (productlist.isEmpty()) {
					errorMsgs.add("�d�L���");
				}

				if (!errorMsgs.isEmpty()) {
					
					String url = null;
					
					if ("getproduct_a".equals(action))
						url = "/product/productClass.jsp";        // ���\���product/productClass.jsp
					else if ("getproduct_b".equals(action))
						url = "/product/product.jsp";              // ���\���product/product.jsp

					
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// �{�����_
				}

				/***************************
				 * 3.�d�ߧ���,�ǳ����(Send the Success view)
				 *************/
				req.setAttribute("productlist", productlist); // ��Ʈw���X��ProductVO����,�s�Jreq
				String url = "/product/product.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���product.jsp
				System.out.println(successView);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/product/product.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getProductClass".equals(action)) { // �Ӧ�select_page.jsp���ШD
			String str = req.getParameter("pc_id");
			ProductService proSvc = new ProductService();

			List<ProductVO> productlist = proSvc.getProductClass(str);
			req.setAttribute("productlist", productlist); // ��Ʈw���X��empVO����,�s�Jreq

			String url = "/product/product.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���select_page.jsp
			System.out.println(successView);
			successView.forward(req, res);

		}


		if ("getOne_In_ShoppingCart".equals(action)) { // �Ӧ�select_page.jsp���ШD
			
			String str = req.getParameter("store_id");
			StoreService storeSvc = new StoreService();
			StoreVO storeVO = storeSvc.getOneStore(str);
			ProductService productSvc = new ProductService();
			List<ProductVO> productlist = productSvc.getProductByStore(str);
			System.out.println("productlist="+productlist);
			req.setAttribute("productlist", productlist); // ��Ʈw���X��storeVO����,�s�Jreq
			req.setAttribute("storeVO", storeVO);
			
			
			
			ProductVO aproduct = getProduct(req);
			
			boolean match = false;
			//�s�W�Ĥ@�Ӱӫ~
			if(buylist==null){
				buylist = new Vector<ProductVO>();
				buylist.add(aproduct);
			}else{
				for(int i = 0 ; i < buylist.size();i++){
					ProductVO productVO = buylist.get(i);
					System.out.println(productVO);
					
					//�Y�s�W��@�˪��ӫ~
					if(productVO.getPro_name().equals(aproduct.getPro_name())){
						productVO.setQuantity(productVO.getQuantity()
								+aproduct.getQuantity());
						buylist.setElementAt(productVO, i);
						System.out.println(productVO.getQuantity());
						System.out.println(buylist);
						match = true;
					}
					
				}
				//�Y�s�W�줣�@�˪��ӫ~
				if(!match){
					buylist.addElement(aproduct);
				}
				
			}
			
			session.setAttribute("shoppingcart", buylist);
			String url ="/store/listProductByStore.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���store.jsp
			System.out.println(successView);
			System.out.println("123123123123");
			
			successView.forward(req, res);
		}
		
		if(action.equals("Checkout")){
			int total = 0;
			for(int i = 0; i< buylist.size();i++){
				ProductVO productVO = buylist.get(i);
				int price  = (int) productVO.getPro_price();
				int quantity = productVO.getQuantity();
				total += (price*quantity);
			}
			
			String amount = String.valueOf(total);
			req.setAttribute("amount", amount);
			String url = "/frontend/shoppingcart/Checkout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}
		
		if(action.equals("goto_ShoppingCart")){
			System.out.println("asdadasdadasa");
			session.setAttribute("shoppingcart", buylist);
			String url = "/frontend/shoppingcart/shoppingcart.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

	}

	private ProductVO getProduct(HttpServletRequest req) {

		String pro_id = req.getParameter("pro_id");
		String pro_name = req.getParameter("pro_name");
		String pro_price = req.getParameter("pro_price");
		String pro_content = req.getParameter("pro_content");
		String store_id = req.getParameter("store_id");
		String quantity = req.getParameter("quantity");

		ProductVO productVO = new ProductVO();

		productVO.setPro_id(pro_id);
		productVO.setPro_name(pro_name);
		productVO.setPro_price((new Integer(pro_price)).intValue());
		productVO.setPro_content(pro_content);
		productVO.setStore_id(store_id);
		productVO.setQuantity((new Integer(quantity)).intValue());
		return productVO;
	}

}
