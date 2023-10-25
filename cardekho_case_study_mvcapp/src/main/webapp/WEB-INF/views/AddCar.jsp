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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
       
       * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
    
body {
   
    font-family: 'Poppins', sans-serif;
    max-height: 100vh;
    /* background-color: #E4E7EC; */
   
}

.log-in {
    display: flex;
   
    background-image: linear-gradient(to right ,rgb(95,163,219),rgb(151, 48, 160));
    width: 650px;
    height: 400px;
    margin: auto;
    margin-top: 50px;
    align-items: center;
    border-radius: 10px;
   
    
}

.log-in h2 {
   
    width: fit-content;
    margin: 15px auto;
    font-size: 30px;
    -webkit-text-fill-color: transparent;
    -webkit-background-clip:text;
    background-image: linear-gradient(to right ,rgb(95,163,219),rgb(151, 48, 160));
    margin-bottom: 0.5rem;
    
}

.content {
    padding: 0rem 2rem;
    background-color:white;
    width: 617px;
    height: 300px;
    margin: auto;  
}

.user-box {
    display: inline-block;
    position: relative;
    width:250px;
    margin-left: 15px;
}

.user-you{
   display: flex;
   font-size: small;
    position: relative;
    width:517px;
    margin-left: 15px;
}
    


 .input {
    width: 100%;
    padding: 10px 0;
    font-size: 15px;
    margin-bottom: 10px;
    border: none;
    border-bottom: 2px solid rgb(209, 200, 189);
    outline: none;
    background: transparent;
}

 #label {
    position: absolute;
    top: 0;
    left: 0;
    padding: 15px 0;
    font-size: 12px;
    color: #242425;
    pointer-events: none;
    transition: .5s;
}

 .input:focus~#label,
 .input:valid~#label
{
    top: -20px;
    left: 0;
    color: #1e66a8;
}
#sub:hover{
    border-color: unset;
}
  .input:hover{
    border-color:#1e66a8 ; 
}

.content #sub{
    text-decoration: none;
    color: #fff;
    background-image: linear-gradient(to right ,rgb(95,163,219),rgb(151, 48, 160));
    width: 100px;
    display: block;
    text-align: center;
    padding: 0.57rem 0rem;
    margin: 30px 0 0 15px;
    font-size: .75rem;

}   
#outtab{
color: white;
margin: 20px 0px;
}
#data {
	color:white;
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
		height: 10px;
		width: 100%;
		margin-top:20px;
		margin-bottom: 20px; 
}
.fType{
    margin-left: 10px;
    margin-right: 5px
}
    
</style>
</head>
<body>
    <section class="log-in">
        <div class="content">
            <h2>Add Car Details</h2>
            <form action="./add" method="post">
                <div class="user-box">
                    <input required="true" name="carName" type="text" class="input">
                    <label id="label"> CarName</label>
                </div>
                <div class="user-box">
                  <input list="carbrand" name="brandName" type="text" required="true" class="input">
       		       <datalist id="carbrand">
    			     <option value="Tata">
  		     	     <option value="Kia">
   		     	     <option value="Maruti Suzuki">
  			         <option value="Mahindra">
			         <option value="Hyundai">
			         <option value="Skoda">
			         <option value="Ford">
	        		 <option value="Toyota">
			         <option value="Mercedes-Benz ">
        			 <option value="BMW">            
		        </datalist>
                    <label id="label"> BrandName</label>
                </div>

                <div class="user-box">
					<input required="true" name="model" type="text" class="input">
                    <label id="label">Model</label>

                </div>
                <div class="user-box">
                    
					<input required="true" name="price" type="text" class="input">
                    <label id="label">Price</label>
                </div>
                <div class="user-you">
					<label >Fual Type : </label>
                    <input type="radio" id="ev" name="fuelType" value="EV" required="true" class="fType">
                    <label for="ev">EV</label>
                    <input type="radio" id="petrol" name="fuelType" value="Petrol" required="true" class="fType">
                    <label for="petrol">Petrol</label>
                    <input type="radio" id="javascript" name="fuelType" value="Disel" required="true" class="fType">
                    <label for="javascript">Disel</label>
                </div>
                <input type="submit" value="ADD CAR" id="sub" class="input">
            </form>
        </div> 
    </section>
   
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
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap');
</style>
</html>