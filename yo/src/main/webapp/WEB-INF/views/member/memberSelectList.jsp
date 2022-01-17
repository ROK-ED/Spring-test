<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">



<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.js"></script>

<script>
	jQuery(function($) {
		$("#mTable").DataTable({

			// 정렬 기능 숨기기
			ordering : false,

			// 정보 표시 숨기기
			info : false,

			displayLength : 5,

			lengthMenu : [ 5, 10, 15, 20 ],

		});
	});
</script>
<style>
th {
	text-align: center;
	font-weight: normal;
}

td {
	text-align: center;
	font-weight: bold;
}
</style>
<!-- Home -->
<link rel="stylesheet" type="text/css"
	href="resources/DataTables/datatables.min.css" />

<script type="text/javascript"
	src="resources/DataTables/datatables.min.js"></script>

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
		<table id="mTable" class="table table-bordered">
			<thead>
				<tr>
					<th width="140px">이메일(아이디)</th>
					<th width="75px">이름</th>
					<th width="70px">별명</th>
					<th>가입일</th>
					<th>연락처</th>
					<th>주소</th>
					<th>권한</th>
					<th width="90px">예약내역</th>
					<th width="90px">계정동결/해제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members }" var="member">
					<tr>
						<td>${member.member_email }</td>
						<td>${member.member_name }</td>
						<td>${member.member_nick }</td>
						<td>${member.member_date }</td>
						<td>${member.member_tel }</td>
						<td>${member.member_addr }</td>
						<td>${member.member_author }</td>
						<td style="border-top-width: 1px;padding-top: 0px;padding-bottom: 15px;">
						<form action="memberReservation.do" id="reservationForm" name="reservationForm" method="post">
								<input type="hidden" id="member_email" name="member_email" value="${member.member_email }">
								<input type="hidden" id="member_author" name="member_author" value="${member.member_author }">
								<input type="submit" id="reservation"
									class="form_submit_button button trans_200 "
									style="margin-bottom: 0px; background-color: orange; margin-top: 0px;"
									value="예약확인">
							</form>
						</td>

						<th style="border-top-width: 1px;padding-top: 0px;padding-bottom: 15px;">
							<button type="button" id="ice" onclick="ajaxIce()"
								class="form_submit_button button trans_200 "
								style="margin-bottom: 0px;background-color: orange;margin-top: 0px;">
								동결</button>
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
