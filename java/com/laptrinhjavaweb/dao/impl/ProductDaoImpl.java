package com.laptrinhjavaweb.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.dao.ProductDao;
import com.laptrinhjavaweb.dto.Catalog;
import com.laptrinhjavaweb.dto.Comment;
import com.laptrinhjavaweb.dto.Description;
import com.laptrinhjavaweb.dto.Product;
import com.laptrinhjavaweb.dto.ReplyComment;
import com.laptrinhjavaweb.paging.Pageble;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Product> findAll(Pageble pageble) {
		String sql="select * from products order by Id desc limit "+(pageble.getOffset())+", "+pageble.getLimit()+"";
		return jdbcTemplate.query(sql, new Object[] {},new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product = new Product();
				product.setContent(rs.getNString("Content"));
				product.setDateCreated(rs.getNString("DateCreated"));
				product.setDateModified(rs.getNString("DateModified"));
				product.setDescription(rs.getNString("Description"));
				product.setId(rs.getLong("Id"));
				product.setUserCreated(rs.getNString("UserCreated"));
				product.setName(rs.getNString("Name"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setWarranty(rs.getInt("Warranty"));
				return product;
			}
		});
	}

	@Override
	public int countProduct() {
		String sql = "select count(*) from products";
		return jdbcTemplate.queryForObject(sql, new Object[] {},Integer.class);
	}

	@Override
	public List<Product> findOneProductById(int id) {
		String sql= "select * from products where id = ? ";
		return jdbcTemplate.query(sql, new Object[] {id},new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product = new Product();
				product.setContent(rs.getNString("Content"));
				product.setDateCreated(rs.getNString("DateCreated"));
				product.setDateModified(rs.getNString("DateModified"));
				product.setDescription(rs.getNString("Description"));
				product.setId(rs.getLong("Id"));
				product.setUserCreated(rs.getNString("UserCreated"));
				product.setUserModified(rs.getNString("UserModified"));
				product.setName(rs.getNString("Name"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setWarranty(rs.getInt("Warranty"));
				product.setStatus(rs.getBoolean("Status"));
				product.setImage(rs.getNString("Image"));
				return product;
			}
		});
	}

	@Override
	public int updateProduct(Product product) 
	{
		String sql = "update products set Content ='"+product.getContent()+"', "
				+ "Description ='"+product.getDescription()+"', Name='"+product.getName()+"', "
				+ "Price="+product.getPrice()+", PromotionPrice="+product.getPromotionPrice()+", "
				+ "Warranty="+product.getWarranty()+", DateModified='"+product.getDateModified()+"', "
				+ "UserModified='"+product.getUserModified()+"' where id="+product.getId();
		return jdbcTemplate.update(sql);
	}

	@Override
	public List<Product> findAlll() {
		String sql = "select * from products";
		return jdbcTemplate.query(sql,new Object[] {},new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product = new Product();
				product.setContent(rs.getNString("Content"));
				product.setDateCreated(rs.getNString("DateCreated"));
				product.setDateModified(rs.getNString("DateModified"));
				product.setDescription(rs.getNString("Description"));
				product.setId(rs.getLong("Id"));
				product.setImageList(rs.getNString("ImageList"));
				product.setUserCreated(rs.getNString("UserCreated"));
				product.setName(rs.getNString("Name"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setWarranty(rs.getInt("Warranty"));
				return product;
			}
		});
	}

	@Override
	public List<Product> editFile(long id) {
		String sql = "select * from products where id = ?";
		return jdbcTemplate.query(sql, new Object[] {id},new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getNString("Name"));
				product.setImage(rs.getNString("Image"));
				product.setImageList(rs.getNString("ImageList"));
				return product;
			}
		});
	}

	@Override
	public int updateFile(long id, String s) {
		String sql="update products set Image ='"+s+"' where id = "+id;
		return jdbcTemplate.update(sql);
	}

	@Override
	public String getStrImage(long id) {
		String sql = "select Image from products where id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id},String.class);
	}

	@Override
	public List<Product> getDescription(Long id) {
		String sql = "select * from description where idproduct = ? ";
		return jdbcTemplate.query(sql, new Object[] {id}, new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product = new Product();
				product.setId(rs.getLong("idproduct"));
				product.setBigDescription(rs.getNString("content"));
				return product;
			}
		});
	}

	@Override
	public int updateDescriptionProduct(Description description) {
		String sql = "insert description(idproduct,content) value(?,?) ";
		return jdbcTemplate.update(sql,new Object[] {description.getId(),description.getContent()});
	}

	@Override
	public List<Description> displayDetailsDescriptionProduct(long id) {
		String sql = "select * from description where idproduct = ?";
		return jdbcTemplate.query(sql,new Object[] {id},new RowMapper<Description>() {

			@Override
			public Description mapRow(ResultSet rs, int rowNum) throws SQLException {
				Description description =new Description();
				description.setId(rs.getLong("idproduct"));
				description.setContent(rs.getNString("content"));
				return description;
			}
		});
	}

	@Override
	public List<Comment> getCommentByIdProduct(long id) {
		String sql = "select users.fullname,comments.Id,comments.IdProduct,comments.IdUser,"
				+ "comments.Contents,comments.Date,comments.Status from comments, "
				+ "users where comments.IdProduct = ? and users.iduser = comments.IdUser "
				+ "and comments.Status = true and users.status = true order by comments.Id desc";
		return jdbcTemplate.query(sql, new Object[] {id},new RowMapper<Comment>() {
			@Override
			public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Comment comment = new Comment();
				comment.setFullName(rs.getNString("fullname"));
				comment.setId(rs.getLong("Id"));
				comment.setIdProduct(rs.getLong("IdProduct"));
				comment.setIdUser(rs.getInt("IdUser"));
				comment.setContent(rs.getNString("Contents"));
				comment.setDate(rs.getNString("Date"));
				comment.setStatus(rs.getBoolean("Status"));
				return comment;
			}
		});
	}

	@Override
	public int saveCommentUser(Comment comment) {
		String sql = "insert into comments(IdProduct,IdUser,Contents,Date,Status) values(?,?,?,?,?)";
		return jdbcTemplate.update(sql,comment.getIdProduct(),
				comment.getIdUser(),comment.getContent()
				,comment.getDate(),1 );
	}

	@Override
	public long getSumCommentByIdProduct(int id) {
		String sql="select count(*) from comments where IdProduct = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id}, Integer.class);
	}

	@Override
	public List<ReplyComment> findAllReplyCommentById(int id) {
		String sql="select users.fullname,replycomment.IdProduct,"
				+ "replycomment.id,replycomment.comment_id,"
				+ "replycomment.content,replycomment.date from replycomment,"
				+ "users where IdProduct = ? and replycomment.status= true and"
				+ " replycomment.user_id = users.iduser order by replycomment.id desc";
		return jdbcTemplate.query(sql, new Object[] {id},new RowMapper<ReplyComment>() {

			@Override
			public ReplyComment mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReplyComment replyComment = new ReplyComment();
				replyComment.setFullName(rs.getNString("fullname"));
				replyComment.setIdProduct(rs.getLong("IdProduct"));
				replyComment.setId(rs.getInt("id"));
				replyComment.setCommentId(rs.getInt("comment_id"));
				replyComment.setContent(rs.getNString("content"));
				replyComment.setDate(rs.getNString("date"));
				return replyComment;
			}
			
		});
	}

	@Override
	public List<ReplyComment> getReplyCommentByIdProduct(int idProduct, int idReplyComment) {
		String sql = "select users.fullname,replycomment.IdProduct,"
				+ "replycomment.id,replycomment.comment_id,"
				+ "replycomment.content,replycomment.date from replycomment,"
				+ "users where IdProduct = ? and "
				+ "comment_id = ? and replycomment.status= true and "
				+ "replycomment.user_id = users.iduser order by replycomment.id desc";
		return jdbcTemplate.query(sql, new Object[] {idProduct,idReplyComment},new RowMapper<ReplyComment>() {

			@Override
			public ReplyComment mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReplyComment replyComment = new ReplyComment();
				replyComment.setFullName(rs.getNString("fullname"));
				replyComment.setIdProduct(rs.getLong("IdProduct"));
				replyComment.setId(rs.getInt("id"));
				replyComment.setCommentId(rs.getInt("comment_id"));
				replyComment.setContent(rs.getNString("content"));
				replyComment.setDate(rs.getNString("date"));
				return replyComment;
			}
		});
	}

	@Override
	public int saveReplyCommentUser(ReplyComment replyComment) {
		String sql="insert into replycomment(comment_id,IdProduct,user_id,content,date,status) values(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,replyComment.getCommentId(),replyComment.getIdProduct(),
				replyComment.getUserId(),replyComment.getContent(),replyComment.getDate(),1);
	}

	@Override
	public int addNewProduct(Catalog catalog) {
		String sql = "insert products(CatalogId,Name,DateCreated,UserCreated,Status) values(?,?,?,?,?)";
		return jdbcTemplate.update(sql,catalog.getId(),catalog.getName(),catalog.getDateCreated(),catalog.getUserCreated(),1);
	}

	@Override
	public List<Catalog> getAllCatalog() {
		String sql="select * from catalogs where Visibility=1";
		return jdbcTemplate.query(sql, new Object[] {}, new RowMapper<Catalog>() {
			@Override
			public Catalog mapRow(ResultSet rs, int rowNum) throws SQLException {
				Catalog catalog = new Catalog();
				catalog.setName(rs.getNString("Name"));
				catalog.setId(rs.getLong("Id"));
				return catalog;
			}
		});
	}

	@Override
	public int createNewModel(String name) {
		String sql="insert into catalogs(Name,SiteTitle,Visibility) values(?,?,?)";
		return jdbcTemplate.update(sql,name,name,1);
	}
	
	@Override
	public List<Catalog> listCategories() {
		String sql= "select * from catalogs where Visibility = 1";
		return jdbcTemplate.query(sql, new Object[] {},new RowMapper<Catalog>() {
			@Override
			public Catalog mapRow(ResultSet rs, int rowNum) throws SQLException {
				Catalog catalog = new Catalog();
				catalog.setId(rs.getLong("Id"));
				catalog.setName(rs.getNString("Name"));
				catalog.setSiteTitle(rs.getNString("SiteTitle"));
				catalog.setVisibility(rs.getBoolean("Visibility"));
				return catalog;
			}
		});
	}

	@Override
	public List<Product> listProductByCategory(String name) {
		String sql=  "select products.Id,products.Name as nameproduct,Price,products.ImageList,"
				+ "catalogs.Name from products,catalogs where products.CatalogId = catalogs.Id and catalogs.Name = ?";
		return jdbcTemplate.query(sql, new Object[] {name},new RowMapper<Product>() {
			
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getNString("nameproduct"));
				product.setPrice(rs.getLong("Price"));
				product.setImageList(rs.getNString("ImageList"));
				product.setContent(rs.getNString("Name"));
				return product;
			}
			
		});
	}

	@Override
	public Product getProductById(long id) {
		String sql = "select * from products where Id = ? ";
		return jdbcTemplate.queryForObject(sql, new Object[] {id} , new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getNString("Name"));
				product.setPrice(rs.getLong("Price"));
				product.setImageList(rs.getNString("ImageList"));
				return product;
			}
		});
	}

	@Override
	public List<Product> searchProductByName(String name) {
		String sql="SELECT products.Id,products.Name,products.Price,products.ImageList,MATCH (Name) "
				+ "AGAINST (?) as score FROM products WHERE MATCH(Name) "
				+ "AGAINST (? IN NATURAL LANGUAGE MODE) > 0.1 ORDER BY score DESC";
		return jdbcTemplate.query(sql, new Object[] {name,name},new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product product  = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getNString("Name"));
				product.setPrice(rs.getLong("Price"));
				product.setImageList(rs.getNString("ImageList"));
				return product;
			}
			
		});
	}
	
}
