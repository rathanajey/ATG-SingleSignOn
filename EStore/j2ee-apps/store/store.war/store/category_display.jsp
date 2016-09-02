<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:a href="/store/store/cart.jsp" >Cart( <dsp:valueof bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount"></dsp:valueof> )</dsp:a>
&nbsp<dsp:a href="/store/profile/my_profile.jsp" >Profile</dsp:a><br>

<hr size=0>
<br><br>Category Info<br> 
	      ==============
	      <br>
	      <dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod10003"/></dsp:include>   
	      <!--  <table>	
		    <tr align=left > 		     
		      <td ><b>Product Name</td>
		      <td><b>Qty</td>
		      <td><b>Price</b></td>
		      <td><b>Action</td>
		    </tr>
	    	<dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod10003"/></dsp:include>   
	    	<dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod100002"/></dsp:include>
	    	<dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod100003"/></dsp:include>
	    	<dsp:include page="../store/product_display.jsp"><dsp:param name="prdId" value="prod100004"/></dsp:include>   
		</table>	-->