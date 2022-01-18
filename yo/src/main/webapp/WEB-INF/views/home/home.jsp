<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="home" style="height: 100vh;">

	<!-- Home Slider -->

	<div class="home_slider_container">

		<div class="owl-carousel owl-theme home_slider">

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<!-- Image by https://unsplash.com/@anikindimitry -->
				<div class="home_slider_background"
					style="height: 100%; background-image: url(resources/images/home_slider.jpg)"></div>

				<div class="home_slider_content text-center">
					<div class="home_slider_content_inner" data-animation-in="flipInX"
						data-animation-out="animate-out fadeOut">
						<h1>요기</h1>
						<h1>hang</h1>
						<div class="button home_slider_button">
							<div class="button_bcg"></div>
							<a href="placeSelectList.do">place<span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</div>

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<div class="home_slider_background"
					style="background-image: url(resources/images/main_hotel.jpg)"></div>

				<div class="home_slider_content text-center">
					<div class="home_slider_content_inner" data-animation-in="flipInX"
						data-animation-out="animate-out fadeOut">
						<h1>요기</h1>
						<h1>hang</h1>
						<div class="button home_slider_button">
							<div class="button_bcg"></div>
							<a href="hotelSelectList.do">hotel<span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</div>

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<div class="home_slider_background"
					style="background-image: url(resources/images/main_food.jpg)"></div>

				<div class="home_slider_content text-center">
					<div class="home_slider_content_inner" data-animation-in="flipInX"
						data-animation-out="animate-out fadeOut">
						<h1>요기</h1>
						<h1>hang</h1>
						<div class="button home_slider_button">
							<div class="button_bcg"></div>
							<a href="ajaxFoodList.do">food<span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Home Slider Nav - Prev -->
		<div class="home_slider_nav home_slider_prev">
			<svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="28px" height="33px" viewBox="0 0 28 33"
				enable-background="new 0 0 28 33" xml:space="preserve">
					<defs>
						<linearGradient id='home_grad_prev'>
							<stop offset='0%' stop-color='#fa9e1b' />
							<stop offset='100%' stop-color='#8d4fff' />
						</linearGradient>
					</defs>
					<path class="nav_path" fill="#F3F6F9"
					d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
					M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
					C22.545,2,26,5.541,26,9.909V23.091z" />
					<polygon class="nav_arrow" fill="#F3F6F9"
					points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
					11.042,18.219 " />
				</svg>
		</div>

		<!-- Home Slider Nav - Next -->
		<div class="home_slider_nav home_slider_next">
			<svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				width="28px" height="33px" viewBox="0 0 28 33"
				enable-background="new 0 0 28 33" xml:space="preserve">
					<defs>
						<linearGradient id='home_grad_next'>
							<stop offset='0%' stop-color='#fa9e1b' />
							<stop offset='100%' stop-color='#8d4fff' />
						</linearGradient>
					</defs>
				<path class="nav_path" fill="#F3F6F9"
					d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
				M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
				C22.545,2,26,5.541,26,9.909V23.091z" />
				<polygon class="nav_arrow" fill="#F3F6F9"
					points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
				17.046,15.554 " />
				</svg>
		</div>

		<!-- Home Slider Dots -->

		<div class="home_slider_dots">
			<ul id="home_slider_custom_dots" class="home_slider_custom_dots">
				<li class="home_slider_custom_dot active"><div></div>01.</li>
				<li class="home_slider_custom_dot"><div></div>02.</li>
				<li class="home_slider_custom_dot"><div></div>03.</li>
			</ul>
		</div>

	</div>

</div>

<!-- Search -->

<div class="search">


	<!-- Search Contents -->

	<div class="container fill_height">
		<div class="row fill_height">
			<div class="col fill_height">

				<!-- Search Tabs -->

				<div class="search_tabs_container">
					<div
						class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">

						<div
							class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img src="resources/images/suitcase.png" alt="">hotels
						</div>
						<div
							class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
							<img src="resources/images/foodicon2.png" alt="">food
						</div>
					</div>
				</div>



				<div class="search_panel active">
					<form action="hotelResSearch.do" id="search_form_2"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item" style="width: 80%">

							<div>호텔명</div>
							<input type="text" class="destination search_input" id="resName"
								name="resName" required="required">
								<input type="hidden" id="resDate" name="resDate">
						</div>
		
						<button type="submit" class="button search_button">
							검색<span></span><span></span><span></span>
						</button>
					</form>
				</div>

				<!-- Search Panel -->

				<div class="search_panel">
					<form action="#" id="search_form_3"
						class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
						<div class="search_item" style="width: 80%">
							<div>가게명</div>
							<input type="text" class="destination search_input"
								required="required" placeholder="미구현~~~~">
						</div>

						<button class="button search_button">
							검색<span></span><span></span><span></span>
						</button>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- Intro -->

