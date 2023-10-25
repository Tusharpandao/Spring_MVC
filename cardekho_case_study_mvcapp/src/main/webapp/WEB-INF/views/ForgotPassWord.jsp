<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	background-color: #a2d8b2;
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


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<fieldset>
			<legend>Forgot Password</legend>
			<form action="./forgotPassword" method="post">
				<table>
					<tr>
						<td>User Name</td>
						<td><input type="text" name="username" required></td>
					</tr>
					<tr>
						<td> Mobile Number</td>
						<td> <input type="tel"   name="mobile"  pattern="[0-9]{10}" required></td>
					</tr>
					<tr>
						<td> Email</td>
						<td> <input type="Email" name="email" required></td>
					</tr>
				</table>
				<input type="submit" value="Forgot Password" style="background-color: rgb(163, 145, 65); color: black; font-size: medium; font-weight:500px;">
			</form>
		</fieldset>
	</div>

</body>
</html>
