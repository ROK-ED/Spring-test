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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

/* 레이아웃 외곽 너비 400px 제한*/
.wrap {
	max-width: 480px;
	margin: 0 auto; /* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: block;
	float: left;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url(./resources/img/starrate/starrate.png);
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
}

.rating .ratefill {
	background-color: #fa9e1b;
	width: 0;
	height: 60px;
	position: absolute;
}

.review_textarea {
	margin: 10px;
}

.cmd {
	margin-top: 20px;
	text-align: right;
}

.cmd input[type="button"] {
	padding: 10px 20px;
	border: 1px solid #e8e8e8;
	background-color: #fff;
	background-color: #000;
	color: #fff;
}

.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 20px;
	margin: 10px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
	box-sizing: border-box;
}
</style>
<script>
	function delet() {
		var p = document.delfnc;
		p.submit();
	}
</script>
</head>

<body>

	<div class="super_container">




		<!-- Home -->

		<div class="home">

			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/foodList_background.jpg"></div>


			<div class="home_content">
				<div class="home_title">food</div>
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

							<!-- food Info -->

							<div class="food_info">
								<!-- Title -->
								<div class="food_title_container d-flex flex-lg-row flex-column">
									<div class="food_title_content">
										<br> <br> <input type="hidden" class="food_id"
											id="food_id" value='${jsonModel.getString("OPENDATA_ID")}'>
										<h1 class="food_title">${jsonModel.getString("BZ_NM")}</h1>
										<input type="hidden" class="food_name" id="food_name"
											value='${jsonModel.getString("BZ_NM")}'>
										<div class="food_info_text"></div>
										<br>
										<div class="food_location">${jsonModel.getString("GNG_CS")}</div>
										<input type="hidden" class="food_location_map"
											id="food_location_map"
											value='${jsonModel.getString("GNG_CS")}'>
									</div>
									<div class="food_title_button ml-lg-auto text-lg-right">

										<div class="room_text" id="printStar">

											<!-- 별찍기 넣을 곳 -->

										</div>
									</div>
								</div>
								<br>
								<div class="food_info_text">

									설명 : ${jsonModel.getString("SMPL_DESC")} <br> <br> 메뉴
									: ${jsonModel.getString("MNU")} <br> <br> 주차장 :
									${jsonModel.getString("PKPL")} <br> <br>

								</div>
								<!-- Listing Image -->

								<div class="food_image">

									<!-- 이미지 들어가는 곳 -->
								</div>




								<div class="col-lg-12 text-lg-right">
									<div class="room_button">
										<div class="button book_button trans_200">
											<a
												href="foodResForm.do?food_id=${jsonModel.getString('OPENDATA_ID')}&food_name=${jsonModel.getString('BZ_NM')}&food_location=${jsonModel.getString('GNG_CS')}">예약<span></span><span></span><span></span></a>
										</div>
										<!-- 예약은 id로 넘겨서 내용 받아오기  -->
									</div>
								</div>


								<!------------ 리뷰! ---------------->
								<div class="review_wrap">
									<h1>후기</h1>


									<form name="reviewform" class="reviewform" method="get"
										action="foodReviewInsert.do">
										<input type="hidden" class="rate" name="rate" id="rate" /> <input
											type="hidden" name="review_member_email"
											id="review_member_email" class="review_member_email"
											value="${sessionScope.member_email != null? sessionScope.member_email:''}">
										<input type="hidden" name="review_food_id"
											class="review_food_id" id="review_food_id"
											value='${jsonModel.getString("OPENDATA_ID")}'> <input
											type="hidden" class="form_food_location"
											id="form_food_location" name="form_food_location"
											value='${jsonModel.getString("GNG_CS")}'>



										<p class="title_star">리뷰를 남겨주세요.</p>
<!-- 
										<div class="review_rating_click">
											<div class="warning_msg">별점을 선택해 주세요.</div>
											<div class="rating">
												<div class="ratefill"></div>
												해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용
												<input type="checkbox" name="rating" id="rating1" value="1"
													class="rate_radio" title="1점"> <label for="rating1"></label>
												<input type="checkbox" name="rating" id="rating2" value="2"
													class="rate_radio" title="2점"> <label for="rating2"></label>
												<input type="checkbox" name="rating" id="rating3" value="3"
													class="rate_radio" title="3점"> <label for="rating3"></label>
												<input type="checkbox" name="rating" id="rating4" value="4"
													class="rate_radio" title="4점"> <label for="rating4"></label>
												<input type="checkbox" name="rating" id="rating5" value="5"
													class="rate_radio" title="5점"> <label for="rating5"></label>
											</div>
										</div>
-->
										
										<div class="review_contents">
											<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
											<textarea rows="3" class="review_textarea"
												id="review_textarea" name="review_textarea"></textarea>
										</div>





										<div class="cmd">
											<input type="submit" name="save" id="save" value="등록">
										</div>
									</form>
								</div>

								<br> <br>
								<ul class="table print_review" id="print_review">

									<!-- 리뷰 출력 -->

								</ul>






								<!-- Location on Map -->

								<!-- <div class="location_on_map" > -->
								<div id="mapi" style="width: 100%; height: 800px;"></div>
								<!--</div> -->
								<div class="col-lg-11 text-lg-right">
									<%-- 	<div class="room_button">
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
								</div> --%>
								</div>
							</div>
						</div>
					</div>
				</div>


				<%-- <form action="hotelDelete.do" id="delfnc" name="delfnc" method="post">
				<input type="hidden" id="food_id" name="food_id"
					value="${hotel.hotel_id }">
			</form> --%>

			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script src="resources/plugins/easing/easing.js"></script>
	<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
	<script src="resources/plugins/colorbox/jquery.colorbox-min.js"></script>
	<script src="resources/js/single_listing_custom.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e03564b57be53bd6ef508d4c357031e1&libraries=services"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e03564b57be53bd6ef508d4c357031e1"></script>

	<script>
		//이미지 크롤링 해오기
		window.onload = function() {
			$.ajax({
				url : "imgListCrawl.do",
				type : "POST",
				data : {
					"food_id" : $("#food_id").val()
				},
				success : function(result) {
					if (result.length > 0) {
						//$('.food_image').appendChild(img);
						var food_image = document
								.getElementsByClassName('food_image')[0];

						for (var i = 0; i < result.length; i++) {

							var img = document.createElement('img');
							img.setAttribute("src", result[i]);
							img.setAttribute("style",
									"height:100%; width:100%;");
							food_image.appendChild(img)
							console.log(result[i]);

						}//for

						//drawStar($("#food_id").val());//별찍기
						mapKakao();//지도 그리기
						showReview($("#food_id").val());//리뷰 출력하기

					} else {
						alert("ㅠㅠㅠ");
					}
				}

			});
		}

		//==================================별찍기

		function drawStar(food_id) {

			// console.log("됨!!!!! wpqkf!!!!"+food_id);/////////////////////////////////////////////////////////////////////////////////////////여기하기...

			$.ajax({
				url : "showRate.do",
				type : "POST",
				data : {
					"review_food_id" : food_id
				},
				success : function(result) {

					$('#printStar').textContext = result.review_hit
					/* for (var i = 0; i < result.review_rate; i++) {
						0
					} */
					console.log(result);

				}

			})
		}

		//==================================

		//=====================댓글 출력   ====================

		function showReview(food_id) {
			console.log(food_id);
			$
					.ajax({
						url : "showReview.do",
						data : {
							"review_food_id" : food_id
						},
						type : "POST",
						success : function(result) {

							console.log(result);
							var reveiw = document
									.querySelector('#print_review');

							//reveiw.setAttribute("style", "border:1;");

							for (var i = 0; i < result.length; i++) {
								var review_li = document.createElement('li');

								var review_div = document.createElement('div');
								//var re_id = "re"+result[i].review_id

								var review_head = document.createElement('div');
								review_head
										.setAttribute("style",
												"width:100%; float:left; font-size:20px;");
								var review_head1 = document
										.createElement('div');
								var reveiw_email = result[i].review_member_email == null ? "비회원"
										: result[i].review_member_email;
								review_head1.textContent = reveiw_email;

								var review_head2 = document
										.createElement('div');//여기에 별 찍을거임..
								//console.log("별점수 화인"+result[i].review_rate);
								//console.log("별점수 화인"+ typeof result[i].review_rate);
								/* for (var i = 0; i < result[i].review_rate ; i++) {
									var star = document.createElement('i');
									star.setAttribute("class", "fa fa-star");
									review_head2.append(star); 
									console.log(i+"==번째 출력됨 ====");
								}  */

								review_head1.setAttribute("style",
										"float:left;");
								review_head2.setAttribute("style",
										"float:left;");
								review_head.append(review_head1, review_head2);

								//review_div.append(review_head1, review_head2);
								//review_thead.append(review_tr1);

								var review_body = document.createElement('div');
								review_body.setAttribute("style",
										"height:80px; width:100%; float:left;");

								var review_content = document
										.createElement('div');
								var br = document
								.createElement('br');
								
								
								review_content.textContent = result[i].review_subject;
								review_content.setAttribute("id", "review_"
										+ result[i].review_id);
								review_content.setAttribute("style",
										"font-size:30px;");
								review_content.append(br);
								review_body.append(review_content);

								if ($('#review_member_email').val() == result[i].review_member_email) {

									/* var review_form = document.createElement('div');
									review_form.setAttribute("deleteReview.do");
									review_form.setAttribute("method","get");
									
									
									
									review_del_submit = document.createElement('submit');
									review_del_submit.setAttribute("type","submit");
									review_del_submit.setAttribute("value","삭제");
									review_form.append(review_del_input,review_del_submit);
									 */

									var review_del_input = document
											.createElement('input');
									review_del_input.setAttribute("type",
											"hidden");
									review_del_input.setAttribute("value",
											result[i].review_id);
									review_del_input.setAttribute("name",
											"review_id_del");
									review_del_input.setAttribute("id",
											"review_id_del");

									var tdBtn = document.createElement('div');
									tdBtn.setAttribute("style",
											"width:200px; float:right;");
									var upBtn = document.createElement('input');
									upBtn.setAttribute("value", "수정");
									upBtn
											.setAttribute("style",
													"width:50px; height:30px; margin:10px; float:right;");
									upBtn.setAttribute("type", "button");
									upBtn.setAttribute("onclick", "reviewUp("
											+ result[i].review_id + ")");

									var delBtn = document
											.createElement('input');
									//delBtn.setAttribute("value","삭제");
									delBtn
											.setAttribute("style",
													"width:50px; height:30px; margin:10px; float:right;");
									delBtn.setAttribute("type", "button");
									var str = "delBtn" + result[i].review_id;
									delBtn.setAttribute("id", "delBtn");
									delBtn.setAttribute("class", "delBtn");
									delBtn.setAttribute("onclick", "reviewDel("
											+ result[i].review_id + ")");

									delBtn.textContent = "삭제";
									delBtn.setAttribute("value", "삭제");

									tdBtn.append(delBtn, upBtn,
											review_del_input);

									review_body.append(tdBtn);
								}

								//review_tbody.append(review_tr2);

								// var table_div = document.createElement('div');
								// table_div.append(review_thead, review_tbody);
								review_div.append(review_head, review_body);
								review_li.append(review_div);
								
								
								//delBtn.setAttribute("value","삭제");
								
								reveiw.append(review_li);
						

							}

						}

					})
		}

		function reviewDel(review_id) {

			console.log(review_id);

			console.log("삭제버튼 누르면 떠야함 =====");

			$.ajax({
				url : "deleteReview.do",
				type : "POST",
				data : {
					"review_id" : review_id
				},
				success : function(result) {
					console.log(result);
					alert("리뷰가 삭제되었습니다");
					location.reload();
				}

			})
		}

		function reviewUp(review_id) {

			console.log(review_id);
			var review_form = document.createElement('form');
			var review_textarea = document.createElement('textarea');
			review_textarea.textContent = $('#review_' + review_id).text();
			review_textarea.setAttribute("style", "width:100%;");
			review_textarea.setAttribute("id", "textarea_" + review_id);
			var submit = document.createElement('input');
			submit.setAttribute("type", "button");
			submit.setAttribute("value", "저장");

			submit.setAttribute("onclick", "reviewSubmit(" + review_id + ")");

			var back = document.createElement('input');
			back.setAttribute("type", "button");
			back.setAttribute("value", "취소");
			back.setAttribute("onclick", "reviewBack()");

			review_form.append(review_textarea, back, submit);

			$('#review_' + review_id).replaceWith(review_form);

			//출처: //https:// freehoon.tistory.com/121 [훈잇 블로그]

			console.log("삭제버튼 누르면 떠야함 =====");
			//var review_id = $(this).attr('id');
			//console.log("리뷰 id 값 확인 ====="+review_id);
			/* var delBtn = document.getElementById("delBtn");
			delBtn.onclick = function () {
				
				
			} */
			//console.log("리뷰 id 값 확인 ====="+$("#review_food_id").val());
			/*  $.ajax({
				url : "deleteReview.do",
				type : "POST",
				data : {
					"review_id" : review_id
				},
				success : function(result) {
					console.log(result);
					alert("리뷰가 삭제되었습니다");
					location.reload();
				}
				
			}) */
		}
		function reviewBack() {
			alert("취소되었습니다");
			location.reload();
		}
		function reviewSubmit(review_id) {
			var inner_value = $("#textarea_" + review_id).val();
			console.log("확인" + review_id + ": " + inner_value);

			$.ajax({
				url : "updateReview.do",
				type : "POST",
				data : {
					"review_id" : review_id,
					"review_subject" : inner_value
				},
				success : function(result) {
					console.log(result);
					alert("리뷰가 수정되었습니다");
					location.reload();
				}

			})
		}

		//=====================댓글 출력 끗=====================

		//////////////////////////////////////댓글 입력

		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							//별점선택 이벤트 리스너
							document
									.querySelector('.rating')
									.addEventListener(
											'click',
											function(e) {
												let elem = e.target;
												if (elem.classList
														.contains('rate_radio')) {
													rating
															.setRate(parseInt(elem.value));
												}

											})

							//상품평 작성 글자수 초과 체크 이벤트 리스너
							document
									.querySelector('.review_textarea')
									.addEventListener(
											'keydown',
											function() {
												//리뷰 400자 초과 안되게 자동 자름
												let review = document
														.querySelector('.review_textarea');
												let lengthCheckEx = /^.{400,}$/;
												if (lengthCheckEx
														.test(review.value)) {
													//400자 초과 컷
													review.value = review.value
															.substr(0, 400);
												}
											});

							//저장 전송전 필드 체크 이벤트 리스너
							document
									.querySelector('#save')
									.addEventListener(
											'click',
											function(e) {
												//별점 선택 안했으면 메시지 표시
												if (rating.rate == 0) {
													rating.showMessage('rate');
													return false;
												}

												//리뷰 5자 미만이면 메시지 표시
												if (document
														.querySelector('.review_textarea').value.length < 5) {
													rating
															.showMessage('review');
													return false;
												}

												if (document
														.querySelector('#review_member_email').value.length < 3) {
													console
															.log("길이 확인 =================="
																	+ document
																			.querySelector('.review_member_email').value.length);

													alert("로그인 후 사용해 주세요");
													return false;
												}

												///////////////////////======================================욕 필터링 시도햇다가 넘긴부분...ㅠ
												var badWord = "/[바보|멍청이]/g"
												if (document
														.querySelector('.review_textarea').value
														.search(badWord) != -1) {
													rating.showMessage('word');
													return false;
												}

												///////////////////////======================================빨리하고 다시하자..

												//폼 서밋
												//실제로는 서버에 폼을 전송하고 완료 메시지가 표시되지만 저장된 것으로 간주하고 폼을 초기화 함.
												alert("저장완료!");
												rating.setRate(0);
												document
														.querySelector('.review_textarea').value = '';
											});
						});

		//별점 마킹 모듈 프로토타입으로 생성
		function Rating() {
		};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate) {
			//별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
			console.log("this 확인 ============" + this.rate.value);
			document.querySelector('.ratefill').style.width = parseInt(newrate * 60)
					+ 'px';
			let items = document.querySelectorAll('.rate_radio');
			console.log("newrate 값 =============" + newrate);
			document.getElementById('rate').setAttribute("value", newrate);

			items.forEach(function(item, idx) {
				if (idx < newrate) {
					item.checked = true;
				} else {
					item.checked = false;
				}
			});
		}

		Rating.prototype.showMessage = function(type) {//경고메시지 표시
			switch (type) {

			case 'review':
				//안내메시지 표시
				document.querySelector('.review_contents .warning_msg').style.display = 'block';
				//지정된 시간 후 안내 메시지 감춤
				setTimeout(
						function() {
							document
									.querySelector('.review_contents .warning_msg').style.display = 'none';
						}, 1000);
				break;
			case 'emailError':
				alert("로그인 후 사용해 주세요");
				break;
			case 'word':

				alert('사용할 수 없는 단어가 포함되어 있습니다');
				break;

			}
		}

		let rating = new Rating();//별점 인스턴스 생성

		/////////// ///////////////////////////별찍기끗

		//=============================지도=============================
		//카카오 맵 api로 주소 찍기
		//주소 출력하기
		var mapContainer = document.getElementById('mapi'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.8690419, 128.593347), // 지도의 중심좌표
			level : 3
		};

		// 지도를 생성합니다    
		var mapi = new kakao.maps.Map(mapContainer, mapOption);

		function mapKakao() {

			// 주소-좌표 변환 객체를 생성합니다

			var geocoder = new kakao.maps.services.Geocoder();
			var food_name = document.querySelector('.food_name').value;
			var food_location_map = document
					.querySelector('.food_location_map').value;
			console.log("음식점 이름 ============" + food_name);
			console.log("음식점 주소ㅓ ============" + food_location_map);
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(food_location_map,
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
							var iwContent = '<div style="padding:10px; ">'
									+ food_name + '</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
									//iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
								position : coords,
								content : iwContent
							//removable : iwRemoveable
							});

							infowindow.open(mapi, marker);

							var moveLatLon = new kakao.maps.LatLng(result[0].y,
									result[0].x);
							mapi.setCenter(moveLatLon);

						}//if

					});//geocoder

		}
	</script>
</body>

</html>