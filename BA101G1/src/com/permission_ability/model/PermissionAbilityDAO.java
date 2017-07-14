package com.permission_ability.model;

import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.hibernate.*;
import com.tools.HibernateUtil;


public class PermissionAbilityDAO implements Permission_AbilityDAO_interface{
	
	private static final String GET_ALL_STMT = "from PermissionVO order by man_id desc";
	@Override
	public void insert(Permission_AbilityVO paVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(paVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}


	@Override
	public void update(Permission_AbilityVO paVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(paVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}


	@Override
	public void delete(String pa_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
//        �i���ɦh��(�y)�i�ĥ�HQL�R���j
//			Query query = session.createQuery("delete EmpVO where empno=?");
//			query.setParameter(0, empno);
//			System.out.println("�R��������=" + query.executeUpdate());
			
//        �i�Φ��ɦh��(�])�i�ĥΥh�����p���Y��A�A�R�����覡�j
			Permission_AbilityVO paVO = new Permission_AbilityVO();
			paVO.setPa_id(pa_id);
			session.delete(paVO);
			
//        �i���ɦh�褣�i(���y)�ĥ�cascade�p�ŧR���j
//        �i�h��emp2.hbm.xml�p�G�]�� cascade="all"�� cascade="delete"�N�|�R���Ҧ��������-�]�A���ݳ����P�P�������䥦���u�N�|�@�ֳQ�R���j
//			EmpVO empVO = (EmpVO) session.get(EmpVO.class, empno);
//			session.delete(empVO);
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	
	@Override
	public Permission_AbilityVO findByPrimaryKey(String pano) {
		Permission_AbilityVO paVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			paVO = (Permission_AbilityVO) session.get(Permission_AbilityVO.class, pano);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return paVO;
	}




	@Override
	public List<Permission_AbilityVO> getAll() {
		List<Permission_AbilityVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}







	
}
