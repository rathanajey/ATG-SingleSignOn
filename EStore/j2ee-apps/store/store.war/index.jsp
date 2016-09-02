<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ page import="atg.servlet.*" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/Configuration"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
<head><title>E store </title>
</head>
<body>
  <div style="background-color:#556B2F;text-align:center;height:100%""> 
<script> 
function bigImg(x)
{
x.src="images/facebook-login-button.png"
}

function normalImg(x)
{
x.src="images/facebook-login-button.png"
}

   var appID = "200781330021580";
   function faceBookLogin(){
     if (window.location.hash.length == 0) {
         
			var path = 'http://www.facebook.com/dialog/oauth/?scope=email,user_birthday&';
			var queryParams = ['client_id=' + appID, 'redirect_uri=http://localhost:8080/store/fbcontroller.jsp',
			  'response_type=token'];
			var query = queryParams.join('&');
			var url = path + query;
			window.open(url,'FaceBook Login','width=900,height=400');
     }
   }
</script>
<!--  REDIRECTING TO HOME PAGE INCASE USER LOGGED IN  -->
	<dsp:droplet name="/atg/dynamo/droplet/Switch">
    <dsp:param bean="Profile.transient" name="value"/>
    <dsp:oparam name="false">
        <dsp:droplet name="/atg/dynamo/droplet/Redirect">
          <dsp:param value="profile/my_profile.jsp" name="url"/>
        </dsp:droplet>
    </dsp:oparam>
    </dsp:droplet>
    
 
<font color="#FFD700" face="cursive"><h1>Welcome to Online Store !</h1></font>

<br>
<hr color=#DAA520 />
<font color="RED">
 			<dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="ProfileFormHandler.formError" name="value"/>
              <dsp:oparam name="true">
                <span class=registrationerror>
                  <span class=help>Login Error !:</span><p>
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

<dsp:form action="profile/my_profile.jsp" method="post">
<marquee style="background-color:white;width:400">
<img src="pro1.jpeg" />
<img src="pro2.jpeg" />
<img src="pro3.jpeg" />
<img src="pro4.jpeg" />
</marquee>

<dsp:input type="hidden" bean="ProfileFormHandler.loginThrough" id="loginThrough" value="FB"/>		
<dsp:input type="hidden" bean="ProfileFormHandler.fbEmail" id="registrationEmail" />
<dsp:input type="hidden" bean="ProfileFormHandler.fbName" id="registrationName" />
<dsp:input type="hidden" bean="ProfileFormHandler.fbGender" id="registrationGender" />
<dsp:input type="hidden" bean="ProfileFormHandler.fbDOB" id="registrationDOB" />
<!--<dsp:input type="hidden" bean="ProfileFormHandler.fbLikePromotion" id="likePromotion" />-->

<table border="1" align="right" style="text-align:center; background-color:#FFD700" rules="rows" width="250" BORDERCOLOR="#DAA520">
<tr><td colspan="2" align="center"><b>Already a Member ?</b></td></tr>
<tr><td align="left"><dsp:input bean="ProfileFormHandler.loginErrorURL" beanvalue="/OriginatingRequest.requestURI" type="hidden"/>
 User Name </td><td align="right" > <dsp:input id="login" bean="ProfileFormHandler.value.login" size="20" type="text"/><br></td></tr>
 <tr><td align="left">Password </td><td align="right"><dsp:input  id="user_pwd" bean="ProfileFormHandler.value.password" size="20" type="password"/><br></td></tr>
 <tr><td colspan="2">
 <dsp:input bean="ProfileFormHandler.login" type="submit" id="subButton" value="Log in" style="height: 25px; width: 240px; align: center"/>
  </td></tr>
 <tr><td colspan="2">
 <a href onclick="faceBookLogin()"><img onmouseover="bigImg(this)" onmouseout="normalImg(this)" src="images/facebook-login-button.png" style="height: 25px;width: 240px; align: center"/></a>
 </td></tr>
<tr><td colspan="2"><b>New user ?</b>
<dsp:a href="profile/register.jsp"><font >Register here </font></dsp:a></td></tr> 
</table>
</dsp:form>
<font align="center" color="#FFD700">Powered By TCS&copy; </font>
<img src="logo.jpeg" style="position:absolute;left:450px; top:450px" height="100" width="100"/>
</div>
</body>
</dsp:page>