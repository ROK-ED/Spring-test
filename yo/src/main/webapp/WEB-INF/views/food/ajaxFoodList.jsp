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


							<!-- script에서 입력되는 곳 -->


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

					var data = JSON.parse(result);
					//console.log(data);
					//console.log(data.data[1].GNG_CS);
					var offers_grid = document.querySelector('.offers_grid');
					for (var i = 0; i < data.data.length; i++) {
						mapKakao(data, i);
						offers_grid.appendChild(createBody(data, i));
						findImgLink(data.data[i].OPENDATA_ID,data.data[i].BZ_NM);

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

						}//if

					});//geocoder

		}

		//화면에 리스트 생성하기
		function createBody(data, i) {

			var offers_item = document.createElement('div');
			offers_item.setAttribute("class", "offers_item rating_4");

			var row = document.createElement('div');
			row.setAttribute("class", "row");

			// div col_lg_1
			var col_lg_0 = document.createElement('div');
			col_lg_0.setAttribute("class", "col-lg-0 temp_col");

			// div col_lg_5
			var col_lg_5 = document.createElement('div');
			col_lg_5.setAttribute("class", "col-lg-5 col-1680-4");

			var offers_image_container = document.createElement('div');
			offers_image_container.setAttribute("class",
					"offers_image_container");

			var offers_image_background = document.createElement('div');
			offers_image_background.setAttribute("class",
					"offers_image_background");

			var a = document.createElement('a');
			a.setAttribute("href", "foodSelectOne.do?food_id="
					+ data.data[i].OPENDATA_ID);

			var img1 = document.createElement('img');
			img1
					.setAttribute("style",
							"position: absolute; top: 0; left: 0; width: 100%; height: 100%;");

			//var imgSrc = findImgLink(data.data[i].BZ_NM,
			//data.data[i].OPENDATA_ID);
			//console.log("이거는 찍히려나????" + imgSrc);

			img1.setAttribute("src",
					"https://www.daegufood.go.kr/data/food/IMG_93331.jpg");//imgLink());//이미지 주소 함수
			a.appendChild(img1);

			offers_image_background.appendChild(a);

			offers_image_container.appendChild(offers_image_background);

			col_lg_5.appendChild(offers_image_container);

			//div col_lg_7
			var col_lg_7 = document.createElement('div');
			col_lg_7.setAttribute("class", "col-lg-7");

			var offers_content = document.createElement('div');
			offers_content.setAttribute("class", "offers_content");

			var offers_price = document.createElement('div');
			offers_price.setAttribute("class", "offers_price formFoodName");
			offers_price.setAttribute("id", "formFoodName");
			offers_price.textContent = data.data[i].BZ_NM; //음식점 이름

			/*var offers_rating = document.createElement('div');
			offers_rating.setAttribute("class",
			    "rating_r rating_r_4 offers_rating");
			offers_rating.setAttribute("data-ration", "4");
			for (var i = 0; i < 5; i++) {
			    var i = document.createElement('i');
			    offers_rating.appendChild(i);
			}*/

			var offers_text = document.createElement('p');
			offers_text.setAttribute("class", "offers_text");

			if (data.data[i] != null) {
				offers_text.textContent = data.data[i].MNU; //음식 설명
			}

			var book_button = document.createElement('div');
			book_button.setAttribute("class", "button book_button");

			var aBtn = document.createElement('a');
			aBtn.setAttribute("href", "FoodResForm.do?food_id="
					+ data.data[i].OPENDATA_ID);
			aBtn.textContent = "예약"

			for (var i = 0; i < 3; i++) {
				var span = document.createElement('span');
				aBtn.appendChild(span);

			}
			book_button.appendChild(aBtn);

			var offer_reviews = document.createElement('div');
			offer_reviews.setAttribute("class", "offer_reviews");

			var offer_reviews_content = document.createElement('div');
			offer_reviews_content
					.setAttribute("class", "offer_reviews_content");

			var offer_reviews_title = document.createElement('div');
			offer_reviews_title.setAttribute("class", "offer_reviews_title");
			offer_reviews_title.textContent = "very good";
			offer_reviews_content.appendChild(offer_reviews_title);

			var offer_reviews_subtitle = document.createElement('div');
			offer_reviews_subtitle.setAttribute("class",
					"offer_reviews_subtitle");
			offer_reviews_content.textContent = "100 reviews";
			offer_reviews_content.appendChild(offer_reviews_subtitle);

			var offer_reviews_rating = document.createElement('div');
			offer_reviews_rating.setAttribute("class",
					"offer_reviews_rating text-center");
			offer_reviews_rating.textContent = "8.1";

			offer_reviews.appendChild(offer_reviews_content);
			offer_reviews.appendChild(offer_reviews_rating);

			offers_content.appendChild(offers_price);

			// offers_content.appendChild(offers_rating);

			offers_content.appendChild(offers_text);

			offers_content.appendChild(offer_reviews);
			col_lg_7.appendChild(offers_content);

			row.append(col_lg_0, col_lg_5, col_lg_7);

			// row.appendChild(col_lg_4);
			// row.appendChild(col_lg_4);
			offers_item.appendChild(row);
			return offers_item;

		}

		function findImgLink(food_id, food_name) {
			console.log("음식점 이름!!! === " + food_name);

			$.ajax({
				type : "POST",
				url : "oneImgCrawl.do",
				data : {
					"food_id" : food_id,
					"food_name" : food_name

				},
				success : function(result) { //서블렛을 통한 결과 값을 받을 수 있습니다.
					//console.log("결과......" + result);
					console.log("제발...")
					//return result;

				},

				error : function(e) {
					console.log(e);
					//alert('실패했습니다.');
				}

			});
		}
	</script>
</body>
</html>