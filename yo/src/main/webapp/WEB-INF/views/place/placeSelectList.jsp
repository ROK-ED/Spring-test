<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background: url(./resources/img/category.png) no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>
<!-- 
<link rel="stylesheet" type="text/css"
	href="resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/offers_responsive.css">
 -->
<div class="super_container">

	<!-- Header -->
	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/about_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">장소</div>
		</div>
	</div>

	<!-- Offers -->

	<div class="offers" style="padding-top: 0px">

		<!-- Search -->

		<!-- <div class="search">
			<div class="search_inner">

				Search Contents

				<div class="container fill_height no-padding">
					<div class="row fill_height no-margin">
						<div class="col fill_height no-padding">




							<div class="search_panel active">

								<form action="#" id="search_form_1"
									class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
									<div class="search_item">
										<br> <br>
										<div>이름</div>
										<input type="text" class="destination search_input"
											required="required">
									</div>
									
									<button class="button search_button">
										search<span></span><span></span><span></span>
									</button>
								</form>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div> -->

		<!-- Offers -->

		<div class="container" style="max-width: 1648.3px; height: 1200px">
			<div style="padding-bottom: 10px">여백~~~~~~~~</div>
			<div id="clickLatlng"></div>


			<div class="col-lg-12 text-lg-right" style="height: 100px">
				<!-- 
				<div class="weather"
					style="background: #fa9e1b; color: white; width: 100px; font-size: 15px; border-radius: 5px;">
					<div>
						<img class="CurrIcon">
					</div>
					<div class=""></div>
					<div class="CurrTemp"></div>
					<div class="City"></div>
				</div>
				 -->
				<button type="button" onclick="ajaxInsert()" id="form_submit_button"
					class="form_submit_button button trans_200 "
					style="padding-top: 0px; margin-top: 0px">
					예정추가<span></span><span></span><span></span>
				</button>
			</div>
			<div class="row" style="height: 1200px">


				<div class="col-lg-7">

					<!-- Offers Grid -->
					<!-- 내용물~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
					<div class="offers_grid">
						<h3 id="iframeAddress"></h3>
						<h3 id="iframeTitle"></h3>
						<iframe id="iframeShow" src="" width="100%" height="900px"
							style="background: linear-gradient(to top right, #fa9e1b, #8d4fff); border: 0px;"></iframe>
					</div>

					<br>
				</div>
				<br>
				<!-- 내용물~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<!-- 지도~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<div class="col-lg-5">
					<div class="map_wrap" style="width: 100%; height: 900px;">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						<ul id="category">
							<li id="AT4" data-order="0"><span class="category_bg bank"></span>
								관광<br>&nbsp;</li>
							<li id="PK6" data-order="1"><span class="category_bg mart"></span>
								주차장<br>&nbsp;</li>
							<li id="HP8, PM9" data-order="2"><span
								class="category_bg pharmacy"></span> 병원<br>약국</li>
							<li id="OL7" data-order="3"><span class="category_bg oil"></span>
								주유소<br>&nbsp;</li>
							<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
								카페<br>&nbsp;</li>
							<li id="MT1, CS2" data-order="5"><span
								class="category_bg store"></span> 마트<br>편의점</li>
						</ul>
					</div>
				</div>
				<!-- 지도~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->


			</div>
		</div>


		<!-- Copyright -->

	</div>
</div>

<!-- kakaomap 사용 및 appkey /services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d80e5a0baade8c2e7bcb777ff68c73a4&libraries=services,clusterer,drawing"></script>
<script>

	var testx = null;
	var testy = null;
	var testtitle = null;
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({
		zIndex : 1
	}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	markers = [], // 마커를 담을 배열입니다
	currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

	<%String id = (String) session.getAttribute("member_email");%>
	var testemail='<%=(String) session.getAttribute("member_email")%>';
	
	<%if (id == null) {%>//로그인 안했을시 기본위치: 예담
		testx = 128.593347;
		testy = 35.8690419;
		
		console.log('false');
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(testy, testx), // 지도의 중심좌표
			level : 1 // 지도의 확대 레벨
		};
	<%} else {%>//로그인 햇을시 자신이 등록한 위치
		
		testx = '<%=(double) session.getAttribute("member_x")%>';
		testy = '<%=(double) session.getAttribute("member_y")%>
	';

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(testy, testx), // 지도의 중심좌표
		level : 1
	// 지도의 확대 레벨
	};
