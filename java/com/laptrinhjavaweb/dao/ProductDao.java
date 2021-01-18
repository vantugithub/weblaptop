package com.laptrinhjavaweb.dao;

import java.util.List;

import com.laptrinhjavaweb.dto.Catalog;
import com.laptrinhjavaweb.dto.Comment;
import com.laptrinhjavaweb.dto.Description;
import com.laptrinhjavaweb.dto.Product;
import com.laptrinhjavaweb.dto.ReplyComment;
import com.laptrinhjavaweb.paging.Pageble;

public interface ProductDao 
{
	List<Product> findAll(Pageble pageble);
	int countProduct();
	List<Product> findOneProductById(int id);
	int updateProduct(Product product);
	List<Product> findAlll();
	List<Product> editFile(long id);
	int updateFile(long id,String s);
	String getStrImage(long id);
	List<Product> getDescription(Long id);
	int updateDescriptionProduct(Description description);
	List<Description> displayDetailsDescriptionProduct(long id);
	List<Comment> getCommentByIdProduct(long id);
	int saveCommentUser(Comment comment);
	long getSumCommentByIdProduct(int id);
	List<ReplyComment> findAllReplyCommentById(int id);
	List<ReplyComment> getReplyCommentByIdProduct(int idProduct,int idReplyComment);
	int saveReplyCommentUser(ReplyComment replyComment);
	int addNewProduct(Catalog catalog);
	List<Catalog> getAllCatalog();
	int createNewModel(String name);
	List<Catalog> listCategories();
	List<Product> listProductByCategory(String name);
	Product getProductById(long id);
	List<Product> searchProductByName(String name);
}
