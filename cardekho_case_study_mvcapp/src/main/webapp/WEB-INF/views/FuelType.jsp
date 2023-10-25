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
	 width: fit-content;
	margin: 15px auto;
	text-align: center;
    box-shadow: 10px 20px 100px rgb(2, 29, 51);
    background-color: rgb(72, 125, 185);
}

legend {
	color: rgb(230, 220, 220);
	background-color:black;
   
}
#blank{
margin-top: 50px;
}
.fType{
    margin-left: 10px;
    margin-right: 5px
}

</style>
</head>
<body>
	
<div align="center">
		<div>
		<fieldset>
			<legend>Search Car Details By FuelType</legend>
			<form action="./fuelType" method="post">
				<label >Fual Type : </label>
                    <input type="radio" id="ev" name="fuelType" value="EV" required="true" class="fType">
                    <label for="ev">EV</label>
                    <input type="radio" id="petrol" name="fuelType" value="Petrol" required="true" class="fType">
                    <label for="petrol">Petrol</label>
                    <input type="radio" id="javascript" name="fuelType" value="Disel" required="true" class="fType">
                    <label for="javascript">Disel</label><br>
				<input type="submit" value="SEARCH" style="background-color: rgb(163, 145, 65); color: black; font-size: medium; font-weight:500px; margin-top: 10px;">
			</form>
		</fieldset>
		</div><br>
	<%
    if(msg != null){
    %>
    <h1><%=msg %> </h1> <br>
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