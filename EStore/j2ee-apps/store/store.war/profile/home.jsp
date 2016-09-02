<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:a href="/store/store/cart.jsp" >Cart( <dsp:valueof bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount"></dsp:valueof> )</dsp:a>
&nbsp<dsp:a href="/store/profile/my_profile.jsp" >Profile</dsp:a><br>
<dsp:page>
<dsp:include page="../profile/logout.jsp"/>

<hr size=0>
<br><br>Product Info<br> 
	      ==============
	      <br>
	      <table>	
		    <tr align=left > 		     
		      <td ><b>Product Name</td>
		      <td><b>Qty</td>
		      <td><b>Price</b></td>
		      <td><b>Action</td>
		    </tr>
	    	<dsp:include page="../store/product_display.jsp">
	    	<dsp:param name="prdId" value="prod210005"/></dsp:include>
	    	   	<dsp:include page="../store/product_display.jsp">
	    	<dsp:param name="prdId" value="prod200005"/></dsp:include>
	    	 
	    	<!--<dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod20002"/></dsp:include>
	    	<dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod100003"/></dsp:include>
	    	<dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod100004"/></dsp:include>   
	--></table>
</dsp:page>