package com.store.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ad.model.AdService;
import com.ad.model.AdVO;
import com.mem.model.MemberService;
import com.mem.model.MemberVO;
import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;
@MultipartConfig(fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024
* 1024)
public class StoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
System.out.println(action);
		// �Ӧ�index.jsp���ШD �Ӧ�store.jsp���ШD
		if ("get_store_a".equals(action) || "get_store_b".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/****************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				 **********************/
				String str = req.getParameter("store_name");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�Ӯa����r");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {

					String url = null;
					if ("get_store_a".equals(action))
						url = "/index.jsp";
					else if ("get_store_b".equals(action))
						url = "/store/store.jsp";

					RequestDispatcher failureView = req.getRequestDispatcher(url);
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

					String url = null;
					if ("get_store_a".equals(action))
						url = "/index.jsp";
					else if ("get_store_b".equals(action))
						url = "/store/store.jsp";

					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					return;// �{�����_
				}
				/****************************
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

		}
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String store_id=new String(req.getParameter("store_id"));
				StoreService storeSvc=new StoreService();
				StoreVO storeVO=storeSvc.getOneStore(store_id);
				System.out.println("store_id:"+store_id);
				req.setAttribute("storeVO", storeVO);
				System.out.println(storeVO);
				String url="/store/UpdateStore.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/store/ListAllStore.jsp");
				failureView.forward(req, res);
			}
		}
	

		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);


			try {
				/***************************
				 * 1.�����ШD�Ѽ� - ��J�榡�����~�B�z
				 **********************/
				String store_id = req.getParameter("store_id");
				String store_name = req.getParameter("store_name");
				Number sc_id =Integer.parseInt( req.getParameter("sc_id"));
				String store_content = req.getParameter("store_content");
				String store_phone = req.getParameter("store_phone");
				String store_addr = req.getParameter("store_addr");
				String store_acc = req.getParameter("store_acc");
				String store_pw = req.getParameter("store_pw");
				String store_out = req.getParameter("store_out");
				String store_zone = req.getParameter("store_zone");
				String store_state = req.getParameter("store_state");
				Part pic=req.getPart("store_image");
				byte[] store_image=getPictureByteArrayFromWeb(pic);
				
				if(store_name.trim().isEmpty()||store_name==null){
					errorMsgs.add("�п�J���W");
				}
				
				if(store_content.trim().isEmpty()||store_content==null){
					errorMsgs.add("�п�J�Ӯa²��");
				}
				if(store_phone.trim().isEmpty()||store_phone==null){
					errorMsgs.add("�п�J�Ӯa�q��");
				}
				if(store_addr.trim().isEmpty()||store_addr==null){
					errorMsgs.add("�п�J�Ӯa�a�}");
				}
				if(store_acc.trim().isEmpty()||store_acc==null){
					errorMsgs.add("�п�J�b��");
				}
				if(store_pw.trim().isEmpty()||store_pw==null){
					errorMsgs.add("�п�J�K�X");
				}
				if(store_out.trim().isEmpty()||store_out==null){
					errorMsgs.add("�п�J�O�_�i�H�~�e");
				}
				if(store_zone.trim().isEmpty()||store_zone==null){
					errorMsgs.add("�п�J�Ӯa�a��");
				}
				if(store_state.trim().isEmpty()||store_state==null){
					errorMsgs.add("�п�J�Ӯa���A");
				}
				StoreVO storeVO=new StoreVO();
				storeVO.setStore_name(store_name);
				storeVO.setSc_id(sc_id);
				storeVO.setStore_content(store_content);
				storeVO.setStore_phone(store_phone);
				storeVO.setStore_addr(store_addr);
				storeVO.setStore_acc(store_acc);
				storeVO.setStore_pw(store_pw);
				storeVO.setStore_out(store_out);
				storeVO.setStore_zone(store_zone);
				storeVO.setStore_image(store_image);
				storeVO.setStore_state(store_state);
				StoreVO storeVO1=new StoreVO();
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("storeVO", storeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/store/UpdateStore.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}
				StoreService storeSvc=new StoreService();
				storeVO1=storeSvc.getOneStore(store_id);
				byte[] defaultpic=storeVO1.getStore_image();
				if (getFileNameFromPart(pic) != null) 
					storeVO = storeSvc.updateStore2(store_name, sc_id, store_content, store_phone, store_addr, store_image, store_acc, store_pw, store_out, store_zone, store_state, store_id);
				else
					storeVO = storeSvc.updateStore2(store_name, sc_id, store_content, store_phone, store_addr, defaultpic, store_acc, store_pw, store_out, store_zone, store_state, store_id);
				System.out.println("XXXXXXXXXXXX");
				
				
				String url = "/store/ListAllStore.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/store/UpdateStore.jsp");
				failureView.forward(req, res);
			}
		}

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

		if ("insert".equals(action)) {
			System.out.println("111111");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL=req.getParameter("requestURL");
			try {
				String store_name = req.getParameter("store_name");
				Number sc_id =Integer.parseInt( req.getParameter("sc_id"));
				String store_content = req.getParameter("store_content");
				String store_phone = req.getParameter("store_phone");
				String store_addr = req.getParameter("store_addr");
				String store_acc = req.getParameter("store_acc");
				String store_pw = req.getParameter("store_pw");
				String store_out = req.getParameter("store_out");
				String store_zone = req.getParameter("store_zone");
				
			
				Part pic=req.getPart("store_image");
				byte[] store_image=getPictureByteArrayFromWeb(pic);
			
				if(pic==null){
					errorMsgs.add("�ФW�ǷӤ�");
				}
				if(store_name.trim().isEmpty()||store_name==null){
					errorMsgs.add("�п�J���W");
				}
				
				if(store_content.trim().isEmpty()||store_content==null){
					errorMsgs.add("�п�J�Ӯa²��");
				}
				if(store_phone.trim().isEmpty()||store_phone==null){
					errorMsgs.add("�п�J�Ӯa�q��");
				}
				if(store_addr.trim().isEmpty()||store_addr==null){
					errorMsgs.add("�п�J�Ӯa�a�}");
				}
				if(store_acc.trim().isEmpty()||store_acc==null){
					errorMsgs.add("�п�J�b��");
				}
				if(store_pw.trim().isEmpty()||store_pw==null){
					errorMsgs.add("�п�J�K�X");
				}
				if(store_out.trim().isEmpty()||store_out==null){
					errorMsgs.add("�п�J�O�_�i�H�~�e");
				}
				if(store_zone.trim().isEmpty()||store_zone==null){
					errorMsgs.add("�п�J�Ӯa�a��");
				}
				StoreVO storeVO=new StoreVO();
				storeVO.setStore_name(store_name);
				storeVO.setSc_id(sc_id);
				storeVO.setStore_content(store_content);
				storeVO.setStore_phone(store_phone);
				storeVO.setStore_addr(store_addr);
				storeVO.setStore_acc(store_acc);
				storeVO.setStore_pw(store_pw);
				storeVO.setStore_out(store_out);
				storeVO.setStore_zone(store_zone);
				storeVO.setStore_image(store_image);
				
				if(!errorMsgs.isEmpty()){
					req.setAttribute("storeVO", storeVO);
					RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
					failureView.forward(req, res);
					return;
				}
				
				StoreService storeSvc=new StoreService();
				storeSvc.addStore(sc_id, store_name, store_content, store_phone, store_addr, store_image, store_pw, store_acc, store_out, store_zone);
				
				String url="/store/ListAllStore.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
				return;
			}
		}
	}
		

	public static byte[] getPictureByteArrayFromWeb(Part part) throws IOException {
		InputStream is = part.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = is.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		is.close();
		return baos.toByteArray();
	}

	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // ���ե�
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // ���ե�
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
