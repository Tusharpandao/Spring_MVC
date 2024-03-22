<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <% String msg = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Login page</title>
    <style type="text/css">
      @import "https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css";
      @import "https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Material+Icons";

      * {
        box-sizing: border-box;
        margin: 0px;
      }
      .main {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20vh;
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
        background-color: black;
      }
      a {
        background-color: rebeccapurple;
        padding: 5px 10px;
        color: wheat;
        text-decoration: none;
        border-radius: 10px;
        font-size: 1.3rem;
      }
      #creat {
        margin-top: 30px;
      }

      h4 {
        color: red;
        font-size: x-large;
      }
      .password-container {
        position: relative;
      }

      #show-password-button {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="main">
      <% if (msg != null) { %>
      <h4><%=msg%></h4>
      <% } %>
      <fieldset>
        <legend>Login Page</legend>
        <form action="./login" method="post">
          <table>
            <tr>
              <td>Username</td>
              <td><input type="text" name="username" /></td>
            </tr>
            <tr>
              <td>Password</td>

              <td>
                <div class="password-container">
                  <input type="password" name="password" id="password" />
                  <i class="bi bi-eye-slash" id="show-password-button"></i>
                </div>
              </td>
            </tr>
          </table>
          <input
            type="submit"
            value="LOGIN"
            style="
              background-color: rgb(163, 145, 65);
              color: black;
              font-size: medium;
              font-weight: 500px;
            "
          />
        </form>
      </fieldset>

      <div id="creat">
        <a
          href="http://localhost:8080/students_database_management_app/createAccount"
          >Create Account</a
        >
      </div>
    </div>
  </body>
  <script>
    // const passwordInput = document.querySelector('input[name="password"]');
    const passwordInput = document.querySelector("#password");
    const strengthIndicator = document.querySelector("#strength-indicator");

    // Regex pattern for a strong password
    const strongPasswordRegex =
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/;

    // Validate the password strength on change
    passwordInput.addEventListener("change", function () {
      const password = this.value;

      // Check if the password matches the regex pattern
      if (strongPasswordRegex.test(password)) {
        strengthIndicator.classList.add("strong");
        strengthIndicator.textContent = "Strong password";
      } else {
        strengthIndicator.classList.remove("strong");
        strengthIndicator.textContent = "Weak password";
      }
    });

    const form = document.querySelector("form");
    const submitButton = document.querySelector('input[type="submit"]');

    form.addEventListener("submit", function (event) {
      const password = passwordInput.value;

      // Check if the password is strong
      if (!strongPasswordRegex.test(password)) {
        // Prevent the form from submitting
        event.preventDefault();

        // Show an error message
        alert(
          "A strong password must contain at least one lowercase letter, one uppercase letter,"+
          "one number, and one special character, and it must be at least 8 characters long."
        );
      }
    });

    // const passwordInput = document.querySelector('#password');
    const showPasswordButton = document.querySelector("#show-password-button");

    showPasswordButton.addEventListener("click", function () {
      if (passwordInput.type === "password") {
        passwordInput.type = "text";
        showPasswordButton.classList.add("fa-eye-slash");
      } else {
        passwordInput.type = "password";
        showPasswordButton.classList.remove("fa-eye-slash");
      }
    });
  </script>
</html>
