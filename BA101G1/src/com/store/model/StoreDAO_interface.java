package com.store.model;

import java.util.*;

import com.store_commit.model.StoreCommitVO;

public interface StoreDAO_interface {
	
	public void insert(StoreVO storeVO);
	public void update (StoreVO storeVO);
	public void delete(String store_id);
<<<<<<< HEAD
	public StoreVO findByPrimaryKey(String store_id);
=======
>>>>>>> branch '笨' of https://github.com/w837501/BA101G1.git
	public List<StoreVO> getAll();
<<<<<<< HEAD
	
	//0401�s�W  �z�L�Ӯa�s����X�Ҧ�����(��:�Ӯa���O�s��Integer������s��String����sc_id)
	public Set<StoreCommitVO> getStoreCommitByStore_id(String store_id);
=======
	public StoreVO findByPrimaryKey(String store_id);
	public List<StoreVO> findName(String store_name);
	public List<StoreVO> findZone(String store_zone);

>>>>>>> branch '笨' of https://github.com/w837501/BA101G1.git
}