<div class="intro">
	<div class="container">
		<div class="row">
			<div class="col">
				<h2 class="intro_title text-center">최고의 맛집을 추천합니다</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="intro_text text-center">
					<p>더이상 메뉴 선택에 고민하지 마세요! 요기행에서 추천하는 오늘의 맛집들</p>
				</div>
			</div>
		</div>
		<div class="row intro_items">

			<!-- Intro Item -->

			<div class="col-lg-4 intro_col">
				<div class="intro_item">
					<div class="intro_item_overlay"></div>
					<!-- Image by https://unsplash.com/@dnevozhai -->
					<div class="intro_item_background"
						style="background-image: url(./resources/img/food/벤투로소.jpg)"></div>
					<div
						class="intro_item_content d-flex flex-column align-items-center justify-content-center">
						<div class="intro_date">달서구 맛집</div>
						<div class="button intro_button">
							<div class="button_bcg"></div>
							<a href="http://localhost/prj/foodSelectOne.do?food_id=1166&food_location=%EB%8B%AC%EC%84%9C%EA%B5%AC">더보기<span></span><span></span><span></span></a>
						</div>
						<div class="intro_center text-center">
							<h1>벤투로소</h1>
							<div class="intro_price"></div>
							<!-- <div class="rating rating_4">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div> -->
						</div>
					</div>
				</div>
			</div>

			<!-- Intro Item -->

			<div class="col-lg-4 intro_col">
				<div class="intro_item">
					<div class="intro_item_overlay"></div>
					<!-- Image by https://unsplash.com/@hellolightbulb -->
					<div class="intro_item_background"
						style="background-image: url(./resources/img/food/대도양조장.jpg)"></div>
					<div
						class="intro_item_content d-flex flex-column align-items-center justify-content-center">
						<div class="intro_date">중구 맛집</div>
						<div class="button intro_button">
							<div class="button_bcg"></div>
							<a href="http://localhost/prj/foodSelectOne.do?food_id=1609&food_location=%EC%A4%91%EA%B5%AC">더보기<span></span><span></span><span></span></a>
						</div>
						<div class="intro_center text-center">
							<h1>대도양조장</h1>
							<!-- <div class="intro_price">From $1450</div>
							<div class="rating rating_4">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div> -->
						</div>
					</div>
				</div>
			</div>

			<!-- Intro Item -->

			<div class="col-lg-4 intro_col">
				<div class="intro_item">
					<div class="intro_item_overlay"></div>
					<!-- Image by https://unsplash.com/@willianjusten -->
					<div class="intro_item_background"
						style="background-image: url(./resources/img/food/삼수장어.jpg)"></div>
					<div
						class="intro_item_content d-flex flex-column align-items-center justify-content-center">
						<div class="intro_date">수성구 맛집</div>
						<div class="button intro_button">
							<div class="button_bcg"></div>
							<a href="http://localhost/prj/foodSelectOne.do?food_id=372&food_location=%EC%88%98%EC%84%B1%EA%B5%AC">더보기<span></span><span></span><span></span></a>
						</div>
						<div class="intro_center text-center">
							<h1>삼수장어</h1>
							<!-- <div class="intro_price">From $1450</div>
							<div class="rating rating_4">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div> -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<!-- CTA -->



<!-- Offers -->

