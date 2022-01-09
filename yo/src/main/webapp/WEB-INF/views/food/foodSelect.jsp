<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<head>
<title>Single Listing</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="resources/styles/bootstrap4/bootstrap.min.css">
<link
	href="resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="resources/plugins/colorbox/colorbox.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/single_listing_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/single_listing_responsive.css">
</head>

<body>

	<div class="super_container">

		<!-- Header -->


		<!-- Top Bar -->

		<!-- Main Navigation -->





		<!-- Home -->

		<div class="home">
			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/single_background.jpg"></div>
			<div class="home_content">
				<div class="home_title">the offers</div>
			</div>
		</div>

		<!-- Offers -->

		<div class="listing">

			<!-- Search -->


			<!-- Single Listing -->

			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="single_listing">

							<!-- Hotel Info -->

							<div class="hotel_info">

								<!-- Title -->
								<div
									class="hotel_title_container d-flex flex-lg-row flex-column">
									<div class="hotel_title_content">
										<h1 class="hotel_title">프린스 호텔</h1>
										<div class="hotel_info_text">전화번호</div>
										<div class="hotel_location">주소넣는부분</div>
									</div>
									<div class="hotel_title_button ml-lg-auto text-lg-right">
										<br>
										<div class="room_text">
											<h2>가격</h2>
										</div>


									</div>
								</div>

								<!-- Listing Image -->

								<div class="hotel_image">
									<img src="resources/images/listing_hotel.jpg" alt="">

								</div>

								<!-- Hotel Gallery -->


								<!-- Hotel Info Text -->

								<div class="hotel_info_text">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nullam eu convallis tortor. Suspendisse potenti. In faucibus
										massa. Lorem ipsum dolor sit amet, consectetur adipiscing
										elit. Nullam eu convallis tortor. Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Vivamus quis vulputate eros,
										iaculis consequat rem eu nisl pellentesque semper. Nullam
										tincidunt metus placerat, suscipit leo ut, tempus nulla. Fusce
										at eleifend tellus. Ut eleifend dui nunc, non fermentum quam
										placerat non. Etiam venenatis nibh augue, sed eleifend justo
										tristique eu</p>
								</div>

								<div class="col-lg-12 text-lg-right">
									<div class="room_button">
										<div class="button book_button trans_200">
											<a href="hotelRes.do">예약<span></span><span></span><span></span></a>
										</div>
									</div>
								</div>

								<!-- Rooms -->


								<!-- Reviews -->


								<!-- Location on Map -->

								<div class="location_on_map">
									<div class="location_on_map_title">location on map</div>


									<div id="mapi" style="width: 100%; height: 800px;"></div>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Footer -->

			<!-- Copyright -->


		</div>

		<script src="resources/js/jquery-3.2.1.min.js"></script>
		<script src="resources/styles/bootstrap4/popper.js"></script>
		<script src="resources/styles/bootstrap4/bootstrap.min.js"></script>
		<script src="resources/plugins/easing/easing.js"></script>
		<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
		<script src="resources/plugins/colorbox/jquery.colorbox-min.js"></script>
		<script src="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
		<script
			src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
		<script src="resources/js/single_listing_custom.js"></script>
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