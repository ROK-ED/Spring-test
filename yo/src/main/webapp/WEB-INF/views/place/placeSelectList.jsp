<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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

						시작




					</div>
				</div>
<!-- 
				<div class="col-lg-5">
					<div id="mapi" style="width: 500px; height: 400px;"></div>
				</div>
-->
			</div>
<!-- 
			<div class="col-lg-12 text-lg-right">
				<div class="room_button">
					<div class="button book_button trans_200">
						<a href="hotelInsertForm.do">등록<span></span><span></span><span></span></a>
					</div>
				</div>
			</div>
-->
		</div>
	</div>


	<!-- Copyright -->

</div>
<!-- 
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d"></script>
	<script>
		var container = document.getElementById('mapi'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};
		
		var mapi = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
 -->