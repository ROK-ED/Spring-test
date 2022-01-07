<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<title>Contact</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="resources/styles/bootstrap4/bootstrap.min.css">
<link
	href="resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/contact_responsive.css">
</head>

<body>

	<div class="super_container">

		<!-- Header -->



		<!-- Home -->

		<div class="home">
			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/contact_background.jpg"></div>
			<div class="home_content">
				<div class="home_title">contact</div>
			</div>
		</div>

		<!-- Contact -->

		<div class="contact_form_section">
			<div class="container">

				<!-- Contact Form -->
				<div class="contact_form_container">

					<div class="contact_title text-center">숙소 등록</div>

					<form action="#" id="hotelForm" name="hotelForm"
						class="contact_form text-left">
						<div class="row">
							<div class="col-lg-5">
								<input type="email" id="hotel_title" name="hotel_title"
									class="contact_form_subject input_field" placeholder="숙소명"
									required="required" data-error="email is required."> <input
									type="text" id="hotel_locx" name="hotel_locx"
									class="contact_form_name input_field" placeholder="위도"
									required="required" data-error="LocX is required."> <input
									type="text" id="hotel_locy" name="hotel_locy"
									class="contact_form_email input_field" placeholder="경도"
									required="required" data-error="LocY is required."> <input
									type="text" id="hotel_address" name="hotel_address"
									class="contact_form_subject input_field" placeholder="주소"
									required="required" data-error="address is required.">

								<input type="text" id="hotel_tel" name="hotel_tel"
									class="contact_form_subject input_field" placeholder="전화번호"
									required="required" data-error="tel is required."> <input
									type="number" id="hotel_loom" name="hotel_loom"
									class="contact_form_name input_field" placeholder="객실수"
									required="required" data-error="room is required."> <input
									type="number" id="hotel_locy" name="hotel_locy"
									class="contact_form_email input_field" placeholder="가격"
									required="required" data-error="LocY is required.">

								<textarea id="hotel_content" name="hotel_content"
									class="text_field contact_form_message" name="message" rows="4"
									placeholder="내용" required="required"
									data-error="Please, write us a content." style="resize: none;"></textarea>
							</div>
							<div class="col-lg-7">

								<div class="contact_title text-center">
									<div id="mapi" style="width: 100%; height: 480px;"></div>
									<div class="contact_title text-center">
										<h4>클릭시 해당좌표의 주소정보가 입력됩니다.</h4>
									</div>
								</div>
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


	<!-- About -->


	<!-- Google Map -->



	<!-- Footer -->

	<!-- Copyright -->



	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/styles/bootstrap4/popper.js"></script>
	<script src="resources/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
	<script src="resources/js/contact_custom.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d"></script>
	<script>
		var container = document.getElementById('mapi'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var mapi = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>

</html>