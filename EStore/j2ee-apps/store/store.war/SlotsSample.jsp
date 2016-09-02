<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<title>Slots</title>
</head>
<body>
<dsp:droplet name="/atg/targeting/TargetingRandom">
  <dsp:param bean="/atg/registry/Slots/fb1"  name="targeter" />
  <dsp:param name="howMany" value="1" />
  <dsp:oparam name="output">
     <dsp:getvalueof id="all" param="element.URL" idtype="java.lang.String">
     <% all="/dyn/dyn"+all; %>
        <dsp:img src="<%=all %>" />
     </dsp:getvalueof>
  </dsp:oparam>
  <dsp:oparam name="empty">
    No special offers today!
  </dsp:oparam>
</dsp:droplet>
</body>
</html>