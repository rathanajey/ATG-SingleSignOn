package com.eStore;

import java.io.IOException;
import java.util.Dictionary;

import javax.servlet.ServletException;



import atg.commerce.profile.CommerceProfileFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.userprofiling.Profile;
import atg.userprofiling.ProfileRequestServlet;
import atg.userprofiling.ProfileTools;
import atg.dtm.TransactionDemarcation;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.transaction.TransactionManager;

import atg.beans.DynamicBeans;
import atg.beans.PropertyNotFoundException;
import atg.core.util.StringUtils;
import atg.droplet.DropletException;
import atg.droplet.DropletFormException;
import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.repository.ItemDescriptorImpl;
import atg.repository.MutableRepository;
import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryItemDescriptor;
import atg.security.IdentityManager;
import atg.security.SecurityException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.RequestLocale;
import atg.userprofiling.PropertyManager;
public
class eStoreProfileFormHandler
extends CommerceProfileFormHandler
{
	@Override
	public boolean handleLogin(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		logDebug("Im in Bro");
		return super.handleLogin(request, response);
	}
	  public void preCreateUser(DynamoHttpServletRequest pRequest,
              DynamoHttpServletResponse pResponse)
throws ServletException, IOException
{
		 logInfo("Beginning of preCreate user");
		  	String firstName = (String) getValueProperty("firstName");
		    String middleName = (String) getValueProperty("middleName");
		    String lastName = (String) getValueProperty("lastName");

		    // Extract the billingAddress and shippingAddress, as dictionary objects,
		    // from the values dictionary.
		    Dictionary billingAddress = (Dictionary) getValueProperty("billingAddress");
		    Dictionary shippingAddress = (Dictionary) getValueProperty("shippingAddress");

		    // Copy all three names to billing & shipping addresses
		    if (billingAddress != null) {
		      billingAddress.put("firstName", firstName);
		      billingAddress.put("middleName", middleName);
		      billingAddress.put("lastName", lastName);
		    }

		    if (shippingAddress != null) {
		      shippingAddress.put("firstName", firstName);
		      shippingAddress.put("middleName", middleName);
		      shippingAddress.put("lastName", lastName);
		    }
		    
		    logInfo("End of preCreate user");
		   
}

	  protected void preLoginUser(DynamoHttpServletRequest pRequest,
              DynamoHttpServletResponse pResponse) 
throws ServletException, IOException
{
// if the there's already a user logged in, see if this is the same user
Profile profile = getProfile();

// also make sure that we're not using persistent anonymous profiles.
// in that case, assume that we have a transient profile, since we
// can't actually tell.
ProfileRequestServlet prs = (ProfileRequestServlet) pRequest.resolveName("/atg/userprofiling/ProfileRequestServlet", false);

if (!profile.isTransient() && prs != null && ! prs.isPersistentAnonymousProfiles()) {
ProfileTools prTools = getProfileTools();
PropertyManager pmgr = prTools.getPropertyManager();
// get the submitted form's login/pwd and hash the pwd
String loginPropertyName = pmgr.getLoginPropertyName();
System.out.println(loginPropertyName);
String login = getStringValueProperty(loginPropertyName);
System.out.println(login);
if(login != null)
login = login.trim();
System.out.println(login);
String pwdPropertyName = pmgr.getPasswordPropertyName();
System.out.println(pwdPropertyName);
String pwd = getStringValueProperty(pwdPropertyName);
System.out.println(pwd);
if (pwd != null)
pwd = pwd.trim();
System.out.println(pwd);
Object prLoginObj = profile.getPropertyValue(loginPropertyName);
String prLogin = null;
if (prLoginObj != null)
prLogin = prLoginObj.toString();
System.out.println(prLogin);
boolean authSuccessful;
IdentityManager identityManager = mUserLoginManager.getIdentityManager(pRequest);
try {
authSuccessful = identityManager.checkAuthenticationByPassword(login, pwd);
}
catch (SecurityException e) {
authSuccessful = false;
}

if (authSuccessful && login.equals(prLogin)) {
boolean addError = true;
// user matches, check the security status,
// if there's a security status property
if (prTools.isEnableSecurityStatus()){
int securityStatus = -1;
String securityStatusPropertyName = pmgr.getSecurityStatusPropertyName();
Object ss = profile.getPropertyValue(securityStatusPropertyName);
if (ss != null){
securityStatus = ((Integer)ss).intValue();
}

// See if the user is auto-logged in. If so, this could indicate
// that this form is re-authenticating the user for
// access to sensitive content
addError =
!getProfileTools().isAutoLoginSecurityStatus(securityStatus);
// try to reset to securityLogin if it's not set already

}
}
}
}
}
// Only do this if the user is not auto-logged in


