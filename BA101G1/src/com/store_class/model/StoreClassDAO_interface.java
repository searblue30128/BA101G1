package com.store_class.model;

import java.util.List;
import java.util.Set;

import com.store.model.StoreVO;

public interface StoreClassDAO_interface {
	
	public List<StoreClassVO> getAll();
	
	//0401�s�W   �z�L�Ӯa���O�s����X�Ҧ��Ӯa (��:�Ӯa���O�s��Integer������s��String����sc_id)
	public Set<StoreVO> getStoresBySc_id(Integer sc_id);

}
