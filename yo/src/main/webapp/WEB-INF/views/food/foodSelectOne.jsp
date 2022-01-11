<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Single Listing</title>


<link href="resources/plugins/colorbox/colorbox.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" type="text/css"
	href="resources/styles/single_listing_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/single_listing_responsive.css">
<script>
	function delet() {
		var p = document.delfnc;
		p.submit();
	}
	
	</script>
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

							<div class="food_info">
								<!-- Title -->
								<div
									class="food_title_container d-flex flex-lg-row flex-column">
									<div class="food_title_content">
										<h1>니가 확인할부분</h1>
										<input type="text" class="food_id" id="food_id"
											value='${jsonModel.getString("OPENDATA_ID")}'>
										<h1 class="food_title">${jsonModel.getString("BZ_NM")}</h1>
										<div class="food_info_text">
											<%-- 	<c:if test="${hotel.hotel_tel eq null}">
									번호가 등록되지 않았습니다.
									</c:if> --%>
											음식점 번호
										</div>
										<div class="food_location">${jsonModel.getString("GNG_CS")}</div>
									</div>
									<div class="food_title_button ml-lg-auto text-lg-right">
										<br>
										<div class="room_text">
										<%--	<h2>
												가격 들어가는 곳인데 빼도 될듯원
												<h3></h3> --%>
										</div>


									</div>
								</div>

								<!-- Listing Image -->

								<div class="food_image">
									이미지 위치
									<%-- <c:if test="${hotel.hotel_picture ne null }"><img src="resources/img/${hotel.hotel_pfile }" alt=""></c:if>
									<c:if test="${hotel.hotel_picture eq null }"><img src="resources/images/noimage.jpg" alt=""></c:if>
 --%>
								</div>

								<!-- Hotel Gallery -->


								<!-- Hotel Info Text -->

								<div class="food_info_text">
									info 들어가는 곳
									<%-- <c:if test="${hotel.hotel_content eq null}">
									등록된 내용이 없습니다.
									</c:if>
									<p>${hotel.hotel_content }</p>--%>
								</div>

								<div class="col-lg-12 text-lg-right">
									<div class="room_button">
										<div class="button book_button trans_200">
											<a href="hotelResForm.do?hotel_id=">예약<span></span><span></span><span></span></a>
										</div>
										<!-- 예약은 id로 넘겨서 내용 받아오기  -->
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
										<c:if
											test="${sessionScope.member_email eq hotel.hotel_enroll_email}">
											<div class="button book_button trans_200">
												<a href="hotelUpadteForm.do?hotel_id=${hotel.hotel_id }">수정<span></span><span></span><span></span></a>
											</div>
										</c:if>
										<c:if
											test="${sessionScope.member_email eq hotel.hotel_enroll_email || sessionScope.member_author eq 'ADMIN' }">
											<div class="button book_button trans_200">
												<a href="javascript:delet()">삭제<span></span><span></span><span></span></a>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<form action="hotelDelete.do" id="delfnc" name="delfnc" method="post">
				<input type="hidden" id="food_id" name="food_id"
					value="${hotel.hotel_id }">
			</form>
			<!-- Footer -->

			<!-- Copyright -->


		</div>

		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

		<script src="resources/plugins/easing/easing.js"></script>
		<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
		<script src="resources/plugins/colorbox/jquery.colorbox-min.js"></script>
		<script src="resources/js/single_listing_custom.js"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d"></script>
		<script>//지도
		
		window.onload = function () {
			$.ajax({
				url : "imgListCrawl.do",
				type:"POST",
				data : {"food_id" : $("#food_id").val()},
				success:function(result){
					if(result.length>0){
						//$('.food_image').appendChild(img);
						var food_image = document.getElementsByClassName('food_image')[0];
						
						for(var i = 0;i<result.length;i++){
							var img = document.createElement('img');
							img.setAttribute("src",result[i]);
							
							food_image.appendChild(img)
							console.log(result[i]);
						}
					}
					else{
						alert("ㅠㅠㅠ");
					}
				}
			})
		}
		
		/* var container = document.getElementById('mapi'); //지도를 담을 영역의 DOM 레퍼런스
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
		infowindow.open(mapi, marker);  */
	</script>
</body>

</html>