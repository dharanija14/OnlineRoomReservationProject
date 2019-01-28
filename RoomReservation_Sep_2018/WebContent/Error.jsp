<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
.top-left {
    position: absolute;
    top: 15px;
    left: 50px;
	color: red;
	font-size: 30px;
	font-weight: bold; 
}	
blink {
           color:red;
           font-size:30px;
           -webkit-animation: blink 1s step-end infinite;
           animation: blink 1s step-end infinite
         }
 @keyframes blink {
         67% { opacity: 0 }
        }

</style>
</head>
<body >
<div >
<img src="Imag/error.jpg" style="width:100%; height:620px">
  <div class="top-left"><blink>Email or Password incorrect !!! <br> Go to Login Page</blink></div>
  </div>
</body>
</html>