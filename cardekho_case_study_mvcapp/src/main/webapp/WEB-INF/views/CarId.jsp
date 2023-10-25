<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jspider.cardekho_case_study_mvcapp.pojo.CarPOJO"%>
<%@page import="java.util.List"%>    
     <%
	CarPOJO pojo= (CarPOJO)request.getAttribute("car");
   String msg=(String) request.getAttribute("msg");
   %>
    
 <jsp:include page="SearchCar.jsp"/>
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
	background-color: #a2d8b2;
}

tr {
	text-align: center;
}

#data {
	background-color: transparent;
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
    border-radius: 5px;

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
</head>
<body>

<div align="center">
		<fieldset>
			<legend>Search Car Details</legend>
			<form action="./carId" method="post">
				<table id="main">
					<tr>
						<td>Enter ID</td>
						<td><input type="text" name="id"></td>
					</tr>
				</table>
				<input type="submit" value="SEARCH" style="background-color: rgb(163, 145, 65); color: black; font-size: medium; font-weight:500px;">
			</form>
		</fieldset>
	<%
		if (msg != null) {
		%>
		<h3><%=msg%>
		</h3>
		<%
		}
		%>
		<%
		if (pojo != null) {
		%>
		<table id="data"  >
		<tr>
    		<th>ID</th>
    		<th>CAR NAME</th>
    		<th>BRAND NAME</th>
    		<th>MODEL</th>
    		<th>FUEL TYPE</th>
    		<th>PRICE</th>
    	</tr>
    	<tr>
    		<td> <%=pojo.getId()%></td>
    		<td> <%=pojo.getCarName()  %></td>
    		<td> <%= pojo.getBrandName() %></td>
    		<td> <%=pojo.getModel()  %></td>
    		<td> <%=pojo.getFuelType()  %></td>
    		<td> <%=pojo.getPrice()  %></td>
    	</tr>
    	<%} %>
		
		</table>
	
	
	</div>	


</body>
</html>