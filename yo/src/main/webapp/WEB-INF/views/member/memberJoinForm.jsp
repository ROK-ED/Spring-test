<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="super_container">

	<!-- Header -->



	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/userList_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">회원가입</div>
		</div>
	</div>

	<!-- Contact -->

	<div class="contact_form_section">
		<div class="container">

			<!-- Contact Form -->
			<div class="contact_form_container">
<!-- 
				<div class="contact_title text-center">회원가입</div>
 -->
				<form action="memberJoin.do" onsubmit="return formCheck()" id="memberForm" name="memberForm"
					class="contact_form text-left" method="post">
					<div class="row">
						<div class="col-lg-12"  >
							<div id="text" class="contact_title" style="display: inline-block; font-size: 15px">회원구분&nbsp;:&nbsp;&nbsp; 
							<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="USER" checked><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;USER&nbsp;&nbsp;</p>
							<input style="display: inline-block;" id="member_author" type="radio" name="member_author" value="HOST"><p style="display: inline-block; color: white; margin-bottom: 0">&nbsp;HOST</p>
							</div>
							<br>
							
							<input type="email" id="member_email" name="member_email"
								class="contact_form_name input_field" placeholder="이메일(아이디)"
								required="required" data-error="email is required." style="width: 76%">
								
							<button type="button" id="idCheck" value="No" onclick="ajaxIdCheck()"
									class="form_submit_button button trans_200 " style="margin-bottom: 20px; background-color: orange;">
									중복체크
							</button> 
							<br>
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
								class="contact_form_name input_field" placeholder="전화번호"
								required="required" data-error="tel is required." style="width: 76%">
							
							<button type="submit" id="form_submit_button"
									class="form_submit_button button trans_200 ">
									회원가입<span></span><span></span><span></span>
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
function ajaxIdCheck() {
	var member_email = $("#member_email").val();
	if (member_email.length > 0) {
		$.ajax({
			url : "ajaxIsidCheck.do",
			type : "post",
			data : {
				"member_email" : member_email
			},
			dataType : "text",
			success : function(str) {
				console.log(str);
				//var b = (str === 'ture') //boolean 값으로 값을 반환
				//console.log(b);
				if (str == "false") {
					alert("이미 존재하는 아이디 입니다.");
					$("#member_email").val('');
					$("#member_email").focus();
				} else {
					alert("사용 가능한 아이디 입니다.");
					$("#idCheck").val('Yes');
					$('#idCheck').hide();
					$('#member_pwd').focus();
				} 
			},
			error : function() {
				alert("중복 체크 과정에서 오류가 발생했습니다.");
			}
		});
	} else {
		alert("아이디를 입력해주세요.");
		$("#member_email").focus();
	}
}
function formCheck() {
	if ($("#idCheck").val() == 'No') {
		alert("중복 체크를 해 주세요.")
		return false;
	}

	if ($("#member_pwd").val() != $("#member_pwd1").val()) {
		alert("패스워드가 일치하지 않습니다.")
		$("#member_pwd").val('');
		$("#member_pwd1").val('');
		$("#member_pwd").focus();
		return false;
	}
	return true;
}
</script>

