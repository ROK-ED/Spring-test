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

					<div class="contact_title text-center">숙소 예약</div>

					<form action="#" id="hotelForm" name="hotelForm"
						class="contact_form text-left">
						<div class="row">
							<div class="col-lg-5">
								<div class="contact_title text-center">

									<div id="hotel_id" name="hotel_id">
										<h3>숙소 이름</h3>
										<br>
									</div>
									<div id="hotel_address" name="hotel_address">
										<h3>주	소</h3>
										<br>
										<br>
									</div>
									<!-- 달력 -->
									<div id="hotel_address" name="hotel_address">
										<h3>달	력</h3>
								
										<h3>들어갈 부분</h3>
										<br><br>
									</div>
									
									
									<div id="hotel_price" name="hotel_price">
										<h3>가	격</h3>
										<br>
									</div>
								</div>
							</div>
							<div class="col-lg-7">

								<div class="contact_title text-center">
									<div id="mapi" style="width: 100%; height: 480px;"></div>
								</div>

								<div class="contact_title text-right">
									<button type="submit" id="form_submit_button"
										class="form_submit_button button trans_200">
										예약<span></span><span></span><span></span>
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