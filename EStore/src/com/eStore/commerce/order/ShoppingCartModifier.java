package com.eStore.commerce.order;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;

import atg.adapter.gsa.GSAItem;
import atg.adapter.gsa.ItemTransactionState;
import atg.commerce.CommerceException;
import atg.commerce.order.CommerceItem;
import atg.commerce.order.InvalidParameterException;
import atg.commerce.order.InvalidVersionException;
import atg.commerce.order.ObjectRemovalException;
import atg.commerce.order.Order;
import atg.commerce.order.OrderImpl;
import atg.commerce.order.ShoppingCartFormHandler;
import atg.commerce.order.SoftGoodFormHandler;
import atg.core.util.ResourceUtils;
import atg.repository.MutableRepository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.service.pipeline.RunProcessException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class ShoppingCartModifier extends ShoppingCartFormHandler {

	public void preMoveToConfirmation(DynamoHttpServletRequest pRequest,
            DynamoHttpServletResponse pResponse)
throws ServletException, IOException
{
     setLoggingDebug(true);       
     
}
	  public void preMoveToPurchaseInfo(DynamoHttpServletRequest pRequest,
              DynamoHttpServletResponse pResponse)
throws ServletException, IOException
{
		  setCheckForChangedQuantity(false);
		 
}
	 
}
