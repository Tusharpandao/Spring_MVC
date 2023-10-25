<%@page import="com.jspider.cardekho_case_study_mvcapp.pojo.CarPOJO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <jsp:include page="Navigation.jsp"/>
   <%
	List<CarPOJO> cars= (List<CarPOJO>)request.getAttribute("cars") ;
   String msg=(String) request.getAttribute("msg");
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
#blank{
		height: 10px;
		width: 100%;
		margin-top:20px;
		margin-bottom: 20px; 
}

</style>
</head>
<body>
		<div align="center">
		<fieldset>
			<legend>Remove Car Details</legend>
			<form action="./remove" method="post">
				<table>
					<tr>
						<td>Enter ID</td>
						<td><input type="text" name="id"></td>
					</tr>
				</table>
				<input type="submit" value="REMOVE" style="background-color: rgb(163, 145, 65); color: black; font-size: medium; font-weight:500px;">
			</form>
		</fieldset>
		
    <%
    if(msg != null){
    %>
    <h2 ><%=msg %> </h2>
    <%} %>
    
    <%if(cars != null){ %>
     <div id="outtab">
    <table id="data">
    	<tr>
    		<th>ID</th>
    		<th>CAR NAME</th>
    		<th>BRAND NAME</th>
    		<th>MODEL</th>
    		<th>FUEL TYPE</th>
    		<th>PRICE</th>
    	</tr>
    	<% for(CarPOJO pojo : cars){ %>
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
    <%} %>
      </div>
      
      <div id="blank"></div>


</body>
</html>