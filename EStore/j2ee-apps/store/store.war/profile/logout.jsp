<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:importbean bean="/atg/userprofiling/Profile" />
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
<dsp:page>
	<dsp:form>
		<!--<dsp:input bean="ProfileFormHandler.logoutSuccessURL" type="hidden"
			value="../index.jsp" />
		<dsp:input type="submit" bean="ProfileFormHandler.logout"
			value="Logout"></dsp:input>
		-->
		<dsp:input type="hidden" bean="ProfileFormHandler.logoutSuccessURL"
			value="../index.jsp"></dsp:input>
		<dsp:a href="/store/index.jsp" bean="ProfileFormHandler.logout" value="logout">Logout</dsp:a>
	</dsp:form>
</dsp:page>


