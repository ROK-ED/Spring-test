<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll"
			data-image-src="resources/images/contact_background.jpg"></div>
		<div class="home_content">
			<div class="home_title">foodList</div>
		</div>
	</div>

	<!-- Search -->

	<div class="search">


		<!-- Search Contents -->

		<div class="container fill_height">
			<div class="row fill_height">
				<div class="col fill_height">


					<!-- Search Panel -->

					<div class="search_panel active">
						<form action="" id="search_form_1" method="post"
							class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
							<div class="search_item" >
								<div>위치</div>
								<input type="text" class="food_address search_input" id="food_address">
							</div>
							
							<div class="search_item">
								<div>가게이름</div>
								<input type="text" class="food_name search_input" id="food_name">
							</div>
							
							<div class="search_item">
								<div>메뉴</div>
								<input type="text" class="food_menu search_input" id="food_menu">
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


					<div class="offers_grid">
						<c:forEach items="${foodSelectList }" var="food">
							<div class="offers_item rating_4">
							<div class="row">
								<div class="col-lg-1 temp_col"></div>
								<div class="col-lg-3 col-1680-4">
									<div class="offers_image_container">
										<!-- Image by https://unsplash.com/@kensuarez -->
										<div class="offers_image_background" style="background-image:url(images/offer_1.jpg)"></div>
										<div class="offer_name"><a href="single_listing.html">grand castle</a></div>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="offers_content">
										<div class="offers_price">${food.food_name }<span>per night</span></div>
										<div class="rating_r rating_r_4 offers_rating" data-rating="4">
											<i></i>
											<i></i>
											<i></i>
											<i></i>
											<i></i>
										</div>
										<p class="offers_text">Suspendisse potenti. In faucibus massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu convallis tortor. Lorem ipsum dolor sit amet.</p>
										<div class="offers_icons">
											<ul class="offers_icons_list">
												<li class="offers_icons_item"><img src="images/post.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/compass.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/bicycle.png" alt=""></li>
												<li class="offers_icons_item"><img src="images/sailboat.png" alt=""></li>
											</ul>
										</div>
										<div class="button book_button"><a href="#">book<span></span><span></span><span></span></a></div>
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
			</div>
		</div>



	</div>










	<script type="text/javascript">
	
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
					if(result.length > 0){
						htmlView(result);
						
					}else{
						alert("검색조건을 만족하는 데이터가 없습니다");
						$('#data').val('');
					}
				}
			});
		}
	
	</script>
</body>
</html>