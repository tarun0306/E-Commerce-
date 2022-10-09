package eshop.homedecor.shopapi.vo.response;

import java.util.List;

import eshop.homedecor.shopapi.entity.OrderMain;



public class OrderResponce {
	private List<OrderMain> orderList;

	public List<OrderMain> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<OrderMain> orderList) {
		this.orderList = orderList;
	}
}
