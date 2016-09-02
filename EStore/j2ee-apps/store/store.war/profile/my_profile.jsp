<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:page>
<b>My Profile </b>
<hr size=0>
<dsp:a href="/store/store/cart.jsp" >Cart( <dsp:valueof bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount"></dsp:valueof> )</dsp:a>
&nbsp<dsp:a href="/store/profile/home.jsp" >Catalog</dsp:a>
<dsp:include page="../profile/logout.jsp"/>
<hr size=0>

<font color="RED">
 			<dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="CartModifierFormHandler.formError" name="value"/>
              <dsp:oparam name="true">
                <span class=registrationerror>
                  <span class=help>Cart Error !:</span><p>
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
<dsp:form action="home.jsp" method="POST">
	<dsp:droplet name="/atg/dynamo/droplet/Switch">
    <dsp:param bean="Profile.transient" name="value"/>
    <dsp:oparam name="true">
     <dsp:droplet name="/atg/dynamo/droplet/Redirect">
          <dsp:param value="/index.jsp" name="url"/>
        </dsp:droplet>
    </dsp:oparam>
    <dsp:oparam name="false">
	      	Welcome 
	    <dsp:valueof bean="Profile.firstName"/> &nbsp <dsp:valueof bean="Profile.middleName"/> &nbsp <dsp:valueof bean="Profile.lastName"/> <br>      
	      <br>
	 <table>
	  <tr><td colspan="2"><b>Personal Info</td></tr>
	 <tr>
		 <td>Email :</td>
		 <td><dsp:valueof bean="Profile.email"/></td>
	 </tr>
	 <tr>
		 <td>Telephone :</td>
		 <td><dsp:valueof bean="Profile.daytimeTelephoneNumber"/></td>
	 </tr>
	  <tr>
		 <td>Height :</td>
		 <td><dsp:valueof bean="Profile.height"/></td>
	 </tr>
	  <tr>
		 <td>Weight :</td>
		 <td><dsp:valueof bean="Profile.weight"/></td>
	 </tr>
	  <tr>
		 <td>Hobbies :</td>
		 <td><dsp:valueof bean="Profile.hobbies"/></td>
	 </tr>
	 <tr><td colspan="2"><b>My billing Address</td></tr>
	 <tr>
		 <td>Street Address :</td>
		 <td>
		 <dsp:valueof bean="Profile.billingAddress.address1"/>
		 <br><dsp:valueof bean="Profile.billingAddress.address2"/></td>
	 </tr>
	 <tr>
		 <td>City :</td>
		 <td><dsp:valueof bean="Profile.billingAddress.city"/></td>
	 </tr>
	 <tr>
		 <td>State :</td>
		 <td><dsp:valueof bean="Profile.billingAddress.state"/></td>
	 </tr>
	 <tr>
		 <td>Postal Code :</td>
		 <td><dsp:valueof bean="Profile.billingAddress.postalCode"/></td>
	 </tr>
	 <tr>
		 <td>Country :</td>
		 <td><dsp:valueof bean="Profile.billingAddress.country"/></td>
	 </tr>
	 <tr>
		 <td>Telephone :</td>
		 <td><dsp:valueof bean="Profile.billingAddress.phoneNumber"/></td>
	 </tr>
	 <tr><td colspan="2"><b>My Shipping Address</td></tr>
	<tr>
		 <td>Street Address :</td>
		 <td>
		 <dsp:valueof bean="Profile.shippingAddress.address1"/>
		 <br><dsp:valueof bean="Profile.shippingAddress.address2"/></td>
	 </tr>
	 <tr>
		 <td>City :</td>
		 <td><dsp:valueof bean="Profile.shippingAddress.city"/></td>
	 </tr>
	 <tr>
		 <td>State :</td>
		 <td><dsp:valueof bean="Profile.shippingAddress.state"/></td>
	 </tr>
	 <tr>
		 <td>Postal Code :</td>
		 <td><dsp:valueof bean="Profile.shippingAddress.postalCode"/></td>
	 </tr>
	 <tr>
		 <td>Country :</td>
		 <td><dsp:valueof bean="Profile.shippingAddress.country"/></td>
	 </tr>
	 </table>
	      <br>


    </dsp:oparam>
  </dsp:droplet>
  </dsp:form>
</dsp:page>