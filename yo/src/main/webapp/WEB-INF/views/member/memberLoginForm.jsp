<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="super_container">

	<!-- Header -->



	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/userList_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">LOGIN</div>
		</div>
	</div>

	<!-- Contact -->

	<div class="contact_form_section">
		<div class="container">

			<!-- Contact Form -->
			<div class="contact_form_container">


				<form action="memberLogin.do" id="memberForm" name="memberForm"
					class="contact_form text-center" method="post">
					<div class="row">
						<div class="col-lg-12"  >
							
							<input type="email" id="member_email" name="member_email"
								class="contact_form_name input_field" placeholder="이메일(아이디)"
								required="required" data-error="email is required.">
								
							<input
								type="password" id="member_pwd" name="member_pwd"
								class="contact_form_name input_field" placeholder="비밀번호"
								required="required" data-error="password is required."> 
								<br>
							<button type="submit" id="form_submit_button"
									class="form_submit_button button trans_200 ">
									로그인<span></span><span></span><span></span>
							</button>

						</div>
					</div>
				</form>
			</div>


		</div>

	</div>
</div>
<br>
<br>
<br>
<br>