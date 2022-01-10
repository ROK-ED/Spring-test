<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- Home -->

<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/contact_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">회원목록(ADMIN)</div>
	</div>
</div>

<!-- Contact -->

<div class="contact_form_section">
	<div class="container">

		<!-- Contact Form -->
		<table border="1">
			<thead>
				<tr>
					<td>이메일(아이디)</td>
					<td>이름</td>
					<td>별명</td>
					<td>가입일</td>
					<td>연락처</td>
					<td>주소</td>
					<td>권한</td>
					<td>예약내역</td>
					<td>채팅</td>
					<td>계정동결/해제</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members }" var="member">
					<tr>
						<th>${member.member_email }</th>
						<th>${member.member_name }</th>
						<th>${member.member_nick }</th>
						<th>${member.member_date }</th>
						<th>${member.member_tel }</th>
						<th>${member.member_addr }</th>
						<th>${member.member_author }</th>
						<th>예약확인(미구현)</th>
						<th>채팅(미구현)</th>
						<th>
							<button type="button" id="ice" onclick="ajaxIce()"
								class="form_submit_button button trans_200 "
								style="margin-bottom: 20px; background-color: orange;">
								동결(미구현)
							</button>
						</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<br>
<script type="text/javascript">
function ajaxIce() {
	var member_email = this.event.path[2].children[0].textContent;
	console.log(member_email);
	var member_author = this.event.path[2].children[6].textContent;
	console.log(member_author);
 		
	$.ajax({
			url : "ajaxIce.do",
			type : "post",
			data : {
				"member_email" : member_email
				/* "member_author" : member_author */
			},
			dataType : "text",
			success : function(str) {
				alert("동결/해제 되었습니다.");
				location.reload();
			},
			error : function() {
				alert("동결 과정에서 오류가 발생했습니다.");
				location.reload();
				
			}
		});
 	
}
</script>
