<%@page import="com.jspider.cardekho_case_study_mvcapp.pojo.CarPOJO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="Navigation.jsp"></jsp:include>
    <%
    List<CarPOJO>cars=(List<CarPOJO>) request.getAttribute("cars");
    CarPOJO pojo=(CarPOJO) request.getAttribute("car");
    String msg=(String)request.getAttribute("msg");
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
</head>
<body>
<div align="center">
		<%
		if (pojo == null) {
		%>
		<fieldset>
			<legend>Select Id to Update Car Details</legend>
			<form action="./update" method="post">
				<table>
					<tr>
						<td>Enter ID</td>
						<td><input type="text" name="id"></td>
					</tr>
				</table>
				<input type="submit" value="SELECT">
			</form>
		</fieldset>
		<%
		if (msg != null) {
		%>
		<h3><%=msg%></h3>
		<%}	%>
		
		
		<% if( cars != null) {%>
		<table id="data">
		<tr>
    		<th>ID</th>
    		<th>CAR NAME</th>
    		<th>BRAND NAME</th>
    		<th>MODEL</th>
    		<th>FUEL TYPE</th>
    		<th>PRICE</th>
    	</tr>
    	<% for(CarPOJO car : cars){ %>
    	<tr>
    		<td> <%=car.getId()%></td>
    		<td> <%=car.getCarName()  %></td>
    		<td> <%= car.getBrandName() %></td>
    		<td> <%=car.getModel()  %></td>
    		<td> <%=car.getFuelType()  %></td>
    		<td> <%=car.getPrice()  %></td>
    	</tr>
    	
    	<%} %>
    </table>
    <%} }else{%>
    <fieldset>
    <legend>Update Car Details</legend>
    	<form action="./updateCar" method="post">
    	<table>
    	<tr>
    		<td>ID</td>
    		<td><%= pojo.getId() %></td>
    		<td><input type="text" name="id" value="<%=pojo.getId()%>" hidden="true"></td>
    	</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name="carName"value="<%=pojo.getCarName()%>"></td>
		</tr>
		<tr>
			<td>Brand Name</td>
			<td><input type="text" name="brandName"value="<%=pojo.getBrandName()%>"></td>
		</tr>
		
		<tr>
			<td>Model</td>
			<td><input type="text" name="model"value="<%=pojo.getModel()%>"></td>
		</tr>
		<tr>
			<td>FUEL TYPE</td>
			<td><input type="text" name="fuelType"value="<%=pojo.getFuelType()%>"></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type="text" name="price"value="<%=pojo.getPrice()%>"></td>
		</tr>
    	</table>
    	<input type="submit" value="UPDATE">
    	</form>
    </fieldset>

    <% }%>
		</div>


</body>
</html>