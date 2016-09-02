<html>
   <body>
   <script>
     function displayUser(user) {       
      var fbtest = document.getElementById('fbtest');
      var greetingText = document.createTextNode('Hello '+user.name+ ' Your User Id =,'+ user.id+ ' And Email Id =,'+ user.email+ ' And Birth Day =,'+ user.birthday );
       fbtest.appendChild(greetingText);
       
       window.opener.document.getElementById('login').value=user.email;//same way assign email id to some hidden varieble which will point to formhandler property
       window.opener.document.getElementById('registrationEmail').value=user.email;
       window.opener.document.getElementById('registrationName').value=user.name;
       window.opener.document.getElementById('registrationGender').value=user.gender;
       window.opener.document.getElementById('registrationDOB').value=user.birthday;
       window.opener.document.getElementById('loginThrough').value="FB";
       window.opener.document.getElementById('likePromotion').value="false";
       var checkLike=window.opener.document.getElementById('likePromotion').value;
       alert("CheckLike="+checkLike);
       if(checkLike=="true")
       {
       alert('no changes');
       }else
       {
       alert('setting value to false');
	   var checkLike=window.opener.document.getElementById('likePromotion').value=="false";
	   } 
       //window.opener.document.getElementById('user_pwd').value="itb408";
       //window.opener.document.getElementById('sub_key').click();//this will be your face book submit button
       var check=user.email;
   	   alert('outside if!!!!!');
   	   if(check == null){
   	   alert("Inside if");
   	   }
   	   else{
   	   //alert("Inside else.");
   	  window.opener.document.getElementById('subButton').click();
   	   }
   	   document.write("Testing for window in callback");
       alert("Call close");            
     }
     
    	var accessToken = window.location.hash.substring(1);
        var path = "https://graph.facebook.com/me?";
        var queryParams = [accessToken, 'callback=displayUser'];
   		var query = queryParams.join('&');
   		var url = path + query;
   		// use jsonp to call the graph
        var script = document.createElement('script');
        script.src = url; //Calling graph.facebook.com       
        document.body.appendChild(script);  
       
    function testLikeUser(user) { 
		var fbtestlike = document.getElementById('fblikes');
		var likename=user.data.length;
		var i=0;
		var greetingText=" ";
		var alertCheck="false";
		for(i=0; i<likename;i++){
     		greetingText = greetingText+' '+user.data[i].name;
 			if(user.data[i].id=="111721232174401")
				{
				//alert("Setting value to true from testLikeuser");
				var alertCheck="true";
        			window.opener.document.getElementById('likePromotion').value="true";
				}
		}
		greetingText = document.createTextNode(greetingText);
		if(alertCheck=="true")
		{
		alert("Value set to true in testLikeUser");
		}
		fbtestlike.appendChild(greetingText);    
		document.getElementById("likename").innerHTML=user.data[0].name;
		alert("Call close in testLikeUser");
		//window.close();
     }
       
       
        var accessToken = window.location.hash.substring(1);
        var path = "https://graph.facebook.com/me/likes?";
        var queryParams = [accessToken, 'callback=testLikeUser'];
   		var query = queryParams.join('&');
   		var urlfb = path + query;
   		// use jsonp to call the graph
        var scriptfb = document.createElement('script');
        scriptfb.src = urlfb; //Calling graph.facebook.com       
        document.body.appendChild(scriptfb);
        //document.write("Testing for window");
        //window.close();
            
   </script>
   
     <p id="fbtest"></p> 
     
     <p id="fblikes"></p>

	 <p id="likename"></p>
	 
   </body> 
  </html>

