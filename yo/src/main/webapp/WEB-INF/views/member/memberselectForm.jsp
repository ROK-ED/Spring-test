<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Home -->

<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/contact_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">마이페이지</div>
	</div>
</div>

<!-- Contact -->

<div class="contact_form_section">
	<div class="container">

		<!-- Contact Form -->
		<div class="contact_form_container">


			<div id="memberForm" name="memberForm"
				class="contact_form text-left">
				<div class="row">
					<div class="col-lg-12">
						<div class="contact_title text-center">

							<div id="member_author" name="member_author">
								<h3>권한 : ${member.member_author }</h3>
								<br> <br>
							</div>
							<div id="member_email" name="member_email">
								<h3>아이디 : ${member.member_email }</h3>
								<br>
							</div>
							<div id="member_name" name="member_name">
								<h3>이름 : ${member.member_name }</h3>
								<br> <br>
							</div>
							<div id="member_nick" name="member_nick">
								<h3>별명 : ${member.member_nick }</h3>
								<br> <br>
							</div>
							<div id="member_date" name="member_date">
								<h3>가입일 : ${member.member_date }</h3>
								<br> <br>
							</div>
							<div id="member_tel" name="member_tel">
								<h3>연락처 : ${member.member_tel }</h3>
								<br> <br>
							</div>
							<div id="member_addr" name="member_addr">
								<h3>주소 : ${member.member_addr }</h3>
								<br> <br>
							</div>



							<form action="memberUpdateForm.do" class="contact_title text-right">
								<button type="submit" id="form_submit_button"
									class="form_submit_button button trans_200">
									수정<span></span><span></span><span></span>
								</button>
							</form>
							
							<form action="memberDelete.do" method="post" class="contact_title text-right">
								<input type="hidden" id="member_email" name="member_email" value="${sessionScope.member_email}">
								<button type="submit" id="form_submit_button"
									class="form_submit_button button trans_200">
									탈퇴<span></span><span></span><span></span>
								</button>
							</form>
						</div>
					</div>
				</div>

			</div>>
		</div>


	</div>

</div>
