 <html> 
   <head> 
     <title>Successfully Logged In </title> 
   </head> 
   <body> 
   
   <script> 
   
     function displayUser(user) {
         
       var userName = document.getElementById('userName');
       var greetingText = document.createTextNode('Hello '+user.name+ ' Your User Id =,'+ user.id+ ' And Email Id =,'+ user.email+ ' And Birth Day =,'+ user.birthday );
       document.getElementById("name").innerHTML=user.name;
        document.getElementById("email").innerHTML=user.email;
   	   userName.appendChild(greetingText);
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
   </script> 
   jsonobject Name:<p id="name">
   jsonobject E-mail:<p id="email">
   
   <p id="userName"></p> 
   </body> 
  </html>
