<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:page>
<dsp:form action="../store/cart.jsp" method ="POST">

      <dsp:droplet name="/atg/commerce/catalog/ProductLookup">
      <dsp:param name="id" param="prdId"/>
      <dsp:param name="elementName" value="product"/>	
      <dsp:oparam name="wrongCatalog">
       <tr>
       <td align=left width="20%"><dsp:valueof param="product.displayName"></dsp:valueof></td>
       <td align=left width="10%"><dsp:input type="text" bean="CartModifierFormHandler.quantity" value="1" size="1"></dsp:input></td>
       
        <dsp:droplet name="/atg/commerce/pricing/PriceItem">
          	<dsp:param name="item" param="product.childSkus[0]"/>
          	<dsp:param name="elementName" value="PricedSku"/>      
	  		<dsp:param name="product" param="product"/>
			
          	<dsp:oparam name="output">
          	<td><dsp:valueof param="PricedSku.priceInfo.ListPrice"></dsp:valueof></td>
       		<td><dsp:valueof param="PricedSku.priceInfo.amount"></dsp:valueof></td>
       		
          	<td  align=left width="10%">
	            <dsp:droplet name="/atg/dynamo/droplet/Compare">
	              <dsp:param name="obj1" param="PricedSku.priceInfo.ListPrice"/>
	              <dsp:param name="obj2" param="PricedSku.priceInfo.amount"/>
	              <dsp:oparam name="greaterthan">
	                <span class="strikeout">
	                 <dsp:valueof converter="currency" param="PricedSku.priceInfo.ListPrice"/>
	                </span>
	              </dsp:oparam>
	            </dsp:droplet>
	            <dsp:valueof converter="currency" param="PricedSku.priceInfo.amount"/>
            </td>
          	</dsp:oparam>      
        </dsp:droplet>
        <td align=left width="50%">
	        <dsp:input type="hidden" bean="CartModifierFormHandler.productIds" paramvalue="product.id"/>
	        <dsp:input type="hidden" bean="CartModifierFormHandler.productId" paramvalue="product.id"/>
	        <dsp:input type="hidden" bean="CartModifierFormHandler.catalogId" paramvalue="product.childSkus[0].id"/>
	        <dsp:input type="hidden" bean="CartModifierFormHandler.catalogRefIds" paramvalue="product.childSkus[0].id"/>
	        <dsp:input type="hidden" bean="CartModifierFormHandler.addItemToOrderSuccessURL" value="../store/cart.jsp"/>
	        <dsp:input type="image" bean="CartModifierFormHandler.addItemToOrder" alt="Add To Cart"/>
       </td>
       </tr>
      </dsp:oparam>
      </dsp:droplet>

</dsp:form>
</dsp:page>