<%}%>
	//날씨 만들기/////////////////////////////////////////////////////////////////

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map);

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
		if (target.addEventListener) {
			target.addEventListener(type, callback);
		} else {
			target.attachEvent('on' + type, callback);
		}
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
		if (!currCategory) {
			return;
		}

		// 커스텀 오버레이를 숨깁니다 
		placeOverlay.setMap(null);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		ps.categorySearch(currCategory, placesSearchCB, {
			useMapBounds : true
		});
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
			displayPlaces(data);
		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		} else if (status === kakao.maps.services.Status.ERROR) {
			// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

		}
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		var order = document.getElementById(currCategory).getAttribute(
				'data-order');

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = addMarker(new kakao.maps.LatLng(places[i].y,
					places[i].x), order);

			// 마커와 검색결과 항목을 클릭 했을 때
			// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			(function(marker, place) {
				kakao.maps.event.addListener(marker, 'click', function() {
					displayPlaceInfo(place);
				});
			})(marker, places[i]);
		}
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
		var imageSrc = './resources/img/category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(11, 28)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo(place) {

		var content = '<div class="placeinfo" onclick="onClickData()" style="padding-bottom: 0;">'
				+ '   <a class="title" id="' + place.place_url + '" target="i_a" target="_blank" title="' + place.place_name + '" style="color: white;" >'
				+ place.place_name + '</a>';

		if (place.road_address_name) {
			content += '    <span title="' + place.road_address_name + '">'
					+ place.road_address_name
					+ '</span>'
					+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
					+ place.address_name + ')</span>';
		} else {
			content += '    <span title="' + place.address_name + '">'
					+ place.address_name + '</span>';
		}

		content += '    <span class="tel">' + place.phone + '</span>'
				+ '</div>' + '<div class="after"></div>';

		contentNode.innerHTML = content;
		placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		//console.log("==========================================================")
		//console.log(new kakao.maps.LatLng(place.y, place.x).La);
		testx = new kakao.maps.LatLng(place.y, place.x).La;
		//console.log(new kakao.maps.LatLng(place.y, place.x).Ma);
		testy = new kakao.maps.LatLng(place.y, place.x).Ma
		placeOverlay.setMap(map);
		
		///이거되냐/////////////////////////////////////////
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=" +testy+ "&lon=" +testx+ "&lang=kr&appid=0f31f112ce8af804a6241206b1d57dec&units=metric";
    $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {
            console.log(resp);
            console.log("현재온도 : "+ (resp.main.temp) );
            console.log("현재습도 : "+ resp.main.humidity);
            console.log("날씨 : "+ resp.weather[0].main );
            console.log("상세날씨설명 : "+ resp.weather[0].description );
            console.log("날씨 이미지 : "+ resp.weather[0].icon );
            console.log("바람   : "+ resp.wind.speed );
            console.log("나라   : "+ resp.sys.country );
            console.log("도시이름  : "+ resp.name );
            console.log("구름  : "+ (resp.clouds.all) +"%" );   
            
            var $Icon = (resp.weather[0].icon);
            var $Temp = Math.floor(resp.main.temp) + 'º';
            var $city = resp.name;

            //$('.CurrIcon').append('http://openweathermap.org/img/wn/'+$Icon+'@2x.png');
            $('.CurrIcon').attr('src','http://openweathermap.org/img/wn/'+$Icon+'@2x.png');
            $('.CurrTemp').empty();
            $('.CurrTemp').prepend($Temp);
            $('.City').empty();
            $('.City').append($city);
        }
    })

	}

	// 지도를 클릭한 위치에 표출할 마커입니다//////////////////////////////////////////////////////////
	var marker = new kakao.maps.Marker({
		// 지도 중심좌표에 마커를 생성합니다 
		position : map.getCenter()
	});
	// 지도에 마커를 표시합니다
	marker.setMap(map);

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

		// 클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;

		// 마커 위치를 클릭한 위치로 옮깁니다
		marker.setPosition(latlng);

		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';

		var resultDiv = document.getElementById('clickLatlng');
		resultDiv.innerHTML = message;

	});
	///////////////////////////////////////////////////////////////////////////////////////////////

	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
		var category = document.getElementById('category'), children = category.children;

		for (var i = 0; i < children.length; i++) {
			children[i].onclick = onClickCategory;
		}
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
		var id = this.id, className = this.className;

		placeOverlay.setMap(null);

		if (className === 'on') {
			currCategory = '';
			changeCategoryClass();
			removeMarker();
		} else {
			currCategory = id;
			changeCategoryClass(this);
			searchPlaces();
		}
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
		var category = document.getElementById('category'), children = category.children, i;

		for (i = 0; i < children.length; i++) {
			children[i].className = '';
		}

		if (el) {
			el.className = 'on';
		}
	}
	// 클릭시 데이터 가져오기 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	function onClickData() {
		//console.log(testx);
		//console.log(testy);
		//console.log(this);
		//console.log(this.event);
		//console.log("실행되냐");
		var path = this.event.path[1].children[0].id;
		//console.log("path :" +path);

		$.ajax({
			url : "ajaxPlace.do",
			type : "post",
			data : {
				"path" : path
			},
			dataType : "json",
			success : function(result) {
				//console.log("검색되냐?");
				//console.log(typeof result);
				//console.log(result);
				//console.log(result.path);

				//console.log(result.title_text);
				testtitle = result.title_text;
				//console.log(testtitle);
				//$('#iframeShow').attr({'src','result.path'});
				document.getElementById('iframeShow').setAttribute('src',
						result.path);

				//location.reload();
			},
			error : function() {
				alert("검색 과정에서 오류가 발생했습니다.");
				location.reload();

			}
		});

	}

	function ajaxInsert() {
		console.log(testx);
		console.log(testy);
		console.log(testtitle);
		console.log(testemail);
		console.log(this);
		console.log(this.event);
		console.log("실행되냐");

		$.ajax({
			url : "ajaxInsert.do",
			type : "post",
			data : {
				"testx" : testx,
				"testy" : testy,
				"testtitle" : testtitle,
				"testemail" : testemail
			},
			dataType : "text",
			success : function(result) {
				console.log(result);
				console.log("등록되냐?");
				alert(result);

				//location.reload();
			},
			error : function() {
				alert("로그인을 먼저 해주세요");
				//location.reload();

			}
		});

	}
</script>