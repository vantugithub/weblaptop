package com.laptrinhjavaweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.Services.OrderService;
import com.laptrinhjavaweb.dao.impl.OrderDaoImpl;
import com.laptrinhjavaweb.dto.ListItem;
import com.laptrinhjavaweb.dto.Order;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDaoImpl orderDaoImpl;
	
	@Override
	public int detailedOrderList(ListItem item, long orderId) {
		return orderDaoImpl.detailedOrderList(item, orderId);
	}

	@Override
	public int orderedList(Order order) {
		return orderDaoImpl.orderedList(order);
	}

	@Override
	public int getOrderId(String orderedDate,long idUser) {
		return orderDaoImpl.getOrderId(orderedDate,idUser);
	}

}
