<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #56bcdb;
}
 *{
        box-sizing: border-box;
        margin: 0px;
       
    }


ul {
	list-style-type: none;
	overflow: hidden;
	background-color: #447563;
    box-shadow: 0px 5px 50px black;
    margin-bottom: 30px;
}

li {
	float: right;
}

li a {
	display: block;
	margin: 5px;
	padding: 15px;
    border-radius: 10px;
    font-size: 1.2rem;
    text-decoration: none;

}

li #log {
    background-color: #e30b28;
}
li .a:hover {
	background-color: #643e3e91;
}
li #log:hover {
	background-color: #5c151f;
}
</style>
</head>
<body>
	<ul>
		<li><a class="a" style="color: white;" href="./logout" id="log">Logout</a></li>
		<li><a class="a" style="color: white;" href="./search">Search Student</a></li>
		<li><a class="a" style="color: white;" href="./add">Add Student</a></li>
		<li><a class="a" style="color: white;" href="./update">Update Student</a></li>
		<li><a class="a" style="color: white;" href="./remove">Remove Student</a></li>
		<li><a class="a" style="color: white;" href="./home">Home</a></li>
	</ul>

</body>
</html>