package com.mem.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.man.model.ManagerService;
import com.mem.model.MemberService;
import com.mem.model.MemberVO;

public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("mem_id");
				if (str == null || str.trim().isEmpty()) {
					errorMsgs.add("�п�J�|���s��");
				}
				String mem_id = null;
				try {
					mem_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("�榡���~");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
					failureView.forward(req, res);
					return;
				}
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMem(mem_id);
				if (memberVO == null) {
					errorMsgs.add("�d�L���");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
					failureView.forward(req, res);
					return;
				}

				req.setAttribute("memberVO", memberVO);
				String url = "/backend/mem/ListOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/select_mem.jsp");
				failureView.forward(req, res);
			}

		}
		//�ק�
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String mem_id=new String(req.getParameter("mem_id"));
				MemberService memberSvc=new MemberService();
				MemberVO memberVO=memberSvc.getOneMem(mem_id);
				System.out.println("mem_id1:"+mem_id);
				req.setAttribute("memberVO", memberVO);
				
				String url="/backend/mem/Update_mem.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/man/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		if("update".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String mem_id=req.getParameter("mem_id");
				
				String mem_name=req.getParameter("mem_name");
				String mem_phone=req.getParameter("mem_phone");
				String mem_pw=req.getParameter("mem_pw");
				String mem_mail=req.getParameter("mem_mail");
				
				if (mem_name == null ||mem_name.trim().isEmpty()) {
					errorMsgs.add("�п�J�W�r");
				} else {
					mem_name = req.getParameter("mem_name");
				}
				if (mem_phone == null || mem_phone.trim().isEmpty()) {
					errorMsgs.add("�п�J�q��");
				} else {
					mem_phone = req.getParameter("mem_phone");
				}
				if (mem_pw == null || mem_pw.trim().isEmpty()) {
					errorMsgs.add("�п�J�K�X");
				} else {
					mem_pw = req.getParameter("mem_pw");
				}
				if (mem_mail == null || mem_mail.trim().isEmpty()) {
					errorMsgs.add("�п�J�H�c");
				} else {
					mem_mail = req.getParameter("mem_mail");
				}
				
				MemberVO memberVO=new MemberVO();
				memberVO.setMem_id(mem_id);
				memberVO.setMem_name(mem_name);
				memberVO.setMem_phone(mem_phone);
				memberVO.setMem_pw(mem_pw);
				memberVO.setMem_mail(mem_mail);
				
				if(!errorMsgs.isEmpty()){
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView=req.getRequestDispatcher("/backend/mem/Update_mem.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemberService memberSvc=new MemberService();
				System.out.println("mem_id00"+mem_id);
				memberVO=memberSvc.updateMem(mem_id, mem_name, mem_phone, mem_pw, mem_mail);
				
				req.setAttribute("memberVO", memberVO);
				String url="/backend/mem/ListAllMem.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("�ק異��:"+e.getMessage());
				RequestDispatcher failureView=req.getRequestDispatcher("/backend/mem/Update_mem.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("insert".equals(action)){
			List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL=req.getParameter("requestURL");
			System.out.println(requestURL);
			try{
				String mem_name=req.getParameter("mem_name");
				String mem_phone=req.getParameter("mem_phone");
				String mem_pw=req.getParameter("mem_pw");
				String mem_pw_again=req.getParameter("mem_pw_again");
				String mem_mail=req.getParameter("mem_mail");
				String tab=req.getParameter("tab");
				
				if(req.getParameter("mem_name")==null || req.getParameter("mem_name").trim().isEmpty()){
					errorMsgs.add("�п�J�W�r");
				}else{
					mem_name=req.getParameter("mem_name");
				}
				if(req.getParameter("mem_phone")==null || req.getParameter("mem_phone").trim().isEmpty()){
					errorMsgs.add("�п�J�q��");
				}else{
					mem_phone=req.getParameter("mem_phone");
				}
				
				if(req.getParameter("mem_pw")==null || req.getParameter("mem_pw").trim().isEmpty()){
					errorMsgs.add("�п�J�K�X");
				}else{
					mem_pw=req.getParameter("mem_pw");
				}
				if(req.getParameter("mem_pw_again")==null || req.getParameter("mem_pw_again").trim().isEmpty()){
					errorMsgs.add("�п�J�K�X");
				}else{
					mem_pw_again=req.getParameter("mem_pw_again");
				}
				if(req.getParameter("mem_mail")==null || req.getParameter("mem_mail").trim().isEmpty()){
					errorMsgs.add("�п�J�H�c");
				}else{
					mem_mail=req.getParameter("mem_mail");
				}
				if(!mem_pw.equals(mem_pw_again)){
					errorMsgs.add("�K�X���۲�");
				}
				MemberVO memberVO=new MemberVO();
				memberVO.setMem_name(mem_name);
				memberVO.setMem_phone(mem_phone);
				memberVO.setMem_pw(mem_pw);
				memberVO.setMem_mail(mem_mail);
				
				
				if(!errorMsgs.isEmpty()){
					HttpSession session=req.getSession();
					session.setAttribute("errorMsgs", errorMsgs);
//					String tab=URLEncoder.encode("#tab2","UTF-8");
//					System.out.println(tab);
//					String url = requestURL+ tab;
//					System.out.println(url);
//					String taburl=URLDecoder.decode(url,"UTF-8");
//					req.setAttribute("selectedTabInput", "#tab2");
//					RequestDispatcher failureView=req.getRequestDispatcher(requestURL);
//					failureView.forward(req, res);
					res.sendRedirect("/BA101G1"+requestURL + "#tab2");
					return;
				}
				
				MemberService memberSvc=new MemberService();
				memberVO=memberSvc.addMem(mem_name, mem_phone, mem_pw, mem_mail);
				
				String url="/backend/mem/ListAllMem.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e){
			//	String tab=URLEncoder.encode("#tab2","UT F-8");
				RequestDispatcher failureView=req.getRequestDispatcher(requestURL	);
				failureView.forward(req, res);
			}
		}
		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String mem_id = new String(req.getParameter("mem_id"));

				MemberService memSvc = new MemberService();
				memSvc.deleteMem(mem_id);
				String url = "/backend/mem/ListAllMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/mem/ListAllMem.jsp");
				failureView.forward(req, res);
			}
		}	
	}
}