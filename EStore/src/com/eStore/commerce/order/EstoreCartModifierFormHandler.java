package com.eStore.commerce.order;

import java.io.IOException;


import javax.servlet.ServletException;


import java.util.HashMap;

import atg.commerce.order.CommerceItem;
import atg.commerce.order.CommerceItemNotFoundException;
import atg.commerce.order.InvalidParameterException;
import atg.commerce.order.purchase.CartModifierFormHandler;
import atg.service.pipeline.PipelineManager;
import atg.service.pipeline.RunProcessException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class EstoreCartModifierFormHandler extends CartModifierFormHandler{
	  /**
	   * Called before any processing is done by the moveToPurchaseInfo method.
	   * It currently does nothing.
	   *
	   * @param pRequest the request object
	   * @param pResponse the response object
	   * @exception ServletException if an error occurs
	   * @exception IOException if an error occurs
	   */
  PipelineManager  pm;
	  private String catalogId;
	  public String getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(String catalogId) {
		this.catalogId = catalogId;
	}

	public void preMoveToPurchaseInfo(DynamoHttpServletRequest pRequest,
	                                    DynamoHttpServletResponse pResponse)
	    throws ServletException, IOException
	  {
		  setCheckForChangedQuantity(false);
	  }
	  
	  public void preRemoveItemFromOrder(DynamoHttpServletRequest pRequest,
              DynamoHttpServletResponse pResponse)
	throws ServletException, IOException
	{
		  try {
			CommerceItem commerceItem = getOrder().getCommerceItem(pRequest.getParameter("removalCommerceIds"));
			String commerceIds[]={pRequest.getParameter("removalCommerceIds")};
			setRemovalCommerceIds(commerceIds);
			HashMap map = new HashMap<String,String>();
			// hm.put("A","C");
			getPipelineManager().runProcess("processOrder", map);
			
			

			
		} catch (CommerceItemNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidParameterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(RunProcessException e)
		{
			e.printStackTrace();
		}
	}

	

	public PipelineManager getPipelineManager() {
		return pm;
	}

	public void setPipelineManager(PipelineManager pm) {
		this.pm = pm;
	}

}
