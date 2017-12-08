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
					<li><a id="gradepage" href="viewgrade">Grades</a></li>
					<li><a id="accountpage" href="viewaccount">Account</a></li>
					<li><a id="logoutpage" href="logout">Logout</a></li>
				</ul>
			</nav>
			
			<section>
				<h2>Account</h2>

				<form method="post" action="updateaccount" id="Form">
					
					<div>
						<span id="placeholderForm_Label_welcome">Welcome to GPA Calculator ${acc.firstname} ${acc.lastname}</span> <br />
					</div>

					<table>
						<tr>
							<td>Email:</td>
							<td>
								<input name="email" type="text" id="email" value="${acc.email}" disabled />
							</td>
							<td></td>
						</tr>
						<tr>
							<td>First Name:</td>
							<td>
								<input name="firstname" type="text" id="firstname" value="${acc.firstname}" />
							</td>
							<td>
								<span id="errorfirstname" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td>
								<input name="lastname" type="text" id="lastname" value="${acc.lastname}" />
							</td>
							<td>
								<span id="errorlastname" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Password:</td>
							<td>
								<input name="password" type="password" id="password" value="${acc.password}" />
							</td>
							<td>
								<span id="errorpassword" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Confirm Password:</td>
							<td>
								<input name="confirmpassword" type="password" id="confirmpassword" value="${acc.password}" />
							</td>
							<td>
								<span id="errorconfirmpassword" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" name="save" value="Save" id="save" class="button" />
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
			var passwordEl = document.getElementById('password');
			var confirmPasswordEl = document.getElementById('confirmpassword');
			var errorFirstNameEl = document.getElementById('errorfirstname');
			var errorLastNameEl = document.getElementById('errorlastname');
			var errorPasswordEl = document.getElementById('errorpassword');
			var errorConfirmPasswordEl = document.getElementById('errorconfirmpassword');
			var saveEl = document.getElementById('save');
			
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
				errorPasswordEl.innerHTML = ''; 
				errorConfirmPasswordEl.innerHTML = '';
				
				// Validates fields.
				var checkFirstName = validateName(firstNameEl, errorFirstNameEl);
				var checkLastName = validateName(lastNameEl, errorLastNameEl);
				var checkPassword = validatePassword();
				var checkConfirmPassword = validateConfirmPassword();
				
				var checkResult = checkFirstName && checkLastName &&
							checkPassword && checkConfirmPassword;
				if (!checkResult) {
					e.preventDefault();
				}
			}
			
			// Validates the whole form
			var resetForm = function() {
				// Resets error messages
				errorFirstNameEl.innerHTML = '';
				errorLastNameEl.innerHTML = '';
				errorPasswordEl.innerHTML = '';
				errorConfirmPasswordEl.innerHTML = '';
			}
			
			saveEl.addEventListener('click', validateForm);
			
		</script>
	</body>
</html>