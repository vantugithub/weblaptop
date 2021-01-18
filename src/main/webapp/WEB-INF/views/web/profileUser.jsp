<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Your profile</title>
</head>
<body>
	<div class="home">
		<div id="user-profile-1" class="home_slider_container">
			<div class="center">
				<div>
					<input type='file' onchange="readURL(this);" /> <span
						class="profile-picture"> <img
						class="editable img-responsive" alt="Alex's Avatar" id="blah"
						src="<c:url value="/template/admin/assets/avatars/profile-pic.jpg"/>" />
					</span>
					<div class="space-4"></div>
					<div
						class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
						<div class="inline position-relative center">
							<a href="#" class="user-title-label dropdown-toggle"
								data-toggle="dropdown"> <i
								class="ace-icon fa fa-circle light-green"></i> &nbsp; <span
								class="white">${user1.fullName}</span>
							</a>
							<ul
								class="align-left dropdown-menu dropdown-caret dropdown-lighter">
								<li class="dropdown-header">Change Status</li>

								<li><a href="#"> <i class="ace-icon fa fa-circle green"></i>
										&nbsp; <span class="green">Available</span>
								</a></li>

								<li><a href="#"> <i class="ace-icon fa fa-circle red"></i>
										&nbsp; <span class="red">Busy</span>
								</a></li>

								<li><a href="#"> <i class="ace-icon fa fa-circle grey"></i>
										&nbsp; <span class="grey">Invisible</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="space-6"></div>

				<div class="profile-contact-info">
					<div class="profile-contact-links">
						<a href="#" class="btn btn-link"> <i
							class="ace-icon fa fa-plus-circle bigger-120 green"></i> Add as a
							friend
						</a> <a href="#" class="btn btn-link"> <i
							class="ace-icon fa fa-envelope bigger-120 pink"></i> Send a
							message
						</a> <a href="#" class="btn btn-link"> <i
							class="ace-icon fa fa-globe bigger-125 blue"></i> www.alexdoe.com
						</a>
					</div>

					<div class="space-6"></div>

					<div class="profile-social-links align-center">
						<a href="#" class="tooltip-info" title=""
							data-original-title="Visit my Facebook"> <i
							class="middle ace-icon fa fa-facebook-square fa-2x blue"></i>
						</a> <a href="#" class="tooltip-info" title=""
							data-original-title="Visit my Twitter"> <i
							class="middle ace-icon fa fa-twitter-square fa-2x light-blue"></i>
						</a> <a href="#" class="tooltip-error" title=""
							data-original-title="Visit my Pinterest"> <i
							class="middle ace-icon fa fa-pinterest-square fa-2x red"></i>
						</a>
					</div>
				</div>

				<div class="hr hr12 dotted"></div>
				<div class="hr hr16 dotted"></div>
				<div class="">
					<button type="button" data-toggle="modal"
						data-target="#exampleModal" data-whatever="@mdo"
						class="btn btn-sm btn-primary btn-white btn-round">
						<i class="ace-icon fa fa-rss bigger-150 middle orange2"></i> <span
							class="bigger-110"> Change life :) </span> <i
							class="icon-on-right ace-icon fa fa-arrow-right"></i>
					</button>
				</div>
			</div>

			<div class="">

				<div class="space-12"></div>
				<c:url value="/updateProfile" var="url" />
				<form:form modelAttribute="user2" action="${url}" method="POST">
					<div class="profile-user-info ">
						<div class="profile-info-row">
							<div class="profile-info-name">Full name</div>

							<div class="profile-info-value">
								<form:input path="fullName" class="editable" id="username"
									value="${user1.fullName}" />
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Location</div>

							<div class="profile-info-value">
								<i class="fa fa-map-marker light-orange bigger-110"></i>
								<form:input path="city" class="editable" id="country"
									value="${user1.city}" />
							</div>
						</div>
						<div class="profile-info-row">
							<div class="profile-info-name">Address</div>

							<div class="profile-info-value">
								<i class="fa fa-map-marker light-orange bigger-110"></i>
								<form:input path="address" class="editable" id="country"
									value="${user1.address}" />
							</div>
						</div>

						<div class="profile-info-row">
							<div class="profile-info-name">Phone</div>

							<div class="profile-info-value">
								<i class="light-orange bigger-110"></i>
								<form:input path="phone" class="editable" id="country"
									value="${user1.phone}" />
							</div>
						</div>
					</div>
					<div class="center">
						<button type="submit"
							class="btn btn-sm btn-primary btn-white btn-round">
							<i class="ace-icon fa fa-rss bigger-150 middle orange2"></i> <span
								class="bigger-110">save</span> <i
								class="icon-on-right ace-icon fa fa-arrow-right"></i>
						</button>
					</div>
				</form:form>
				<div class="space-20"></div>
				<div class="hr hr2 hr-double"></div>
				<div class="space-6"></div>
			</div>
		</div>
	</div>
	
	
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change LIFE</h5>
				</div>
				<div class="modal-body">
					<form method="POST"  name="myForm" onsubmit="return validate()" >
					<label class="form-group" id="notice" style="color:red;"></label>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Enter current pasword</label> <input type="password" class="form-control"
								id="recipient-name" name="password">
						</div>
						
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Enter your new password</label> <input type="password" class="form-control"
							name="newPassword1"	id="newPassword1">
						</div>
						<label class="form-group" id="errorPass1" style="color:red;"></label>
						
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Enter new password again</label> <input type="password"class="form-control"
							name="newPassword2"	id="newPassword2">
						</div>
						<label class="form-group" id="errorPass2" style="color:red;"></label>
						<div class="form-group">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onclick="changePass()">Save</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result).width(150).height(
							180);
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		function changePass() {
			if(validate()==false)
				{
				return;
				}
			else{
				var xhttp;
				var newPassword1 = document.myForm.newPassword1.value;
				var currentPassword = document.myForm.password.value;
				var url = "http://localhost:8080/spring-mvc/orthers/changePass/" + newPassword1
				+"/" + currentPassword;

				if (window.XMLHttpRequest) {
					xhttp = new XMLHttpRequest();
				} else {
					xhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}

				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4) {
						var data = xhttp.responseText;
						document.getElementById("notice").innerHTML = data;
					}
				}
				xhttp.open("POST", url, true);
				xhttp.send();
			}
			
		}
	</script>
	<script type="text/javascript">

function validate() {
	var newPassword1 = document.myForm.newPassword1.value;
	var newPassword2 = document.myForm.newPassword2.value;
	
		if(newPassword1.length < 6) {
		document.getElementById("errorPass1").innerHTML="Must be at least 6 characters";
		return false;
		}
		if(newPassword1.length >= 6){
			document.getElementById("errorPass1").innerHTML="";
		}
		if(newPassword1 != newPassword2) {
			document.getElementById("errorPass2").innerHTML="Password must be same!";
			return false;
		}
}

</script>
</body>
</html>