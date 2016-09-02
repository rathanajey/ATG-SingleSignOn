<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/eStore/commerce/order/GroupItemsDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:page>
<br>
<dsp:a href="/store/profile/home.jsp" >Catalog</dsp:a>
&nbsp<dsp:a href="/store/profile/my_profile.jsp" >Profile</dsp:a>
&nbsp<dsp:a href="/store/store/cart.jsp" >Cart( <dsp:valueof bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount"></dsp:valueof> )</dsp:a>
<dsp:include page="../profile/logout.jsp"/>
<br><hr size=0>
<br><br><br><br>
<b>Your Order has been submitted . Order No. #<dsp:valueof bean="/atg/commerce/ShoppingCart.last.id"></dsp:valueof></b><br><br>
    <table >

    <tr align=left> 
     
      <td><b>Product Name</td>
      <td><b>Qty</td>
      <td><b>Price</b></td>
    </tr>

		    <dsp:droplet name="GroupItemsDroplet">
		             <dsp:param name="order" bean="/atg/commerce/ShoppingCart.last"/>
		             <dsp:oparam name="output">
		             
		    <dsp:droplet name="ForEach">
		               <dsp:param name="array" param="itemGroups"/>
		               <dsp:param name="elementName" value="commerceItem"/>
		               <dsp:param name="indexName" value="index"/>
		               <dsp:oparam name="outputStart">
		                 <tr><td colspan=3><hr size=0></td></tr>
		               </dsp:oparam>
		               <dsp:oparam name="output">
		                 
		                 <tr align=left>		     
					      <td><dsp:valueof param="commerceItem.auxiliaryData.catalogRef.displayName"/></td>
					      <td><dsp:valueof param="commerceItem.quantity"/></td>
					      <td><dsp:valueof param="commerceItem.priceInfo.rawTotalPrice"/></td>

		    			</tr>
		               </dsp:oparam>
		   </dsp:droplet>
		   
		   </dsp:oparam>
		   </dsp:droplet>
     
    </table>
    
    <table>
     <tr><td colspan=5><hr size=0></td></tr>
      <tr valign=top>
    <td colspan=2></td>
    <td align=right>order subtotal</td>
    <td></td><td align=right><dsp:valueof converter="currency" bean="/atg/commerce/ShoppingCart.last.priceInfo.amount"/></td>
  </tr>
  <tr valign=top>
    <td colspan=2></td>
    <td align=right>sales tax</td>
    <td></td><td align=right><dsp:valueof converter="currency" bean="/atg/commerce/ShoppingCart.last.priceInfo.tax"/></td>
  </tr>
  <tr valign=top>
    <td colspan=2></td>
    <td align=right>shipping</td>
    <td></td><td align=right><dsp:valueof converter="currency" bean="/atg/commerce/ShoppingCart.last.priceInfo.shipping"/></td>
  </tr>
  <tr><td colspan=5><hr size=0></td></tr>
  <tr valign=top>
    <td colspan=2></td>
    <td align=right>order total including discounts</td>
    <td></td><td align=right><b><dsp:valueof converter="currency" bean="/atg/commerce/ShoppingCart.last.priceInfo.total"/></b></td>
  </tr>

</table>
    </dsp:page>