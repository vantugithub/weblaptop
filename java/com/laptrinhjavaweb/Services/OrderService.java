package com.laptrinhjavaweb.Services;

import com.laptrinhjavaweb.dto.ListItem;
import com.laptrinhjavaweb.dto.Order;

public interface OrderService {
	int detailedOrderList(ListItem item,long orderId);
	int orderedList(Order order);
	int getOrderId(String orderedDate,long idUser);
	
}
