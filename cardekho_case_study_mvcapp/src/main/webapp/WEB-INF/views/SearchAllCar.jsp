
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jspider.cardekho_case_study_mvcapp.pojo.CarPOJO"%>
<%@page import="java.util.List"%>    
     <%
	List<CarPOJO> cars= (List<CarPOJO>)request.getAttribute("cars") ;
   String msg=(String) request.getAttribute("msg");
   %>
   <jsp:include page="SearchCar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#blank{
		height: 10px;
		width: 100%;
		margin-top:20px;
		margin-bottom: 20px; 
}
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
	color:black;
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
#blank{
margin-top: 50px;
}


</style>
</head>
<body>
<div align="center">
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