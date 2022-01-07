<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
    	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Single Listing</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/styles/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/styles/single_listing_styles.css">
<link rel="stylesheet" type="text/css" href="resources/styles/single_listing_responsive.css">
</head>

<body>

<div class="super_container">
	
	<!-- Header -->


		<!-- Top Bar -->

		<!-- Main Navigation -->





	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="resources/images/single_background.jpg"></div>
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
							<div class="hotel_title_container d-flex flex-lg-row flex-column">
								<div class="hotel_title_content">
									<h1 class="hotel_title">${hotel.hotel_title }</h1>
									<div class="hotel_info_text">
									<c:if test="${hotel.hotel_tel eq null}">
									번호가 등록되지 않았습니다.
									</c:if>
									${hotel.hotel_tel }</div>
									<div class="hotel_location">${hotel.hotel_address }</div>
								</div>
								<div class="hotel_title_button ml-lg-auto text-lg-right">
									<br>
									<div class="room_text"><h2>${hotel.hotel_price }원<h3></h3></div>
										
									
								</div>
							</div>

							<!-- Listing Image -->

							<div class="hotel_image">
								<img src="resources/images/listing_hotel.jpg" alt="">
								
							</div>

							<!-- Hotel Gallery -->

					
							<!-- Hotel Info Text -->

							<div class="hotel_info_text">
								<p>${hotel.hotel_content }</p>
							</div>
						
							<div class="col-lg-12 text-lg-right">
								<div class="room_button">
									<div class="button book_button trans_200"><a href="hotelResForm.do?hotel_id=${hotel.hotel_id }">예약<span></span><span></span><span></span></a></div>
								</div>
							</div>
						
						<!-- Rooms -->


						<!-- Reviews -->

					
						<!-- Location on Map -->

						<div class="location_on_map">
							<div class="location_on_map_title">location on map</div>

							<!-- Google Map -->
						
						<div id="mapi" style="width: 100%; height: 800px;"></div>
						

						</div>
						<div class="col-lg-11 text-lg-right">
								<div class="room_button">
									<div class="button book_button trans_200"><a href="hotelUpadteForm.do?hotel_id=${hotel.hotel_id }">수정<span></span><span></span><span></span></a></div>
									<div class="button book_button trans_200"><a href="hotelResForm.do?hotel_id=${hotel.hotel_id }">삭제<span></span><span></span><span></span></a></div>
								</div>
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
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="resources/js/single_listing_custom.js"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d"></script>
	<script>
		var container = document.getElementById('mapi'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(${hotel.hotel_locx },${hotel.hotel_locy }), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var mapi = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		var markerPosition  = new kakao.maps.LatLng(${hotel.hotel_locx }, ${hotel.hotel_locy }); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(mapi);

		var iwContent = '<div style="padding:5px; color: black; font-size:70%;">${hotel.hotel_title }</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(${hotel.hotel_locx }, ${hotel.hotel_locy }); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(mapi, marker); 
	</script>
</body>

</html>