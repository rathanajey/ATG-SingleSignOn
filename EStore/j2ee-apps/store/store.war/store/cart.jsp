<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/eStore/commerce/order/GroupItemsDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:importbean bean="/atg/commerce/gifts/IsGiftShippingGroup"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:page>
<dsp:a href="/store/profile/home.jsp" >Catalog</dsp:a>
&nbsp<dsp:a href="/store/profile/my_profile.jsp" >Profile</dsp:a><br><hr size=0>
<dsp:include page="../profile/logout.jsp"/>

<!--  REDIRECTING TO LOGIN PAGE INCASE USER NOT LOGGED IN  -->
	<dsp:droplet name="/atg/dynamo/droplet/Switch">
    <dsp:param bean="Profile.transient" name="value"/>
    <dsp:oparam name="true">
        <dsp:droplet name="/atg/dynamo/droplet/Redirect">
          <dsp:param value="/index.jsp" name="url"/>
        </dsp:droplet>
    </dsp:oparam>
    </dsp:droplet>
    
<dsp:form action="../checkout/order_info.jsp" method="POST">

<font color="RED">
 			<dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="ShoppingCartModifier.formError" name="value"/>
              <dsp:oparam name="true">
                <span class=registrationerror>
                  <span class=help>checkout  Error !:</span><p>
                  <UL>
                    <dsp:droplet name="ErrorMessageForEach">
                      <dsp:param bean="ShoppingCartModifier.formExceptions" name="exceptions"/>
                      <dsp:oparam name="output">
                       <LI> <dsp:valueof param="message"/>
                      </dsp:oparam>
                    </dsp:droplet>
                  </UL>
                </span>
              </dsp:oparam>
            </dsp:droplet>
            <dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="CartModifierFormHandler.formError" name="value"/>
              <dsp:oparam name="true">
                <span class=registrationerror>
                  <span class=help>checkout  Error !:</span><p>
                  <UL>
                    <dsp:droplet name="ErrorMessageForEach">
                      <dsp:param bean="CartModifierFormHandler.formExceptions" name="exceptions"/>
                      <dsp:oparam name="output">
                       <LI> <dsp:valueof param="message"/>
                      </dsp:oparam>
                    </dsp:droplet>
                  </UL>
                </span>
              </dsp:oparam>
            </dsp:droplet>
</font>
<p>
<span class=storebig><b>My Shopping Cart</span><hr size=0> <br>
<dsp:droplet name="Switch">
  <dsp:param bean="/atg/commerce/ShoppingCart.currentEmpty" name="value"/>
  <dsp:oparam name="true">
   cart empty
  </dsp:oparam>
  <dsp:oparam name="false">
    <dsp:setvalue beanvalue="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount" param="NumItems"/>
    <dsp:droplet name="/atg/dynamo/droplet/Switch">
      <dsp:param name="value" param="NumItems"/>
      <dsp:oparam name="1">
        <dsp:valueof param="NumItems"/> item
        (<dsp:valueof converter="currency" bean="/atg/commerce/ShoppingCart.current.priceInfo.amount"/>)
      </dsp:oparam>
      <dsp:oparam name="default">
        <dsp:valueof param="NumItems"/> items
	(<dsp:valueof converter="currency" bean="/atg/commerce/ShoppingCart.current.priceInfo.amount"/>)
      </dsp:oparam>
    </dsp:droplet>

</p>

    <table >

    <tr align=left> 
     
      <td><b>Product Name</td>
      <td><b>Qty</td>
      <td><b>Price</b></td>
      <td></td>
    </tr>

		    <dsp:droplet name="GroupItemsDroplet">
		             <dsp:param name="order" bean="/atg/commerce/ShoppingCart.current"/>
		             <dsp:oparam name="output">
		             
		    <dsp:droplet name="ForEach">
		               <dsp:param name="array" param="itemGroups"/>
		               <dsp:param name="elementName" value="commerceItem"/>
		               <dsp:param name="indexName" value="index"/>
		               <dsp:oparam name="outputStart">
		                 <tr><td colspan=13>&nbsp;<br>Shipping to you:<hr size=0></td></tr>
		               </dsp:oparam>
		               <dsp:oparam name="output">
		                 
		                 <tr align=left>		     
					      <td><dsp:valueof param="commerceItem.auxiliaryData.catalogRef.displayName"/></td>
					      <td><dsp:valueof param="commerceItem.quantity"/></td>
					      <td><dsp:valueof param="commerceItem.priceInfo.rawTotalPrice"/></td>
					      <td><dsp:a bean="CartModifierFormHandler.removeItemFromOrder" href="/store/store/cart.jsp" value="">
					      		<dsp:param param="commerceItem.auxiliaryData.productId" name="removalProductId"/>
					      		<dsp:param param="commerceItem.catalogRefId" name="removalSkuId"/>
					      		<dsp:param param="commerceItem.Id" name="removalCommerceIds"/>
					      		Remove From Cart
					      </dsp:a> </td>
		    			</tr>
		               </dsp:oparam>
		   </dsp:droplet>
		   
		   </dsp:oparam>
		   </dsp:droplet>

      
		<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoByRelIdSuccessURL" type="hidden" value="../checkout/order_info.jsp"/>
	     <dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoByRelIdErrorURL" type="hidden" value="../store/cart.jsp"/> 
	     <tr><td colspan="3">
	     	
	     		<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoByRelId" type="submit" value="  Checkout"/>

	     </td>
	     </tr>
     
    </table>
  </dsp:oparam>
</dsp:droplet>
   </dsp:form> 
</dsp:page>