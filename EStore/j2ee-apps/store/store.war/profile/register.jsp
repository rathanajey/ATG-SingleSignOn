<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

 <% atg.servlet.DynamoHttpServletRequest dynamoRequest =
      atg.servlet.ServletUtil.getDynamoRequest(request); 
    %>
<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile" value="false"/> 
<p>
<span class=storebig>New Customer Form</span><br>
<p>
 
<dsp:getvalueof id="form80" bean="/OriginatingRequest.requestURI" idtype="java.lang.String">
<dsp:form action="<%=form80%>" method="POST" formid="register">

      <dsp:input bean="ProfileFormHandler.createNewUser" type="hidden" value="false"/>
      <dsp:input bean="ProfileFormHandler.createSuccessURL" type="hidden" value="my_profile.jsp"/>
      <input type="hidden" name="first_time" value="yes">
      <dsp:input bean="ProfileFormHandler.confirmPassword" type="hidden" value="true"/>
      <dsp:input bean="ProfileFormHandler.value.member" type="hidden" value="true"/>

      <table cellspacing=0 cellpadding=0 border=0>

        <!-- Setup gutter and make space -->
        <tr>
          <td width=30%><dsp:img height="1" width="100" src="../images/d.gif"/><br></td>
          <td>&nbsp;&nbsp;</td>
          <td><dsp:img height="1" width="300" src="../images/d.gif"/></td>
        </tr>

        <tr valign=top>
          <td width=30%>
          <font color="RED">
            <dsp:droplet name="Switch">
              <dsp:param bean="ProfileFormHandler.formError" name="value"/>
              <dsp:oparam name="true">
                <span class=registrationerror>
                  <span class=help>There were problems with your registration:</span><p>
                  <UL>
                    <dsp:droplet name="ProfileErrorMessageForEach">
                      <dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions"/>
                      <dsp:oparam name="output">
                       <LI> <dsp:valueof param="message"/>
                      </dsp:oparam>
                    </dsp:droplet>
                   
                  </UL>
                </span>
              </dsp:oparam>
            </dsp:droplet>
             </font>
          </td>
          <td></td>
          <td>
          

            <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>&nbsp;Me</td></tr>
            </table>
            
            <p>
            Name (first, middle, last)<br>
            <dsp:input bean="ProfileFormHandler.value.firstName" maxlength="40" size="15" type="text" required="<%=true%>"/> 
            <dsp:input bean="ProfileFormHandler.value.middleName" maxlength="40" size="10" type="text"/>
            <dsp:input bean="ProfileFormHandler.value.lastName" maxlength="40" size="15" type="text" required="<%=true%>"/>
            <p>
            Email address <br>
            <dsp:input bean="ProfileFormHandler.value.email" maxlength="30" size="30" type="text"/>
            <p>
            Daytime telephone<br>
            <dsp:input bean="ProfileFormHandler.value.daytimeTelephoneNumber" maxlength="20" size="20" type="text"/><br>
            <p>&nbsp;<br>
          </td>
        </tr>

        <tr valign=top>
         
        
          <!-- 2. Billing/Main Address -->
          
          <td width=30%>
            <span class=help>Please provide us with the address where you wish
            to be billed.<p>
            You may use this same address for shipping, or enter
            a separate shipping address below.</span>
          </td>
          <td></td>
          <td>
            <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>&nbsp;My billing address</td></tr>
            </table>
            <p>
            Street address <br> 
            <dsp:input bean="ProfileFormHandler.value.billingAddress.ownerId" beanvalue="Profile.id" type="hidden"/>
            <dsp:input bean="ProfileFormHandler.value.billingAddress.address1" maxlength="30" size="40" type="text" required="<%=true%>"/><br>
            <dsp:input bean="ProfileFormHandler.value.billingAddress.address2" maxlength="30" size="40" type="text"/><br>
            <table cellpadding=0 cellspacing=0>
              <tr>
                <td>City<br>
                    <dsp:input bean="ProfileFormHandler.value.billingAddress.city" maxlength="30" size="20" type="text" required="<%=true%>"/></td>
                <td>&nbsp;State<br> 
                    &nbsp;<dsp:select bean="ProfileFormHandler.value.billingAddress.state">
                    
                    <dsp:option value='AL'>Alabama</dsp:option>   
                    <dsp:option value='FL'>Florida</dsp:option>   
                    <dsp:option value='GA'>Georgia</dsp:option>   
                    <dsp:option value='HI'>Hawaii</dsp:option>                  
                    </dsp:select>
                 </td>
                <td>&nbsp;Postal Code<br>
                    &nbsp;<dsp:input bean="ProfileFormHandler.value.billingAddress.postalCode" maxlength="10" size="10" type="text" required="<%=true%>"/></td>
              </tr>
            </table>
            <table cellpadding=0 cellspacing=0>
              <tr>
                <td>Country<br>
                  
                     <dsp:input bean="ProfileFormHandler.value.billingAddress.country" maxlength="10" size="10" type="text" required="<%=true%>"/>

                </td>                              
              </tr>
              <tr>
                <td>Telephone<br>
                  <dsp:input bean="ProfileFormHandler.value.billingAddress.phoneNumber" maxlength="15" size="15" type="text"/></td>
              </tr>
            </table>
            <p>&nbsp;<br>
          </td>
        </tr>

        <tr valign=top>
        
        
          <!-- 3. Ship it here: -->   
          <td width=30%>
            <span class=help>
              If you know that you will want to ship products to a different address,
              then you may enter an alternate shipping address here.
              <p>If you will always ship products to your billing address,
              then indicate that here.
            </span>
          </td>
          <td></td>
          <td>
            <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>&nbsp;My main shipping address</td></tr>
            </table>
            <p>

            <dsp:input bean="ProfileFormHandler.shipToBillingAddress" type="radio" checked="<%=true%>" value="true"/> Use billing address for shipping<br>
            <dsp:input bean="ProfileFormHandler.shipToBillingAddress" type="radio" checked="<%=false%>" value="false"/> Use the new address below for shipping
            <p>
            Street address <br>

            <dsp:input bean="ProfileFormHandler.value.shippingAddress.ownerId" beanvalue="Profile.id" type="hidden"/>            
            <dsp:input bean="ProfileFormHandler.value.shippingAddress.address1" maxlength="30" size="40" type="text"/><br>
            <dsp:input bean="ProfileFormHandler.value.shippingAddress.address2" maxlength="30" size="40" type="text"/><br>
            <table cellpadding=0 cellspacing=0>
              <tr>
                <td>City<br>
                    <dsp:input bean="ProfileFormHandler.value.shippingAddress.city" maxlength="30" size="20" type="text"/></td>
                <td>&nbsp;State<br>
                    &nbsp;<dsp:select bean="ProfileFormHandler.value.billingAddress.state">
                    
                    <dsp:option value='AL'>Alabama</dsp:option>   
                    <dsp:option value='FL'>Florida</dsp:option>   
                    <dsp:option value='GA'>Georgia</dsp:option>   
                    <dsp:option value='HI'>Hawaii</dsp:option>                  
                    </dsp:select>
                </td>
                <td>&nbsp;Postal Code<br>
                    &nbsp;<dsp:input bean="ProfileFormHandler.value.shippingAddress.postalCode" maxlength="10" size="10" type="text"/></td>
            </table>
            Country<br>
                  
                     <dsp:input bean="ProfileFormHandler.value.shippingAddress.country" maxlength="10" size="10" type="text" required="<%=true%>"/>
            <p>&nbsp;<br>
          </td>
        </tr>

        <tr valign=top>
        
          <!-- 4. Username/password: -->
          <td width=30%>
            <span class=help>When you return to the site, log in with this
            username and password to manage your account information.</span>
            <p>          
          </td>
          <td></td>
          <td>
            <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>&nbsp;My profile</td></tr>
            </table>
            <p>
            Choose a username <span class=help>( i.e. 'mithun22' )</span><br>
            <dsp:input bean="ProfileFormHandler.value.login" maxlength="20" size="15" type="text"/>
            <p>
            Choose a password <span class=help>( i.e. 'pA$$weRD22' )</span><br>
            <dsp:input bean="ProfileFormHandler.value.password" maxlength="35" size="15" type="password"/><br>
            Enter password again to be sure you have it right<br>
            <dsp:input bean="ProfileFormHandler.value.confirmPassword" maxlength="35" size="15" type="password"/>
            <p>&nbsp;<br>
          </td>
        </tr>

        <tr valign=top>
        
          <!-- 5. Optional Personal Data: -->
         <td width=30%>
            <span class=help>These questions are optional, but it's nice if you tell us.</span>
          </td>
          <td></td>
          <td>
            <table width=100% cellpadding=0 cellspacing=0 border=0>
					  <tr><td class=box-top-profile>&nbsp;About me</td></tr>
					</table>
					<p>
					I am <dsp:select bean="ProfileFormHandler.value.gender">
					       <dsp:option value="male"/>Male
					       <dsp:option value="female"/>Female
					     </dsp:select>.
					<p>
					My Height
						<dsp:input bean="ProfileFormHandler.value.height" maxlength="10" size="10" type="text"/>.
					  
					<p>
					My Weight
						<dsp:input bean="ProfileFormHandler.value.weight" maxlength="10" size="10" type="text"/>.
					
					<p>
					My Hobbies
						<dsp:input bean="ProfileFormHandler.value.hobbies" maxlength="10" size="10" type="text"/>.			
					
					<P>					
					My birthday (MM/DD/YYYY) is
					  <dsp:input bean="ProfileFormHandler.value.dateOfBirth" date="M/d/yyyy" maxlength="10" size="10" type="text"/>.

					 Would you like to receive E mail from Online Store ?<Br>
					         <dsp:select bean="ProfileFormHandler.value.receiveEmail">
					             <dsp:option value="yes"/>yes
					             <dsp:option value="no"/>no
					         </dsp:select>
					 
					<p>&nbsp;<br>
          </td>
  </tr>

        <tr valign=top>
          <!-- 6. Submit: -->
          <td width=30%>
          <td></td>
          <td>
            <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>&nbsp;All done?</td></tr>
            </table>
            <p>
            <p>&nbsp;<br>

            <!-- Submit form to handleCreate() handler -->
            <dsp:input bean="ProfileFormHandler.create" type="submit" value="   Register   "/>
            <p>
            &nbsp;<br>
          </td>


        </tr>
      </table>
    </dsp:form>
    
    </dsp:getvalueof>  

</body>
</html>
</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/user/register.jsp#1 $$Change: 508164 $--%>
