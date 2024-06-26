<%@page import="com.jspiders.students_database_management_app.pojo.StudentPOJO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<StudentPOJO> students = (List<StudentPOJO>) request.getAttribute("students");
String msg = (String) request.getAttribute("msg");
%>
<jsp:include page="NavBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 
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
			<legend>Add Student Details</legend>
			<form action="./add" method="post">
				<table>
					<tr>
						<td>Name</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td>Contact</td>
						<td><input type="text" name="contact"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input type="text" name="address"></td>
					</tr>
				</table>
					<input type="submit" value="ADD" style="background-color: rgb(163, 145, 65); color: black; font-size: medium; font-weight:500px;">
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
		if (students != null) {
		%>
		<table id="data">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>CONTACT</th>
				<th>ADDRESS</th>
			</tr>
			<%
			for (StudentPOJO pojo : students) {
			%>
			<tr>
				<td><%=pojo.getId()%></td>
				<td><%=pojo.getName()%></td>
				<td><%=pojo.getEmail()%></td>
				<td><%=pojo.getContact()%></td>
				<td><%=pojo.getAddress()%></td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>
	</div>
</body>
<script>

    // Validate the contact number
function validateContactNumber(contactNumber) {
  const regex = /^[0-9]{10}$/;
  return regex.test(contactNumber);
}

// Validate the email ID
function validateEmailId(emailId) {
  const regex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
  return regex.test(emailId);
}

// Display an alert for the contact number
function showContactNumberAlert() {
  alert('Please enter a valid contact number.');
}

// Display an alert for the email ID
function showEmailIdAlert() {
  alert('Please enter a valid email ID.');
}

// Add the validation to the form submit button
const form = document.querySelector('form');
const submitButton = document.querySelector('input[type="submit"]');

submitButton.addEventListener('click', function(event) {
  const contactNumber = form.querySelector('input[name="contact"]').value;
  const emailId = form.querySelector('input[name="email"]').value;

  // Validate the contact number and email ID
  const contactNumberIsValid = validateContactNumber(contactNumber);
  const emailIdIsValid = validateEmailId(emailId);

  // Display an alert for the contact number if it is invalid
  if (!contactNumberIsValid) {
    showContactNumberAlert();
  }

  // Display an alert for the email ID if it is invalid
  if (!emailIdIsValid) {
    showEmailIdAlert();
  }

  // If both the contact number and email ID are valid, submit the form
  if (contactNumberIsValid && emailIdIsValid) {
    form.submit();
  }
});

submitButton.addEventListener('click', function(event) {
	  const contactNumber = form.querySelector('input[name="contact"]').value;
	  const emailId = form.querySelector('input[name="email"]').value;

	  // Validate the contact number and email ID
	  const contactNumberIsValid = validateContactNumber(contactNumber);
	  const emailIdIsValid = validateEmailId(emailId);

	  // Prevent the form from submitting if the contact number and email ID are not valid
	  if (!contactNumberIsValid || !emailIdIsValid) {
	    event.preventDefault();
	    window.scrollTo(0, 0);
	  }

	  // If both the contact number and email ID are valid, submit the form
	  if (contactNumberIsValid && emailIdIsValid) {
	    form.submit();
	  }
	});

</script>	
</html>