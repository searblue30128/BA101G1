package com.store_class.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.store.model.StoreVO;

public class StoreClassDAO implements StoreClassDAO_interface {
	
	
	private static final String GET_ALL = "SELECT sc_id , sc_name from store_class order by sc_id";
	
	//0401�s�W   �z�L�Ӯa���O�s����X�Ҧ��Ӯa (��:�Ӯa���O�s��Integer������s��String����sc_id)
	private static final String GET_STORES_BYSC_ID = 
			"SELECT STORE_ID, SC_ID, STORE_NAME, STORE_CONTENT, STORE_PHONE, STORE_ADDR,to_char(STORE_DATE,'yyyy-mm-dd') STORE_DATE,STORE_STAR , STORE_COUNT, STORE_STATE,STORE_IMAGE,STORE_REPORT_COUNT,to_char(STORE_START_TIME,'yyyy-mm-dd hh:mm:ss') STORE_START_TIME,to_char(STORE_END_TIME,'yyyy-mm-dd hh:mm:ss') STORE_END_TIME,STORE_PW,STORE_ACC,STORE_OUT,STORE_ZONE from store where sc_id = ? order by store_id";

	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/servlet/BA101G1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<StoreClassVO> getAll() {
		
		List<StoreClassVO> list = new ArrayList<StoreClassVO>();
		StoreClassVO scVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scVO= new StoreClassVO();
				scVO.setSc_id(rs.getInt("Sc_id"));
				scVO.setSc_name(rs.getString("sc_name"));
				
				list.add(scVO); 
			}
		} catch (SQLException se) {
			throw new RuntimeException("�o�Ϳ��~" + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	//0401�s�W   �z�L�Ӯa���O�s����X�Ҧ��Ӯa (��:�Ӯa���O�s��Integer������s��String����sc_id)
	@Override
	public Set<StoreVO> getStoresBySc_id(Integer sc_id) {
		Set<StoreVO> set = new LinkedHashSet<StoreVO>();
		StoreVO storeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STORES_BYSC_ID);
			pstmt.setInt(1, sc_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				storeVO = new StoreVO();
				storeVO.setStore_id(rs.getString("store_id"));
				storeVO.setSc_id(rs.getInt("Sc_id"));
				storeVO.setStore_name(rs.getString("store_name"));
				storeVO.setStore_content(rs.getString("store_content"));
				storeVO.setStore_phone(rs.getInt("store_phone"));
				storeVO.setStore_addr(rs.getString("store_addr"));
				storeVO.setStore_date(rs.getDate("store_date"));
				storeVO.setStore_star(rs.getInt("store_star"));
				storeVO.setStore_count(rs.getInt("store_count"));
				storeVO.setStore_state(rs.getInt("store_state"));
				storeVO.setStore_image(rs.getBytes("store_image"));
				storeVO.setStore_report_count(rs.getInt("store_report_count"));
				storeVO.setStore_start_time(rs.getTimestamp("store_start_time"));
				storeVO.setStore_end_time(rs.getTimestamp("store_end_time"));
				storeVO.setStore_pw(rs.getString("store_pw"));
				storeVO.setStore_acc(rs.getString("store_acc"));
				storeVO.setStore_out(rs.getInt("store_out"));
				storeVO.setStore_zone(rs.getString("store_zone"));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return set;
	}
		
		


}
