<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<title>숙박</title>
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
	href="resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/offers_responsive.css">
</head>

<body>

	<div class="super_container">

		<!-- Header -->
		<!-- Home -->

		<div class="home">
			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/about_background.jpg"></div>
			<div class="home_content">
				<div class="home_title">숙박</div>
			</div>
		</div>

		<!-- Offers -->

		<div class="offers">

			<!-- Search -->

			<div class="search">
				<div class="search_inner">

					<!-- Search Contents -->

					<div class="container fill_height no-padding">
						<div class="row fill_height no-margin">
							<div class="col fill_height no-padding">

								<!-- Search Tabs -->


								<!-- Search Panel -->

								<div class="search_panel active">

									<form action="#" id="search_form_1"
										class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
										<div class="search_item">
											<br> <br>
											<div>이름</div>
											<input type="text" class="destination search_input"
												required="required">
										</div>
										<div class="search_item">
											<br> <br>
											<div>check in</div>
											<input type="text" class="check_in search_input"
												placeholder="YYMMDD">
										</div>

										<button class="button search_button">
											search<span></span><span></span><span></span>
										</button>
									</form>
								</div>

								<!-- Search Panel -->

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Offers -->

			<div class="container">
				<div class="row">


					<div class="col-lg-7">
						<!-- Offers Grid -->

						<div class="offers_grid">

							<!-- Offers Item(사용할것) -->
							<!-- 여기서부터 -->
							<c:forEach items="${hotels }" var="hotel">
							<div class="offers_item rating_4">
								<div class="row">
									<div class="col-lg-0 temp_col"></div>
									<div class="col-lg-5 col-1680-4">
										<div class="offers_image_container">
											<!-- Image by https://unsplash.com/@kensuarez -->
											<div class="offers_image_background">
												<a href="hotelSelect.do?hotel_id=${hotel.hotel_id }"><img alt="숙소 섬네일" src="resources/images/offer_1.jpg"
													style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
												</a>
											</div>

										</div>
									</div>
									<div class="col-lg-7">
										<div class="offers_content"></div>
										<div class="offers_price">${hotel.hotel_title }</div>
										<div class="offer_reviews">
											<div class="offer_reviews_content">
												<div class="offer_reviews_title">${hotel.hotel_price} 원</div>

											</div>
										</div>
										<p class="offers_text">${hotel.hotel_content }</p>

										<div class="button book_button">
											<a href="hotelResForm.do?hotel_id=${hotel.hotel_id }">예약<span></span><span></span><span></span></a>

										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- 여기까지 for문돌릴것 -->
							<!-- Offers Item -->




						</div>
					</div>
					<div class="col-lg-5">
						<div id="mapi" style="width: 500px; height: 400px;"></div>
					</div>
				</div>
				<div class="col-lg-12 text-lg-right">
					<div class="room_button">
						<div class="button book_button trans_200">
							<a href="hotelInsertForm.do">등록<span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Copyright -->

	</div>

	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/styles/bootstrap4/popper.js"></script>
	<script src="resources/styles/bootstrap4/bootstrap.min.js"></script>

	<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="resources/plugins/easing/easing.js"></script>
	<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
	<script src="resources/js/offers_custom.js"></script>



	<script src="resources/plugins/greensock/TweenMax.min.js"></script>
	<script src="resources/plugins/greensock/TimelineMax.min.js"></script>
	<script src="resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script src="resources/plugins/greensock/animation.gsap.min.js"></script>
	<script src="resources/plugins/greensock/ScrollToPlugin.min.js"></script>
	<script src="resources/plugins/progressbar/progressbar.min.js"></script>
	<script
		src="resources/plugins/jquery-circle-progress-1.2.2/circle-progress.js"></script>
	<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
	<script src="resources/js/elements_custom.js"></script>
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