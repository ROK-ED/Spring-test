<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<style>
.wrap {
	z-index: 2;
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
	position: absolute;
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
							<c:forEach items="${foodSelectList }" var="food">
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
												<div class="offers_price formFoodName" id="formFoodName">${food.food_name }<span>per
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





	<script type="text/javascript">
		
	</script>
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
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d&libraries=services"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d&libraries=drawing"></script>

	<script>
		var formFoodX = document.getElementById('formFoodX').value;
		var formFoodY = document.getElementById('formFoodY').value;

		var formFoodName = document.getElementById('formFoodName').value;
		var formFoodAddress = document.getElementById('formFoodAddress').value;
		var formData = document.getElementById('plz');

		//Object mapData = 4462e52d;
		//var resultDataAAA= System.identityHashCode(mapData);
		//console.log(mapData);  

		//console.log(formData)
		/* var mapData = [];
		var data = $
		{
			mapSelectList
		};

		console.log("vzxchkljsdlkjsfdkljsfdalksfdlkasfd        " + data);
		 */
		//검색 데이터
		function searchData() {
			$.ajax({
				url : "foodSelectOption.do",
				type : "post",
				data : {
					"key" : $("#key option:selected").val(),
					"data" : $("#data").val()
				},
				dataType : "json",
				success : function(result) {
					if (result.length > 0) {
						htmlView(result);

					} else {
						alert("검색조건을 만족하는 데이터가 없습니다");
						$('#data').val('');
					}
				}
			});
		}

		/* // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		 */
		var mapContainer = document.getElementById('mapi'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(formFoodY, formFoodX), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var mapi = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(mapi);
		var count = 0;

		//센터가 바뀔때 다시 로딩하기
		kakao.maps.event
				.addListener(
						mapi,
						'center_changed',
						function() {

							var level = mapi.getLevel();

							var latlng = mapi.getCenter();

							// 카테고리로 음식점을 검색합니다
							ps.categorySearch('FD6', placesSearchCB, {
								useMapBounds : true
							});

							// 키워드 검색 완료 시 호출되는 콜백함수 입니다
							function placesSearchCB(data, status, pagination) {
								if (status === kakao.maps.services.Status.OK) {
									for (var i = 0; i < data.length; i++) {
										displayMarker(data[i]);
									}
								}
							}

							// 지도에 마커를 표시하는 함수입니다
							function displayMarker(place) {
								var content = '<div class="wrap" id="mapWrap'
										+ (count++)
										+ '">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '           '
										+ place.place_name
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
										+ '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
										+ '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
										+ '            </div>'
										+ '        </div>' + '    </div>'
										+ '</div>';

								// 마커를 생성하고 지도에 표시합니다
								var marker = new kakao.maps.Marker({
									map : mapi,
									position : new kakao.maps.LatLng(place.y,
											place.x)
								});

								// 마커에 클릭이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'click',
										function() {
											/* // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
											infowindow
													.setContent('<div style="padding:5px;font-size:12px;">'
															+ place.place_name +
															 place.phone +
															'</div>');
											infowindow.open(mapi, marker); */

											// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
											//document.getElementById("mapWrap").style.display="block";
											overlay.setMap(mapi);

										});//마커 클릭 이벤트 끗...

								var overlay = new kakao.maps.CustomOverlay({
									content : content,
									position : marker.getPosition()
								});

							}

						}); //center_changed 찾는거 addEvent()
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
		function closeOverlay() {
			//document.getElementById("mapWrap").style.display="none";

			overlay.setMap(null);
		}
	</script>

</body>
</html>