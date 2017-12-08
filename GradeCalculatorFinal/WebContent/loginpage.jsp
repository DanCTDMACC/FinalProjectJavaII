<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<!--
			Final Project - Home Page
			Author: Danh Tran
		-->
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>GPA Calculator</title>
		<link href="stylesheet.css" rel="stylesheet" />
	</head>
	<body>
		<div id="container">
			<header id="header" class="header">
				<h1>GPA Calculator</h1>
			</header>
			
			<nav>
				<ul>
					<li><a id="homepage" href="index.html">Home</a></li>
					<li><a id="loginpage" href="loginpage.jsp">Login</a></li>
					<li><a id="registerpage" href="registerpage.jsp">Register</a></li>
				</ul>
			</nav>
			<section>
				<h2>Login</h2>
				
				<form method="post" action="login" id="Form">
					<table>
						<tr>
							<td>Email:</td>
							<td>
								<input name="email" type="text" id="email" />
							</td>
							<td>
								<span id="erroremail" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Password:</td>
							<td>
								<input name="password" type="password" id="password" />
							</td>
							<td>
								<span id="errorpassword" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<input type="submit" name="login" value="Login" id="login" class="button" />
							</td>
						</tr>
					</table>
				</form>
				<div>${errorMessage}</div>
			</section>
			<footer>
				<h3>CIS 175, Fall Semester</h3>
			</footer>
		</div>	<!-- end of container -->
		
		<script>
			// Elements.
			var emailEl = document.getElementById('email');
			var passwordEl = document.getElementById('password');
			var errorEmailEl = document.getElementById('erroremail');
			var errorPasswordEl = document.getElementById('errorpassword');
			var loginEl = document.getElementById('login');
			
			// Validates email.
			var validateEmail = function() {
				var checkEmail = true;
				var email = emailEl.value;
				// Error. Email is empty.
				if (email === '') {
					// Adds error message
					errorEmailEl.innerHTML += 'Required';
					checkEmail = false;
				} else {
					var i = 0;
					// Checks the first letter must be an alpha letter.
					if (email.charAt(i) < 'A' || email.charAt(i) > 'z') {
						checkEmail = false;
						// Adds error message
						errorEmailEl.innerHTML += 'Must start with an alpha letter.';
					}
					// Checks the @ sign in the email address.
					var noAtSign = true;
					if (checkEmail === true) {
						for (i = 1; noAtSign && i < email.length; i++){
							if (email.charAt(i) === '@') {
								noAtSign = false;
							}
						}
						if (noAtSign) {
							// Adds error message
							errorEmailEl.innerHTML += 'Wrong email format. Use abc@here.xyz';
							checkEmail = false;
						}
					}
					// Checks an alpha letter after @ sign.
					if (checkEmail === true) {
						if (email.charAt(i) < 'A' || email.charAt(i) > 'z') {
							checkEmail = false;
							// Adds error message
							errorEmailEl.innerHTML += 'Wrong email format. Use abc@here.xyz';
						}
					}
					// Checks period mark after @.
					var noPeriodAfterAtSign = true;
					if (checkEmail === true) {
						for (i += 1; noPeriodAfterAtSign && i < email.length; i++){
							if (email.charAt(i) === '.') {
								noPeriodAfterAtSign = false;
							}
						}
						if (noPeriodAfterAtSign) {
							// Adds error message
							errorEmailEl.innerHTML += 'Wrong email format. Use abc@here.xyz';
							checkEmail = false;
						}
					}
					// Checks an alpha letter after period mark.
					if (checkEmail === true) {
						if (email.charAt(i) < 'A' || email.charAt(i) > 'z') {
							checkEmail = false;
							// Adds error message
							errorEmailEl.innerHTML += 'An alpha letter must follow period mark.';
						}
					}
				}
				return checkEmail;
			}
			
			// Validates Password.
			var validatePassword = function() {
				var checkPassword = true;
				var password = passwordEl.value;
				// Error. Password is empty.
				if (password === '') {
					// Adds error message
					errorPasswordEl.innerHTML += 'Required';
					checkPassword = false;
				} else {
					if (password.length < 6) {
						// Adds error message
						errorPasswordEl.innerHTML += 'At least 6 characters.';
						checkPassword = false;
					}
				}
				return checkPassword;
			}
			
			// Validates the whole form
			var validateForm = function(e) {
				// Resets error messages
				errorEmailEl.innerHTML = '';
				errorPasswordEl.innerHTML = ''; 
				
				// Validates fields.
				var checkEmail = validateEmail();
				var checkPassword = validatePassword();
				
				var checkResult = checkEmail && checkPassword;
				if (!checkResult) {
					e.preventDefault();
				}
			}
			
			loginEl.addEventListener('click', validateForm);
			
		</script>
	</body>
</html>