package com.eStore.commerce.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;

import atg.commerce.order.CommerceItem;
import atg.commerce.order.OrderImpl;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class GroupItemsDroplet extends DynamoServlet {

	
	public void service(DynamoHttpServletRequest req,DynamoHttpServletResponse resp)throws ServletException,IOException{
		
		List<CommerceItem> cItemList = new ArrayList<CommerceItem>();
		OrderImpl orderImpl = (OrderImpl)req.getObjectParameter("order");
		for(Iterator i=orderImpl.getCommerceItems().iterator();i.hasNext();){
			
			CommerceItem commerceItem = (CommerceItem)i.next();
			cItemList.add(commerceItem);
		}
		req.setParameter("itemGroups", cItemList);
		req.serviceLocalParameter("output", req, resp);
	}
}
