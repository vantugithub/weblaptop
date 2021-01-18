package com.laptrinhjavaweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.Services.ProductService;
import com.laptrinhjavaweb.dao.ProductDao;
import com.laptrinhjavaweb.dto.Catalog;
import com.laptrinhjavaweb.dto.Comment;
import com.laptrinhjavaweb.dto.Description;
import com.laptrinhjavaweb.dto.Product;
import com.laptrinhjavaweb.dto.ReplyComment;
import com.laptrinhjavaweb.paging.Pageble;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<Product> findAll(Pageble pageble) {
		return productDao.findAll(pageble);
	}

	@Override
	public int countProduct() {
		return productDao.countProduct();
	}

	@Override
	public List<Product> findOneProductById(int id) {
		return productDao.findOneProductById(id);
	}

	@Override
	public int updateProduct(Product product) {
		return productDao.updateProduct(product);
	}

	@Override
	public List<Product> findAlll() {
		return productDao.findAlll();
	}

	@Override
	public List<Product> editFile(long id) {
		return productDao.editFile(id);
	}

	@Override
	public int updateFile(long id, String s) {
		return productDao.updateFile(id, s);
	}

	@Override
	public String getStrImage(long id) {
		return productDao.getStrImage(id);
	}

	@Override
	public List<Product> getDescription(Long id) {
		return productDao.getDescription(id);
	}

	@Override
	public int updateDescriptionProduct(Description description) {
		return productDao.updateDescriptionProduct(description);
	}

	@Override
	public List<Description> displayDetailsDescriptionProduct(long id) {
		return productDao.displayDetailsDescriptionProduct(id);
	}

	@Override
	public List<Comment> getCommentByIdProduct(long id) {
		return productDao.getCommentByIdProduct(id);
	}

	@Override
	public int saveCommentUser(Comment comment) {
		return productDao.saveCommentUser(comment);
	}

	@Override
	public long getSumCommentByIdProduct(int id) {
		return productDao.getSumCommentByIdProduct(id);
	}

	@Override
	public List<ReplyComment> findAllReplyCommentById(int id) {
		return productDao.findAllReplyCommentById(id);
	}

	@Override
	public List<ReplyComment> getReplyCommentByIdProduct(int idProduct, int idReplyComment) {
		return productDao.getReplyCommentByIdProduct(idProduct, idReplyComment);
	}

	@Override
	public int saveReplyCommentUser(ReplyComment replyComment) {
		return productDao.saveReplyCommentUser(replyComment);
	}

	@Override
	public List<Catalog> getAllCatalog() {
		return productDao.getAllCatalog();
	}

	@Override
	public int addNewProduct(Catalog catalog) {
		return productDao.addNewProduct(catalog);
	}

	@Override
	public int createNewModel(String name) {
		return productDao.createNewModel(name);
	}

	@Override
	public List<Catalog> listCategories() {
		return productDao.listCategories();
	}

	@Override
	public List<Product> listProductByCategory(String name) {
		return productDao.listProductByCategory(name);
	}

	@Override
	public Product getProductById(long id) {
		return productDao.getProductById(id);
	}

	@Override
	public List<Product> searchProductByName(String name) {
		return productDao.searchProductByName(name);
	}


}