<div class="offers">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<h2 class="section_title">the best offers with rooms</h2>
			</div>
		</div>
		<div class="row offers_items">

			<!-- Offers Item -->
			<div class="col-lg-6 offers_col">
				<div class="offers_item">
					<div class="row">
						<div class="col-lg-5 col-1680-4">
							<div class="offers_image_container">
								<!-- Image by https://unsplash.com/@kensuarez -->
								<div class="offers_image_background">
									<a href="hotelSelect.do?hotel_id=6"> <img alt="숙소 섬네일"
										src="http://tong.visitkorea.or.kr/cms/resource/48/2384348_image2_1.jpg"
										style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
									</a>
								</div>

							</div>
						</div>
						<div class="col-lg-7">
							<div class="offers_content"></div>
							<div class="row">
								<div class="col-lg-10">
									<div class="offers_price" style="font-size: 20px;">더한옥&스파</div>
								</div>
							</div>
							<div class="offer_reviews">
								<div class="offer_reviews_content">
									<div class="offer_reviews_title"
										style="font-size: 12px; font-weight: 700; color: #2d2c2c; text-transform: uppercase;">70000원</div>
								</div>
							</div>
							<p class="offer_reviews_title" style="color: black;">대구광역시 중구
								서성로16길 46-5</p>
							<p class="offers_text">더한옥&스파</p>

							<div class="button search_button">
								<a href="hotelResForm.do?hotel_id=6">예약<span></span><span></span><span></span></a>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- Offers Item -->
			<div class="col-lg-6 offers_col">
				<div class="offers_item">
					<div class="row">
						<div class="col-lg-5 col-1680-4">
							<div class="offers_image_container">
								<!-- Image by https://unsplash.com/@kensuarez -->
								<div class="offers_image_background">
									<a href="hotelSelect.do?hotel_id=23"> <img alt="숙소 섬네일"
										src="http://tong.visitkorea.or.kr/cms/resource/74/220174_image2_1.jpg"
										style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
									</a>
								</div>

							</div>
						</div>
						<div class="col-lg-7">
							<div class="offers_content"></div>
							<div class="row">
								<div class="col-lg-10">
									<div class="offers_price" style="font-size: 20px;">창앤영펜션</div>
								</div>
							</div>
							<div class="offer_reviews">
								<div class="offer_reviews_content">
									<div class="offer_reviews_title"
										style="font-size: 12px; font-weight: 700; color: #2d2c2c; text-transform: uppercase;">70000원</div>
								</div>
							</div>
							<p class="offer_reviews_title" style="color: black;">대구광역시 달성군 유가읍 휴양림길 532</p>
							<p class="offers_text">창앤영펜션</p>

							<div class="button search_button">
								<a href="hotelResForm.do?hotel_id=23">예약<span></span><span></span><span></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Offers Item -->
			<div class="col-lg-6 offers_col">
				<div class="offers_item">
					<div class="row">
						<div class="col-lg-5 col-1680-4">
							<div class="offers_image_container">
								<!-- Image by https://unsplash.com/@kensuarez -->
								<div class="offers_image_background">
									<a href="hotelSelect.do?hotel_id=24"> <img alt="숙소 섬네일"
										src="http://tong.visitkorea.or.kr/cms/resource/65/2377765_image2_1.jpg"
										style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
									</a>
								</div>

							</div>
						</div>
						<div class="col-lg-7">
							<div class="offers_content"></div>
							<div class="row">
								<div class="col-lg-10">
									<div class="offers_price" style="font-size: 20px;">퀸벨호텔</div>
								</div>
							</div>
							<div class="offer_reviews">
								<div class="offer_reviews_content">
									<div class="offer_reviews_title"
										style="font-size: 12px; font-weight: 700; color: #2d2c2c; text-transform: uppercase;">70000원</div>
								</div>
							</div>
							<p class="offer_reviews_title" style="color: black;">대구광역시 동구 동촌로 200</p>
							<p class="offers_text">퀸벨호텔</p>

							<div class="button search_button">
								<a href="hotelResForm.do?hotel_id=24">예약<span></span><span></span><span></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Offers Item -->
			<div class="col-lg-6 offers_col">
				<div class="offers_item">
					<div class="row">
						<div class="col-lg-5 col-1680-4">
							<div class="offers_image_container">
								<!-- Image by https://unsplash.com/@kensuarez -->
								<div class="offers_image_background">
									<a href="hotelSelect.do?hotel_id=30"> <img alt="숙소 섬네일"
										src="resources/images/noimage.jpg"
										style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
									</a>
								</div>

							</div>
						</div>
						<div class="col-lg-7">
							<div class="offers_content"></div>
							<div class="row">
								<div class="col-lg-10">
									<div class="offers_price" style="font-size: 20px;">한옥게스트하우스 安(Ahn)</div>
								</div>
							</div>
							<div class="offer_reviews">
								<div class="offer_reviews_content">
								<div class="offer_reviews_title"
										style="font-size: 12px; font-weight: 700; color: #2d2c2c; text-transform: uppercase;">70000원</div>
								</div>
							</div>
							<p class="offer_reviews_title" style="color: black;">대구광역시 중구 국채보상로149길 98</p>
							<p class="offers_text">한옥게스트하우스 安(Ahn)</p>

							<div class="button search_button">
								<a href="hotelResForm.do?hotel_id=30">예약<span></span><span></span><span></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>