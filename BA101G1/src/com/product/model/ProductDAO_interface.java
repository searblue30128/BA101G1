package com.product.model;

import java.util.List;

public interface ProductDAO_interface {
	public void insert(ProductVO productVO);
	public void update(ProductVO productVO);
	public void delete(String pro_id);
	public ProductVO findByPrimaryKey(String pro_id);
	public List<ProductVO> getAll();
	public ProductVO find_Pro_Image(String pro_id);
}
