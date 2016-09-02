<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:include page="../profile/logout.jsp"/>
<dsp:importbean bean="/atg/commerce/pricing/UserPricingModels"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:setvalue bean="Profile.currentLocation" value="shopping_cart"/>

<p>
<dsp:a href="/store/profile/home.jsp" >Catalog</dsp:a>
&nbsp<dsp:a href="/store/profile/my_profile.jsp" >Profile</dsp:a>
&nbsp<dsp:a href="/store/store/cart.jsp" >Cart( <dsp:valueof bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount"></dsp:valueof> )</dsp:a>
<br><hr size=0>
<!--  REDIRECTING TO LOGIN PAGE INCASE USER NOT LOGGED IN  -->
	<dsp:droplet name="/atg/dynamo/droplet/Switch">
    <dsp:param bean="Profile.transient" name="value"/>
    <dsp:oparam name="true">
        <dsp:droplet name="/atg/dynamo/droplet/Redirect">
          <dsp:param value="/index.jsp" name="url"/>
        </dsp:droplet>
    </dsp:oparam>
    </dsp:droplet>
<!----------------------------------------------------------------->
<!-- Display any errors that have been generated up until now    -->
<!-- on the form.                                                -->
<!----------------------------------------------------------------->


<span class=storebig><b>Order Information</span><br>
<p>
<dsp:form action="co_confirm.jsp" method="POST">
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
</font>
<table cellspacing=0 cellpadding=0 border=0>

<!-- Setup gutter and make space -->
  <tr>
    <td width=200><dsp:img height="1" width="100" src="../../images/d.gif"/><br></td>
    <td>&nbsp;&nbsp;</td>
    <td><dsp:img height="1" width="400" src="../../images/d.gif"/></td>
  </tr>
  <tr valign=top>
    <td width=200>
      <span class=help><b>Enter a billing address. </span>
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store><b>My billing address</td></tr></table>
      <p>
	
	<!-- Display the billing address information -->
	<%@ include file="enter_billing_address.jspf" %>

      Email<br>
      <dsp:input bean="Profile.email" size="20" type="text"/><br>
      
      <p>&nbsp;<br>
    </td>
  </tr>
  <tr valign=top>
    <td width=200>
      <span class=help><b>Decide if you wish to ship all items to
      your billing address or a different address.</span>
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store><b>My shipping address</td></tr></table>

      <p>

      
      <p>
	
	<!-- Request the shipping address information -->
	<%@ include file="enter_shipping_address.jspf" %>

      <p>&nbsp;<br>
	
      <!-- The droplet AvailableShippingMethods is able to give us a list of the shipping -->
      <!-- methods that should be available to a user.                                    -->
      <b>Shipping Method :</b> <dsp:valueof bean="ShoppingCartModifier.shippingGroup.shippingMethod"></dsp:valueof><br>
	<dsp:droplet name="AvailableShippingMethods">
	<dsp:param bean="ShoppingCartModifier.shippingGroup" name="shippingGroup"/>
	<dsp:param bean="UserPricingModels.shippingPricingModels" name="pricingModels"/>
	<dsp:param bean="Profile" name="profile"/>
	<dsp:oparam name="output">
		<dsp:select bean="ShoppingCartModifier.shippingGroup.shippingMethod">
		<dsp:droplet name="ForEach">
		  <dsp:param name="array" param="availableShippingMethods"/>
		  <dsp:param name="elementName" value="method"/>
		  <dsp:oparam name="output">
		  <dsp:getvalueof id="option199" param="method" idtype="java.lang.String">
			<dsp:option value="<%=option199%>"/>
			</dsp:getvalueof><dsp:valueof param="method"/>
		  </dsp:oparam>
		</dsp:droplet>
		</dsp:select>
	</dsp:oparam>
	</dsp:droplet> 

      
      
      
      <p>
      &nbsp;<br>
    </td>
  </tr> 
  
  <tr valign=top>
    <td width=200>
      <span class=help><b>We accept credit card payments in the form of master card, visa,
      american express, and discover.
      
      </span>
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store><b>Payment method</td></tr></table>
      <p>
      
      I will pay with this credit card
      <blockquote>
        <p>
	New card type <dsp:select bean="ShoppingCartModifier.paymentGroup.creditCardType" required="<%=true%>">
	<dsp:option value="Visa"/>Visa
	<dsp:option value="MasterCard"/>Master Card
	<dsp:option value="AmericanExpress"/>American Express
	<dsp:option value="Discover"/>Discover
	</dsp:select><br>

        New card number and expiration date<br>
	<dsp:input bean="ShoppingCartModifier.paymentGroup.creditCardNumber" maxsize="20" size="20" type="text" required="<%=true%>"/><br>

	<!-- Set the month that the card will expire on -->
	Month: <dsp:select bean="ShoppingCartModifier.paymentGroup.expirationMonth">
	<dsp:option value="1"/>January
	<dsp:option value="2"/>February
	<dsp:option value="3"/>March
	<dsp:option value="4"/>April
	<dsp:option value="5"/>May
	<dsp:option value="6"/>June
	<dsp:option value="7"/>July
	<dsp:option value="8"/>August
	<dsp:option value="9"/>September
	<dsp:option value="10"/>October
	<dsp:option value="11"/>November
	<dsp:option value="12"/>December
	</dsp:select>
	
	<!-- Set the year that the card will expire on -->
	Year: <dsp:select bean="ShoppingCartModifier.paymentGroup.expirationYear">
	<dsp:option value="2004"/>2004
	<dsp:option value="2005"/>2005
	<dsp:option value="2006"/>2006
	<dsp:option value="2007"/>2007
	<dsp:option value="2008"/>2008
	<dsp:option value="2009"/>2009
	<dsp:option value="2010"/>2010
	<dsp:option value="2011"/>2011
	<dsp:option value="2012"/>2012
	<dsp:option value="2013"/>2013
	</dsp:select>

      </blockquote>
      
      <p>&nbsp;<br>

<!-- Set the Location to go to if there are no errors when processing this form -->
<dsp:input bean="ShoppingCartModifier.moveToConfirmationSuccessURL" type="hidden" value="order_confirm.jsp"/>

<!-- Set the Location to go to if there are error on this form.  We stay on this page and then -->
<!-- just display the error messages.                                                          -->
<dsp:input bean="ShoppingCartModifier.moveToConfirmationErrorURL" type="hidden" value="order_info.jsp"/>

<!-- Go to this URL if user's session expired while he pondered this page -->
<dsp:input bean="ShoppingCartModifier.sessionExpirationURL" type="hidden" value="../index.jsp"/>
      
      <dsp:input bean="ShoppingCartModifier.moveToConfirmation" type="submit" value="   Continue   "/>
      
    </td>
  </tr>
    
  </table>


</dsp:form>
<p>&nbsp;<br>

</body>
</html>


</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/checkout/basic/order_info.jsp#1 $$Change: 508164 $--%>
