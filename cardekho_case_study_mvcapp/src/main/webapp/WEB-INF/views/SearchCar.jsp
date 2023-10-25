<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>    
    <jsp:include page="Navigation.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 #div{
        display: flex;
        justify-content: center;
       }
   
       li{
        display: inline-block;
        
       }
       li .anc{
        display: block;
        background-color: #546e65;
        color: white;
	    margin: 5px;
	    padding: 15px;
        border-radius: 10px;
        font-size: 1.2rem;
        text-decoration: none;
       }
       li .anc:hover {
	background-color: #833c3c91;
}
</style>
</head>
<body>
 <div id=div>
    <ul>
        <li><a class="anc" href="./carId">Car Id</a></li>
        <li><a class="anc" href="./carName">Car Name</a></li>
        <li><a class="anc" href="./carBrand">Car Brand</a></li>
        <li><a class="anc" href="./fuelType">Fuel Type</a></li>
        <li><a class="anc" href="./searchAllCar">Search All Car</a></li>
    </ul>

</div>


</body>
</html>