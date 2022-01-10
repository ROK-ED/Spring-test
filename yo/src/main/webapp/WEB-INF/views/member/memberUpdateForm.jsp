<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="super_container">

	<!-- Header -->



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
 
				<div class="contact_title text-center">회원정보 수정</div>

				<form action="memberUpdate.do" onsubmit="return formCheck()" id="memberForm" name="memberForm"
					class="contact_form text-left" method="post">
					<div class="row">
						<div class="col-lg-12"  >
							<div id="text" class="contact_title" style="display: inline-block; font-size: 15px">회원구분&nbsp;:&nbsp;&nbsp; 
							<c:if test="${member.member_author  == 'USER' }">
								<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="USER" checked><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;USER&nbsp;&nbsp;</p>
								<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="HOST"><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;HOST</p>
							</c:if>
							<c:if test="${member.member_author  == 'HOST' }">
								<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="USER" ><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;USER&nbsp;&nbsp;</p>
								<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="HOST" checked><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;HOST</p>
							</c:if>
							<c:if test="${member.member_author  == 'ADMIN' }">
								<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="USER" ><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;USER&nbsp;&nbsp;</p>
								<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="HOST" ><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;HOST</p>
								<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="ADMIN" checked><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;ADMIN</p>
							</c:if>
							</div>
							<br>
							<h3 id="member_email" name="member_email"
								class="contact_form_name input_field"
								style="width: 76%">
							아이디 : ${member.member_email } 
							</h3>	
							<br>
							<input
								type="password" id="member_pwd" name="member_pwd"
								class="contact_form_name input_field" placeholder="비밀번호"
								> 
							<input
								type="password" id="member_pwd1" name="member_pwd1"
								class="contact_form_email input_field" placeholder="비밀번호(확인)"
								> 
							<h3
								id="member_name" name="member_name"
								class="contact_form_name input_field" > 
								이름 : ${member.member_name } 
							</h3>	
							<input
								type="text" id="member_nick" name="member_nick"
								class="contact_form_email input_field" placeholder="별명"
								> 
							<input
								type="text" id="member_addr" name="member_addr"
								class="contact_form_subject input_field" placeholder="주소"
								>
							<input
								type="text" id="member_tel" name="member_tel"
								class="contact_form_name input_field" placeholder="전화번호"
								style="width: 76%">
							
							<button type="submit" id="form_submit_button"
									class="form_submit_button button trans_200 ">
									수정<span></span><span></span><span></span>
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
<script type="text/javascript">
function formCheck() {
if($("#member_pwd").val() != null || $("#member_pwd1").val() != null){
	if ($("#member_pwd").val() != $("#member_pwd1").val()) {
		alert("패스워드가 일치하지 않습니다.")
		$("#member_pwd").val('');
		$("#member_pwd1").val('');
		$("#member_pwd").focus();
		return false;
	}
	return true;
}else{
	return true;
}
}
</script>

