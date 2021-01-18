package com.laptrinhjavaweb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.dao.OrderDao;
import com.laptrinhjavaweb.dto.ListItem;
import com.laptrinhjavaweb.dto.Order;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public int detailedOrderList(ListItem item,long orderId) {
		String sql="insert into orderitems(OrderId,ProductId,Quantity) values(?,?,?)";
		return jdbcTemplate.update(sql,orderId,item.getProduct().getId(),item.getQuantity());
	}

	@Override
	public int orderedList(Order order) {
		String sql="insert into orders(IdUser,OrderDate,Status) values(?,?,?)";
		return jdbcTemplate.update(sql,order.getMyUser().getId(),order.getOrderDate(),
				1);
	}

	@Override
	public int getOrderId(String orderedDate,long idUser) {
		String sql="Select Id from orders where OrderDate = ? and IdUser = ? ";
		return jdbcTemplate.queryForObject(sql,new Object[] {orderedDate,idUser}, Integer.class);
	}

}
