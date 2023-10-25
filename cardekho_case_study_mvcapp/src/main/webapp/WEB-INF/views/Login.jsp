<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 *{
        box-sizing: border-box;
        margin: 0px;
     
    }
   
form {
	margin-top: 10px;
}

form table {
	margin: auto;
	width: 100%;
}
body {
	background-color: #757e8f;
}

tr {
	text-align: center;
}

#data {
	background-color: white;
	width: 100%;
    border-collapse: collapse;
	
}

#data td {
	border: 1px solid black;
	text-align: center;
}
#data th {
    border: 1px solid black;
}


fieldset table {
	margin: auto;
	text-align: left;
}
input {
    border-radius: 10px;

}

fieldset {
    border-radius: 20px;
	margin: 15px 520px;
	text-align: center;
    box-shadow: 10px 20px 100px rgb(2, 29, 51);
    background-color: rgb(72, 125, 185);
}

legend {
	color: rgb(230, 220, 220);
	background-color:black;
   
}
a{
    background-color: rebeccapurple;
    padding: 5px 10px;
    color: wheat;
    text-decoration: none;
    border-radius: 10px;
    font-size: 1.3rem;
   
}
#creat{
    margin-top: 30px;
}

h4{
		font-size: 1.8rem;
		color:red;
}



</style>
</head>
<body>

	<div align="center">
	<%
		if (msg != null) {
		%>
		<h4>
			<%=msg%>
		</h4>
		<%
		}
		%>
		<fieldset>
			<legend>Login Page</legend>
			<form action="./login" method="post">
				<table>
					<tr>
						<td>Username</td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<a href="http://localhost:8080/cardekho_case_study_mvcapp/forgotpassword"  style="background-color:rgb(163, 145, 65); text-decoration:none; 
				color: black; padding:0px 5px ; border-radius: 5px; font-size:1.1rem;">Forgot Password</a>
				<input type="submit" value="LOGIN" style="background-color: rgb(163, 145, 65); color: black; font-size: medium; font-weight:500px;">
			</form>

		</fieldset>
		
		<div id="creat"><a href="http://localhost:8080/cardekho_case_study_mvcapp/createAccount">Create
			Account</a></div>
	</div>

</body>
</html>