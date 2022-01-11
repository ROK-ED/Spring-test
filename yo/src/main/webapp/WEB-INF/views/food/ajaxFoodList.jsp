<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>

	<div class="super_container">
		<div class="home">
			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/contact_background.jpg"></div>
			<div class="home_content">
				<div class="home_title">foodList</div>
			</div>
		</div>

		<!-- Search -->

		<div class="offers" onload="makeMarker()">
			<div class="search">


				<!-- Search Contents -->

				<div class="container fill_height">
					<div class="row fill_height">
						<div class="col fill_height">


							<!-- Search Panel -->

							<div class="search_panel active">
								<form action="" id="search_form_1" method="post"
									class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
									<div class="search_item">
										<div>위치</div>
										<input type="text" class="food_address search_input"
											id="food_address">
									</div>

									<div class="search_item">
										<div>가게이름</div>
										<input type="text" class="food_name search_input"
											id="food_name">
									</div>

									<div class="search_item">
										<div>메뉴</div>
										<input type="text" class="food_menu search_input"
											id="food_menu">
									</div>

									<div class="search_item">
										<div>분류</div>
										<select name="food_class" id="food_class"
											class="dropdown_item_select search_input">
											<option>분류</option>
											<option>일식</option>
											<option>중식</option>
											<option>양식</option>
										</select>
									</div>

									<!-- 체크박스 -->
									<div class="extras">
										<ul class="search_extras clearfix">
											<li class="search_extras_item">
												<div class="clearfix">
													<input type="checkbox" id="food_parking"
														class="food_parking search_extras_cb"> <label
														for="search_extras_2">주차 가능</label>
												</div>
											</li>

											<li class="search_extras_item">
												<div class="clearfix">
													<input type="checkbox" id="search_extras_4"
														class="search_extras_cb"> <label
														for="search_extras_4">Reservations</label>
												</div>
											</li>

											<li class="search_extras_item">
												<div class="clearfix">
													<input type="checkbox" id="search_extras_7"
														class="search_extras_cb"> <label
														for="search_extras_7">Wheelchair Accessible</label>
												</div>
											</li>

										</ul>
									</div>
									<button class="button search_button" onclick="searchData()">
										검색<span></span><span></span><span></span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 내용 출력 -->
			<!-- Offers -->

			<div class="container">
				<div class="row">


					<div class="col-lg-7">
						<div class="offers_grid">
						
						
						
						
							<c:forEach items="${jsonModel }" var="food">
														
								<div class="offers_item rating_4">
									<div class="row">
										<div class="col-lg-1 temp_col"></div>
										<div class="col-lg-3 col-1680-4">
											<div class="offers_image_container">
												<!-- Image by https://unsplash.com/@kensuarez -->
												<div class="offers_image_background"
													style="background-image: url(images/offer_1.jpg)"></div>

											</div>
										</div>
										<div class="col-lg-8">
											<div class="offers_content">
												<div class="offers_price formFoodName" id="formFoodName">${food.data.BZ_NM  }<span>per
														night</span>
												</div>
												<div class="rating_r rating_r_4 offers_rating"
													data-rating="4">
													<i></i> <i></i> <i></i> <i></i> <i></i>
												</div>
												<p class="offers_text">${food.food_menu}</p>
												<div class="offers_icons">
													<ul class="offers_icons_list">
														<li class="offers_icons_item"><img
															src="images/post.png" alt=""></li>
														<li class="offers_icons_item"><img
															src="images/compass.png" alt=""></li>
														<li class="offers_icons_item"><img
															src="images/bicycle.png" alt=""></li>
														<li class="offers_icons_item"><img
															src="images/sailboat.png" alt=""></li>
													</ul>
												</div>


												<form action="">
													<input type="text" class="formFoodName" id="formFoodName"
														value="${food.food_name }"> <input type="text"
														class="formFoodAddress" id="formFoodAddress"
														value="${food.food_address }"> <input type="text"
														class="formFoodX" id="formFoodX" value="${food.food_x }">
													<input type="text" class="formFoodY" id="formFoodY"
														value="${food.food_y }"> <input type="text"
														class="plz" class="plz" value="${food}"> <input
														type="submit" class="button book_button" value="예약"><span></span><span></span><span></span>
													<button class="button book_button">
														book<span></span><span></span><span></span>
													</button>
												</form>


												<div class="offer_reviews">
													<div class="offer_reviews_content">
														<div class="offer_reviews_title">very good</div>
														<div class="offer_reviews_subtitle">100 reviews</div>
													</div>
													<div class="offer_reviews_rating text-center">8.1</div>
												</div>
											</div>
										</div>
									</div>
								</div>


							</c:forEach>
							
							
							
							
							
						</div>

					</div>

					<div class="col-lg-5">
						<div id="mapi" style="width: 500px; height: 400px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e03564b57be53bd6ef508d4c357031e1&libraries=services"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e03564b57be53bd6ef508d4c357031e1"></script>

	<script type="text/javascript">
		window.onload = function() {
			$.ajax({
				type : "POST",
				url : "ajaxFood.do",
				success : function(result) { //서블렛을 통한 결과 값을 받을 수 있습니다.

					console.log(result);
					var data = JSON.parse(result);
					console.log(data);
					console.log(data.data[1].GNG_CS);
					for (var i = 0; i < data.data.length; i++) {
						mapKakao(data, i);
					}

				},

				error : function(e) {
					console.log(e);
					alert('실패했습니다.');
				}

			});
		}

		//카카오 맵 api로 주소 찍기
		//주소 출력하기
		var mapContainer = document.getElementById('mapi'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.8690419, 128.593347), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var mapi = new kakao.maps.Map(mapContainer, mapOption);

		function mapKakao(data, i) {

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			var foodName = data.data[i].BZ_NM;
			var foodAddr = data.data[i].GNG_CS;
			var foodId = data.data[i].OPENDATA_ID;

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(data.data[i].GNG_CS,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : mapi,
								position : coords
							});

							// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
							var iwContent = '<div style="padding:5px;">'
									+ foodName + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
								content : iwContent,
								removable : iwRemoveable
							});

							// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click',
									function() {
										// 마커 위에 인포윈도우를 표시합니다
										infowindow.open(mapi, marker);
									});
							
							
							//화면에 리스트 생성하기
							
							
							
							
							

						}//if

					});//geocoder

		}
	</script>
</body>
</html>