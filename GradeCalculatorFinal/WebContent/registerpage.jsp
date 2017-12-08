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
				<h2>Register</h2>
		
				<form method="post" action="register" id="Form">
					<table>
						<tr>
							<td>First Name:</td>
							<td>
								<input name="firstname" type="text" id="firstname" />
							</td>
							<td>
								<span id="errorfirstname" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td>
								<input name="lastname" type="text" id="lastname" />
							</td>
							<td>
								<span id="errorlastname" class="error"></span>
							</td>
						</tr>
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
							<td>Confirm Email:</td>
							<td>
								<input name="confirmemail" type="text" id="confirmemail" />
							</td>
							<td>
								<span id="errorconfirmemail" class="error"></span>
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
							<td>Confirm Password:</td>
							<td>
								<input name="confirmpassword" type="password" id="confirmpassword" />
							</td>
							<td>
								<span id="errorconfirmpassword" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" name="register" value="Register" id="register" class="button" />
							</td>
							<td>
								<input type="reset" name="reset" value="Reset" id="reset" class="button" />
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
			// Validates name.
			function validateName(nameEl, errorHolderEl) {
				var checkName = true;
				var name = nameEl.value;
				// Error. Name is empty.
				if (name === '') {
					// Adds error message into the error box.
					errorHolderEl.innerHTML += 'Required';
					checkName = false;
				} else {
					// Checks alpha letters in the name.
					for (var i = 0; checkName === true && i < name.length; i++){
						if (name.charAt(i) < 'A' || name.charAt(i) > 'z') {
							checkName = false;
						}
					}
					// Error. Name contains non-alpha letters.
					if (checkName === false) {
						// Adds error message into the error box.
						errorHolderEl.innerHTML += 'Letters only.';
					}
				}
				return checkName;
			}
			
			// Elements.
			var firstNameEl = document.getElementById('firstname');
			var lastNameEl = document.getElementById('lastname');
			var emailEl = document.getElementById('email');
			var confirmEmailEl = document.getElementById('confirmemail');
			var passwordEl = document.getElementById('password');
			var confirmPasswordEl = document.getElementById('confirmpassword');
			var errorFirstNameEl = document.getElementById('errorfirstname');
			var errorLastNameEl = document.getElementById('errorlastname');
			var errorEmailEl = document.getElementById('erroremail');
			var errorConfirmEmailEl = document.getElementById('errorconfirmemail');
			var errorPasswordEl = document.getElementById('errorpassword');
			var errorConfirmPasswordEl = document.getElementById('errorconfirmpassword');
			var registerEl = document.getElementById('register');
			var resetEl = document.getElementById('reset');
			
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
			
			// Validates Confirm Email
			var validateConfirmEmail = function() {
				var checkConfirmEmail = true;
				var confirmEmail = confirmEmailEl.value;
				var email = emailEl.value;
				// Error. Email is empty.
				if (confirmEmail === '') {
					checkConfirmEmail = false;
					// Adds error message
					errorConfirmEmailEl.innerHTML += 'Required';
				} else {
					// Error. Emails mismatch.
					if (confirmEmail !== email) {
						checkConfirmEmail = false;
						// Adds error message
						errorConfirmEmailEl.innerHTML += 'Mismatch';
					}
				}
				return checkConfirmEmail;
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
			
			// Validates Confirm Password
			var validateConfirmPassword = function() {
				var checkConfirmPassword = true;
				var confirmPassword = confirmPasswordEl.value;
				var password = passwordEl.value;
				// Error. Password is empty.
				if (confirmPassword === '') {
					checkConfirmPassword = false;
					// Adds error message
					errorConfirmPasswordEl.innerHTML += 'Required';
				} else {
					// Error. Passwords mismatch.
					if (confirmPassword !== password) {
						checkConfirmPassword = false;
						// Adds error message
						errorConfirmPasswordEl.innerHTML += 'Mismatch';
					}
				}
				return checkConfirmPassword;
			}
			
			// Validates the whole form
			var validateForm = function(e) {
				// Resets error messages
				errorFirstNameEl.innerHTML = '';
				errorLastNameEl.innerHTML = '';
				errorEmailEl.innerHTML = '';
				errorConfirmEmailEl.innerHTML = '';
				errorPasswordEl.innerHTML = ''; 
				errorConfirmPasswordEl.innerHTML = '';
				
				// Validates fields.
				var checkFirstName = validateName(firstNameEl, errorFirstNameEl);
				var checkLastName = validateName(lastNameEl, errorLastNameEl);
				var checkEmail = validateEmail();
				var checkConfirmEmail = validateConfirmEmail();
				var checkPassword = validatePassword();
				var checkConfirmPassword = validateConfirmPassword();
				
				var checkResult = checkFirstName && checkLastName && checkEmail &&
								checkConfirmEmail && checkPassword && checkConfirmPassword;
				if (!checkResult) {
					e.preventDefault();
				}
			}
			
			// Validates the whole form
			var resetForm = function() {
				// Resets error messages
				errorFirstNameEl.innerHTML = '';
				errorLastNameEl.innerHTML = '';
				errorEmailEl.innerHTML = '';
				errorConfirmEmailEl.innerHTML = '';
				errorPasswordEl.innerHTML = '';
				errorConfirmPasswordEl.innerHTML = '';
			}
			
			registerEl.addEventListener('click', validateForm);
			resetEl.addEventListener('click', resetForm);
			
		</script>
	</body>
</html>