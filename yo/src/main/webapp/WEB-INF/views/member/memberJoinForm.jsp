<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="super_container">

	<!-- Header -->



	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/contact_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">회원가입</div>
		</div>
	</div>

	<!-- Contact -->

	<div class="contact_form_section">
		<div class="container">

			<!-- Contact Form -->
			<div class="contact_form_container">

				<div class="contact_title text-center">회원가입</div>

				<form action="memberJoin.do" id="memberForm" name="memberForm"
					class="contact_form text-left">
					<div class="row">
						<div class="col-lg-12"  >
							<div id="text" class="contact_title" style="display: inline-block; font-size: 15px">회원구분&nbsp;:&nbsp;&nbsp; 
							<input style="display: inline-block;" id="radio1" type="radio" name="authority" value="USER" checked><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;USER&nbsp;&nbsp;</p>
							<input style="display: inline-block;" id="radio1" type="radio" name="authority" value="HOST"><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;HOST</p>
							</div>
							
							<input type="email" id="member_email" name="member_email"
								class="contact_form_subject input_field" placeholder="이메일(아이디)"
								required="required" data-error="email is required."> 
							<input
								type="password" id="member_pwd" name="member_pwd"
								class="contact_form_name input_field" placeholder="비밀번호"
								required="required" data-error="password is required."> 
							<input
								type="password" id="member_pwd1" name="member_pwd1"
								class="contact_form_email input_field" placeholder="비밀번호(확인)"
								required="required" data-error="password is required."> 
							<input
								type="text" id="member_name" name="member_name"
								class="contact_form_name input_field" placeholder="이름"
								required="required" data-error="name is required."> 
							<input
								type="text" id="member_nick" name="member_nick"
								class="contact_form_email input_field" placeholder="별명"
								required="required" data-error="nickname is required."> 
							<input
								type="text" id="member_addr" name="member_addr"
								class="contact_form_subject input_field" placeholder="주소"
								required="required" data-error="address is required.">
							<input
								type="text" id="member_tel" name="member_tel"
								class="contact_form_email input_field" placeholder="전화번호"
								required="required" data-error="tel is required.">
							
							

							<div class="contact_title text-right">
								<button type="submit" id="form_submit_button"
									class="form_submit_button button trans_200">
									등록<span></span><span></span><span></span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>


		</div>

	</div>
</div>
