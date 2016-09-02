<%@ taglib uri="/dspTaglib" prefix="dsp"%>

<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
	<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/Compare" />
	
	<%
				atg.servlet.DynamoHttpServletRequest dynamoRequest = 
					atg.servlet.ServletUtil.getDynamoRequest(request);
	%>
	<dsp:getvalueof id="form80" bean="/OriginatingRequest.requestURI" idtype="java.lang.String">
		<dsp:form action="<%=form80%>" method="POST" formid="fbregister">
			<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile" value="false" />
			
			<dsp:input bean="ProfileFormHandler.createNewUser" type="hidden" value="false" />
			<dsp:input bean="ProfileFormHandler.createSuccessURL" type="hidden" value="my_profile.jsp" />
			<input type="hidden" name="first_time" value="yes" />
			<dsp:input bean="ProfileFormHandler.confirmPassword" type="hidden" value="true" />
			<dsp:input bean="ProfileFormHandler.value.member" type="hidden" value="true" />
			
			<p>
				<b><center><font face="Cambria" size="6">ATG Quick-Registration Form</font></center></b>
			</p>
			
			<table cellspacing=0 cellpadding=0 border=0>
				<tr valign=top>
					<td><font color="RED">
						<dsp:droplet name="Switch">
							<dsp:param bean="ProfileFormHandler.formError" name="value" />
							<dsp:oparam name="true">
								<span class=registrationerror>
									<span class=help>There were problems with your registration:
									</span>
									<dsp:droplet name="ProfileErrorMessageForEach">
										<dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions" />
										<dsp:oparam name="output">
										<p>
										<UL>
											<LI>
												<dsp:valueof param="message" />
											</LI>
										</UL>
										</dsp:oparam>
									</dsp:droplet>
								</span>
							</dsp:oparam>
						</dsp:droplet>
					</font></td>
				</tr>
			</table>
			
			<table style="text-align: left; width: 1000px" border="0" align="center">
				<tr>
					<td>
						<p><b>Name</b></p>
					</td>
					<td>
						<dsp:param name="fbName" bean="ProfileFormHandler.fbName" />
						<dsp:input bean="ProfileFormHandler.value.firstName" maxlength="40" size="30" type="text" paramvalue="fbName"
								required="<%=true%>" />
					</td>
				</tr>
				<tr>
					<td>
						<dsp:input bean="ProfileFormHandler.value.middleName" maxlength="40" size="10" type="hidden" value="n/a" />
						<dsp:input bean="ProfileFormHandler.value.lastName" maxlength="40" size="15" type="hidden" value="n/a" required="<%=true%>" />
						<dsp:param name="fbEmail" bean="ProfileFormHandler.fbEmail" />
						<b>Email address</b>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.email" paramvalue="fbEmail" maxlength="30" size="30" type="text"
							readonly="true" />
					</td>
				</tr>
				<!-- Daytime telephone --> 
				<dsp:input bean="ProfileFormHandler.value.daytimeTelephoneNumber" maxlength="20" size="20" type="hidden" value="n/a" />
				<dsp:input bean="ProfileFormHandler.value.shippingAddress.country" value="n/a" maxlength="10" size="10" type="hidden"
							required="<%=true%>" />
				<dsp:input bean="ProfileFormHandler.value.shippingAddress.postalCode" value="n/a" maxlength="10" size="10" type="hidden" />
				<dsp:input type="hidden" bean="ProfileFormHandler.value.billingAddress.state" value="n/a" />
				<dsp:input bean="ProfileFormHandler.value.shippingAddress.city" maxlength="30" value="n/a" size="20" type="hidden" />
				<dsp:input bean="ProfileFormHandler.value.shippingAddress.ownerId" beanvalue="Profile.id" type="hidden" />
				<dsp:input bean="ProfileFormHandler.value.shippingAddress.address1" maxlength="30" size="40" value="n/a" type="hidden" />
				<dsp:input bean="ProfileFormHandler.value.shippingAddress.address2" maxlength="30" size="40" value="n/a" type="hidden" />
				
				<dsp:input bean="ProfileFormHandler.shipToBillingAddress" type="radio" checked="<%=true%>" value="true"
							style="display:none;" />
				<dsp:input bean="ProfileFormHandler.shipToBillingAddress" type="radio" checked="<%=false%>" value="false"
							style="display:none;" />
				<dsp:input bean="ProfileFormHandler.value.billingAddress.phoneNumber" maxlength="15" size="15" value="n/a" type="hidden" />
				<dsp:input bean="ProfileFormHandler.value.billingAddress.country" maxlength="10" size="10" value="n/a" type="hidden"
							required="<%=true%>" />
				<dsp:input bean="ProfileFormHandler.value.billingAddress.postalCode" maxlength="10" value="n/a" size="10" type="hidden"
							required="<%=true%>" />
				<dsp:input type="hidden" value="n/a" bean="ProfileFormHandler.value.billingAddress.state" />
				<dsp:input bean="ProfileFormHandler.value.billingAddress.city" maxlength="30" size="20" type="hidden" value="n/a"
							required="<%=true%>" />
				<dsp:input bean="ProfileFormHandler.value.billingAddress.ownerId" beanvalue="Profile.id" type="hidden" />
				<dsp:input bean="ProfileFormHandler.value.billingAddress.address1"maxlength="30" size="40" type="hidden" value="n/a"
							required="<%=true%>" />
				<dsp:input bean="ProfileFormHandler.value.billingAddress.address2" maxlength="30" size="40" type="hidden" value="n/a" />
				
				<dsp:param name="fbGender" bean="ProfileFormHandler.fbGender" />
				<dsp:param name="fbDOB" bean="ProfileFormHandler.fbDOB" />
						
				<tr valign=top>
				<!-- 4. Username/password: -->
					<td align="left" colspan="2" class=box-top-profile>
						<p>Please create ATG online store user credentials. Log in with this username and password to manage your account
							information.
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p><b>Username</b></p>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.login" value="Please provide an username" maxlength="20" size="30"
								type="text" />
					</td>
				</tr>
				<tr>
					<td>
						<p><b>Password</b></p>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.password" value="" maxlength="35" size="30" type="password" />
					</td>
				</tr>
				<tr>
					<td>
						<b>Confirm Password</b>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.confirmPassword" value=""
								maxlength="35" size="30" type="password" />
					</td>
				</tr>
				<tr>
					<td align="left" colspan="2" class=box-top-profile>&nbsp;
						The following details are optional
					</td>
				</tr>
				<tr>
					<td>
						<p><b>Gender </b>
					</td>
					<td>
						<dsp:select bean="ProfileFormHandler.value.gender">
							<dsp:droplet name="Compare">
								<dsp:param name="obj1" param="fbGender" />
								<dsp:param name="obj2" value="male" />
								<dsp:oparam name="equal">
									<dsp:option value="male" selected="true" />Male
									<dsp:option value="female" />Female
								</dsp:oparam>
								<dsp:oparam name="default">
									<dsp:option value="male" />Male
									<dsp:option value="female" selected="true" />Female
								</dsp:oparam>
							</dsp:droplet>
						</dsp:select>
					</td>
				</tr>
				<tr>
					<td>
						<p><b>Height </b>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.height" value="n/a" maxlength="10" size="30" type="text" />
					</td>
				</tr>
				<tr>
					<td>
						<p><b>Weight </b>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.weight" value="n/a" maxlength="10" size="30" type="text" />
					</td>						
				</tr>
				<tr>
					<td>
						<p><b>Hobbies </b>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.hobbies" value="n/a" maxlength="10" size="30" type="text" />
					</td>
				</tr>
				<tr>
					<td>
						<P><b>Your Birthday(MM/DD/YYYY) </b>
					</td>
					<td>
						<dsp:input bean="ProfileFormHandler.value.dateOfBirth" paramvalue="fbDOB" date="M/d/yyyy" maxlength="10" size="30"
							type="text" />
					</td>
				</tr>
				<tr>
					<td>
						<b>Would you like to receive E mail ? </b>
					</td>
					<td>
						<dsp:select bean="ProfileFormHandler.value.receiveEmail">
							<dsp:option value="yes" />yes
							<dsp:option value="no" />no
						</dsp:select>
					</td>
				</tr>
				<tr valign=top>
					<!-- 6. Submit: -->
					<td width=30%>
					</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<td align="center" colspan="2" class=box-top-profile>
					<p><!-- Submit form to handleCreate() handler --> 
						<dsp:input bean="ProfileFormHandler.create" type="submit" value="   Register   " />
					</p>
					</td>
				</tr>
			</table>
		</dsp:form>
	</dsp:getvalueof>
	</body>
	</html>
	<div style="text-align: center"><font>Powered By TCS&copy;
	</font><br />
	<img src="../logo.jpeg" style="position: relative; left:0px; top: 20px" height="100"
		width="100" /></div>
</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/user/register.jsp#1 $$Change: 508164 $--%>
