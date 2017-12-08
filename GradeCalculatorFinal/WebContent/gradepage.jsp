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
				<h2>Grades</h2>
				<h4>Grade list for ${acc.firstname} ${acc.lastname}</h4>
				
				<form method="post" action="viewgrade" id="viewForm">
					<table>
						<tr>
							<td>&nbsp;</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Choose time period</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>From Year</td>
							<td>
								<select name="fromyear" id="fromyear">
									<c:forEach items="${requestScope.years}" var="year">
										<option value="${year}">${year}</option>
									</c:forEach>
								</select>
							</td>
							<td>Semester</td>
							<td>
								<select name="fromsemester" id="fromsemester">
									<c:forEach items="${requestScope.semesters}" var="semester">
										<option value="${semester.id}">${semester.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>To Year</td>
							<td>
								<select name="toyear" id="toyear">
									<c:forEach items="${requestScope.years}" var="year">
										<option value="${year}">${year}</option>
									</c:forEach>
								</select>
							</td>
							<td>Semester</td>
							<td>
								<select name="tosemester" id="tosemester">
									<c:forEach items="${requestScope.semesters}" var="semester">
										<option value="${semester.id}">${semester.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<input type="submit" name="viewgrade" value="View Grade" id="viewgrade" class="button" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</form>
				
				<form method="post" action="manipulategrade" id="editForm">	
					<table class="table">
						<tr>
							<th></th>
							<th>Year</th>
							<th>Semester</th>
							<th>Course</th>
							<th>Credits</th>
							<th>Grade</th>
						</tr>
						<c:forEach items="${grades}" var="grade">
							<tr>
								<td>
									<input type="radio" name="id" value="${grade.gradeid}">
								</td>
								<td>${grade.year}</td>
								<td>${grade.semestername}</td>
								<td>${grade.coursename}</td>
								<td>${grade.credits}</td>
								<td>${grade.gradetypeletter}</td>
							</tr>
						</c:forEach>
					</table>
						<input type = "submit" value = "Edit" name="action">
						<input type = "submit" value = "Delete" name="action">
					<table>
						<tr>
							<td>&nbsp;</td>
							<td></td>
						</tr>
						<tr>
							<td><strong>GPA</strong></td>
							<td><strong>${gpa}</strong></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td></td>
						</tr>
					</table>
				</form>
				
				<form method="post" action="addgrade" id="addForm">	
					<table>
						<tr>
							<td>Year</td>
							<td>
								<input type="text" name="addyear" id="addyear" />
							</td>
							<td>
								<span id="erroraddyear" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Semester</td>
							<td>
								<select name="addsemester" id="addsemester">
									<c:forEach items="${requestScope.semesters}" var="semester">
										<option value="${semester.id}">${semester.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>Course</td>
							<td>
								<input type="text" name="addcourse" id="addcourse" />
							</td>
							<td>
								<span id="erroraddcourse" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Credits</td>
							<td>
								<input type="text" name="addcredit" id="addcredit" />
							</td>
							<td>
								<span id="erroraddcredit" class="error"></span>
							</td>
						</tr>
						<tr>
							<td>Grade</td>
							<td>
								<select name="addgrade" id="addgrade">
									<c:forEach items="${requestScope.gradeTypes}" var="gradeType">
										<option value="${gradeType.id}">${gradeType.letter}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" name="addnewgrade" value="Add" id="addnewgrade" class="button" />
							</td>
							<td>
								<input type="reset" name="reset" value="Reset" id="reset" class="button" />
							</td>
						</tr>
					</table>
				</form>
			</section>
			
			<footer>
				<h3>CIS 175, Fall Semester</h3>
			</footer>
		</div>	<!-- end of container -->
		
		<script>
			// Elements.
			var courseEl = document.getElementById('addcourse');
			var yearEl = document.getElementById('addyear');
			var creditsEl = document.getElementById('addcredit');
			var errorAddCourseEl = document.getElementById('erroraddcourse');
			var errorAddYearEl = document.getElementById('erroraddyear');
			var errorAddCreditsEl = document.getElementById('erroraddcredit');
			var addEl = document.getElementById('addnewgrade');
			var resetEl = document.getElementById('reset');

			console.log(courseEl);
			console.log(yearEl);
			console.log(creditsEl);
			console.log(errorAddCourseEl);
			console.log(errorAddYearEl);
			console.log(errorAddCreditsEl);
			console.log(addEl);
			console.log(resetEl);
			
			// Validates course.
			var validateCourse = function() {
				console.log("a");
				var checkCourse = true;
				var course = courseEl.value;
				// Error. Course is empty.
				if (course === '') {
					// Adds error message into the error box.
					errorAddCourseEl.innerHTML += 'Required';
					checkCourse = false;
				}
				return checkCourse;
			}
			
			
			// Validates year
			var validateYear = function() {
				console.log("b");
				var checkYear = true;
				var yearString = yearEl.value;
				var yearInt = parseInt(yearString);
				// Error. Password is empty.
				if (yearString === '') {
					checkYear = false;
					// Adds error message
					errorAddYearEl.innerHTML += 'Required';
				} else if (!(yearInt >= 2000 || yearInt <= 2017)) {
					checkYear = false;
					// Adds error message
					errorAddYearEl.innerHTML += 'In the range of 2000 through 2017';
				}
				return checkConfirmPassword;
			}
			
			
			// Validates credits
			var validateCredits = function() {
				console.log("c");
				var checkCredits = true;
				var creditsString = creditsEl.value;
				var creditsInt = parseInt(creditsString);
				// Error. Password is empty.
				if (creditsString === '') {
					checkCredits = false;
					// Adds error message
					errorAddCreditsEl.innerHTML += 'Required';
				} else if (!(creditsInt >= 1 || creditsInt <= 10)) {
					checkCredits = false;
					// Adds error message
					errorAddCreditsEl.innerHTML += 'In the range of 1 through 10';
				}
				return checkCredits;
			}
			
			// Validates the whole form
			var validateForm = function(e) {
				console.log("d");
				// Resets error messages
				errorAddCourseEl.innerHTML = '';
				errorAddYearEl.innerHTML = '';
				errorAddCreditsEl.innerHTML = '';
				
				// Validates fields.
				var checkCourse = validateCourse();
				var checkYear = validateYear();
				var checkCredits = validateCredits();
				
				var checkResult = checkCourse && checkYear && checkCredits;
				if (!checkResult) {
					console.log("f");
					e.preventDefault();
				}
			}
			
			// Validates the whole form
			var resetForm = function() {
				console.log("e");
				// Resets error messages
				errorAddCourseEl.innerHTML = '';
				errorAddYearEl.innerHTML = '';
				errorAddCreditsEl.innerHTML = '';
			}

			addEl.addEventListener('click', validateForm);
			resetEl.addEventListener('click', resetForm);
			
		</script>
	</body>
</html>