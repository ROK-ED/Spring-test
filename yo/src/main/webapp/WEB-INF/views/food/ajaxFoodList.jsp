<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/offers_responsive.css">
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



		<div class="offers">







			<div class="search">
				<div class="search_inner">

					<!-- Search Contents -->

					<div class="container fill_height no-padding">
						<div class="row fill_height no-margin">
							<div class="col fill_height no-padding">




								<!---------------- Search Panel-------------- -->




								<div class="search_panel active">

									<div id="search_form_1"
										class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
										<div class="search_item">
											<br> <br>
											<div>위치</div>
											<select name="form_food_location" id="form_food_location"
												class="dropdown_item_select search_input">
												<option>전체</option>
												<option>달서구</option>
												<option>중구</option>
												<option>서구</option>
												<option>북구</option>
												<option>남구</option>
												<option>수성구</option>
												<option>달성군</option>
											</select>
										</div>





										<div class="search_item">
											<br> <br>
											<div>가게명</div>
											<input type="text" class="destination search_input"
												id="form_food_name" name="form_food_name" value="">
										</div>


										<div class="search_item">
											<br> <br>
											<div>분류</div>
											<select name="form_food_class" id="form_food_class"
												class="dropdown_item_select search_input">
												<option>선택</option>
												<option>한식</option>
												<option>중식</option>
												<option>일식</option>
												<option>양식</option>
												<option>세계요리</option>
												<option>디저트/베이커리</option>
												<option>전통차/커피전문점</option>
												<option>특별한 술집</option>
											</select>
										</div>

										<div class="more_options" style="padding-bottom: 100px;">
											<div class="more_options_trigger">
												<a href="#">옵션 더보기</a>
											</div>
											<ul class="more_options_list clearfix">
												<li class="more_options_item">
													<div class="clearfix">
														<input type="checkbox" id="more_options_1"
															class="search_extras_cb"> <label
															for="more_options_1">주차장</label>
													</div>
												</li>
											</ul>
										</div>
										<br>
										<br>





										<button class="button search_button" onclick="searchData()">
											검색<span></span><span></span><span></span>
										</button>
									</div>
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


					<div class="col-lg-7" style="overflow: auto;">
						<div class="offers_grid">
							<div>
								<table id="mTable" class="table table-bordered">

									<!-- <tbody class="table_body" >
										<!-- script에서 입력되는 곳 
									</tbody> -->
								</table>
							</div>


						</div>
						<br> <br> <br> <br> <br> <br> <br>
					</div>

					<div class="col-lg-5">
						<br> <br>
						<div id="mapi" style="width: 100%; height: 600px;"></div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e03564b57be53bd6ef508d4c357031e1&libraries=services"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e03564b57be53bd6ef508d4c357031e1"></script>

	<script type="text/javascript">
	
		$(document).ready(function() {
			
			if (${foodList} == -1) {
				alert("검색 결과가 없습니다");
			} else {

				if (document.querySelector("#table_body") != null) {
					console.log("tbody 있음!!!!!!")
					//var table_body = document.querySelector("#table_body");

					$("#table_body").remove(); // div#main 없애기
					$("#table_head").remove();
				}
				var table_body = document.createElement('tbody');
				table_body.setAttribute("class", "table_body");
				table_body.setAttribute("id", "table_body");

				var table_head = document.createElement('tbody');
				table_head.setAttribute("class", "table_head");
				table_head.setAttribute("id", "table_head");

				console.log(${foodList});
				var data = ${foodList};
				
				console.log(data);
				var mTable = document.querySelector('#mTable');

				for (var i = 0; i < data.length; i++) {

					//var findImg = findImgLink(data[i].OPENDATA_ID);
					table_body.appendChild(createBody(data, i));///데이터 출력하기
					findImgLink(data[i].OPENDATA_ID);
					//console.log(table_body);

				}

				mapKakao(data, $('#form_food_location').val());//mapKakao(data, i, $('#form_food_location').val());

				if (data.length == 0) {
					alert("검색 결과가 없습니다")
				} else {
					var tr = document.createElement('tr');
					var th = document.createElement('th');

					th.textContent = "검색 결과 : " + data.length + "건";
					tr.append(th);
					table_head.append(tr);
					mTable.append(table_head);
					mTable.append(table_body);

				}

			}
			
			
			//카카오 맵 api로 주소 찍기
			//주소 출력하기
			var testx = null;
			var testy = null;
			<%String id = (String) session.getAttribute("member_email");%>
			var testemail='<%=(String) session.getAttribute("member_email")%>';
			
			<%if (id == null) {%>//로그인 안했을시 기본위치: 예담
				testx = 128.593347;
				testy = 35.8690419;
				
				
			<%} else {%>//로그인 햇을시 자신이 등록한 위치
				
				testx = '<%=(double) session.getAttribute("member_x")%>';
				testy = '<%=(double) session.getAttribute("member_y")%>';
			<%}%>
			
			var mapContainer = document.getElementById('mapi'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(testy, testx), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var mapi = new kakao.maps.Map(mapContainer, mapOption);

		});

		function searchData() {
			var food_location = "";
			var food_name = "";
			var food_class = "";
			var park_check = "";
			food_name = ($('#form_food_name').val() != null) ? $(
					'#form_food_name').val() : "";
			food_location = ($('#form_food_location').val() != null) ? $(
					'#form_food_location').val() : "";
			food_class = ($('#form_food_class').val() != "선택") ? $(
					'#form_food_class').val() : "";
			park_check = $('#ckBox').is(':checked');
			///////////////////////////////////////////////////위에 보기

			console.log("주소 확인 ==================================="
					+ food_location);
			console
					.log("이름 확인 ==================================="
							+ food_name);
			console.log("분류 확인 ==================================="
					+ food_class);
			var searchLocation = document.querySelector('.searchLocation');

			//searchLocation.value = food_location;
			$.ajax({
				type : "POST",
				url : "ajaxFood.do",
				data : {
					"food_location" : food_location,
					"food_name" : food_name,
					"food_class" : food_class,
					"park_check" : park_check
				},
				success : function(result) { //서블렛을 통한 결과 값을 받을 수 있습니다.

					if (result == -1) {
						alert("검색 결과가 없습니다");
					} else {

						if (document.querySelector("#table_body") != null) {
							console.log("tbody 있음!!!!!!")
							//var table_body = document.querySelector("#table_body");

							$("#table_body").remove(); // div#main 없애기
							$("#table_head").remove();
						}
						var table_body = document.createElement('tbody');
						table_body.setAttribute("class", "table_body");
						table_body.setAttribute("id", "table_body");

						var table_head = document.createElement('tbody');
						table_head.setAttribute("class", "table_head");
						table_head.setAttribute("id", "table_head");

						console.log("222222222222222222");
						var data = JSON.parse(result);
						console.log(data);
						var mTable = document.querySelector('#mTable');

						for (var i = 0; i < data.length; i++) {

							//var findImg = findImgLink(data[i].OPENDATA_ID);
							table_body.appendChild(createBody(data, i));///데이터 출력하기
							findImgLink(data[i].OPENDATA_ID);
							//console.log(table_body);

						}

						mapKakao(data, $('#form_food_location').val());//mapKakao(data, i, $('#form_food_location').val());

						if (data.length == 0) {
							alert("검색 결과가 없습니다")
						} else {
							var tr = document.createElement('tr');
							var th = document.createElement('th');

							th.textContent = "검색 결과 : " + data.length + "건";
							tr.append(th);
							table_head.append(tr);
							mTable.append(table_head);
							mTable.append(table_body);

						}

					}

				},

				error : function(e) {
					console.log(e);
					alert('실패했습니다.');
				}

			});
		}

		function findImgLink(food_id) {

			var tmp = "imgA" + food_id;
			var imgA = document.getElementsByClassName(tmp);

			//console.log("food_id 확인하기 ====================" + food_id);
			//console.log(imgA)

			//console.log("음식점 번호!!! === " + food_id);

			$
					.ajax({
						type : "POST",
						url : "foodImgSelectOne.do",
						data : {
							"food_id" : food_id

						},
						success : function(result) { //서블렛을 통한 결과 값을 받을 수 있습니다.

							//var foodImg = findImgLink(data[i].OPENDATA_ID );
							//	result = decodeURIComponent(result)+"";
							//console.log("================이미지.. 나와야함..."	+ result);

							if (result != "") {

								var temp = result + "";
								//	console.log("5555555555555555이미지.. 나와야함..."	+ temp);
								var img = document.createElement('img');
								img
										.setAttribute("style",
												"position: absolute; top: 0; left: 0; width: 100%; height: 100%;");

								img.setAttribute("src", temp); ///////////////////////////////////////////수정
								imgA[0].appendChild(img);

							} else if (result == "") {
								console.log("이미지 안나옴... 엑박처리");
								var img = document.createElement('img');
								img
										.setAttribute("style",
												"position: absolute; top: 0; left: 0; width: 100%; height: 100%;");
								img.setAttribute("src",
										"resources/images/noimage.jpg");
								imgA.appendChild(img);

							} else {
								console.log("이미지 안나옴... 엑박처리");
								var img = document.createElement('img');
								img
										.setAttribute("style",
												"position: absolute; top: 0; left: 0; width: 100%; height: 100%;");
								img.setAttribute("src",
										"resources/images/noimage.jpg");
								imgA.appendChild(img);
							}

							return result;

						},

						error : function(e) {
							console.log(e);
							//alert('실패했습니다.');
						}

					});
		}

		//지도 찍기..........
		var marker;
		function mapKakao(data, food_location) {

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			//console.log("번호 확인하기 ==============="+foodId);

			var mapContainer = document.getElementById('mapi'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(35.8690419, 128.593347), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var mapi = new kakao.maps.Map(mapContainer, mapOption);

			//for (var i = 0; i < data.length; i++) {

			marker = $(data)
					.map(
							function(i, data) {
								console
										.log("aal;skdjf;lajsdflj;lasjdf;lkjas;dkfj;lakjsd;flkj");

								var foodName = data.BZ_NM + "";
								var foodAddr = data.GNG_CS + "";
								var foodId = data.OPENDATA_ID + "";
								console.log("가게명! ================" + foodName);

								var loc = data.GNG_CS;

								var check = loc.substr(6, 3);
								console.log("정규식 확인학 =========" + check);

								// 주소로 좌표를 검색합니다
								geocoder
										.addressSearch(
												foodAddr,
												function(result, status) {
													//console.log("카카오 맵 나와주세요.......... ========================"+ foodAddr);

													// 정상적으로 검색이 완료됐으면 
													if (status === kakao.maps.services.Status.OK) {

														var coords = new kakao.maps.LatLng(
																result[0].y,
																result[0].x);

														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new kakao.maps.Marker(
																{
																	map : mapi,
																	position : coords
																});

														// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
														var iwContent = '<div style="padding:5px;">'
																+ foodName
																+ '<br>'
																+ '<a href="foodSelectOne.do?food_id='
																+ foodId
																+ '&food_location='
																+ check
																+ '">상세보기</a>'

																+ '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
														iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

														// 인포윈도우를 생성합니다
														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : iwContent,
																	removable : iwRemoveable
																});
														// 마커에 클릭이벤트를 등록합니다
														kakao.maps.event
																.addListener(
																		marker,
																		'click',
																		function() {
																			// 마커 위에 인포윈도우를 표시합니다
																			infowindow
																					.open(
																							mapi,
																							marker);
																		});//addListener
													}//if 

												});//geocoder

							});//map

			//} //for
		}

		//화면에 리스트 생성하기
		function createBody(data, i) {

			// console.log("333333333333333");

			var tr = document.createElement('tr');

			var td = document.createElement('td');
			var offers_item = document.createElement('div');
			offers_item.setAttribute("class", "offers_item rating_4");

			var row = document.createElement('div');
			row.setAttribute("class", "row");

			var col_lg_0 = document.createElement('div');
			col_lg_0.setAttribute('class', "col-lg-0 temp_col")

			var col_lg_5 = document.createElement('div');
			col_lg_5.setAttribute("class", "col-lg-5 col-1680-4");

			var offers_image_container = document.createElement('div');
			offers_image_container.setAttribute("class",
					"offers_image_container");

			var offers_image_background = document.createElement('div');
			offers_image_background.setAttribute("class",
					"offers_image_background");

			var loc = data[i].GNG_CS;

			var check = loc.substr(6, 3);
			//console.log("정규식 확인학 ========="+check);	

			var imgA = document.createElement('a');
			var tmp = "imgA" + data[i].OPENDATA_ID;/////////////////////////=======================
			imgA.setAttribute("class", tmp);
			imgA.setAttribute("id", tmp);
			imgA.setAttribute("href", "foodSelectOne.do?food_id="
					+ data[i].OPENDATA_ID + "&food_location=" + check) //////////////////////////////////////수정2

			/*  var foodImg = findImgLink(data[i].OPENDATA_ID );
			console.log("================이미지.. 나와야함..."+foodImg);
			
			if (foodImg != null) {
				console.log("5555555555555555이미지.. 나와야함...");
			    var img = document.createElement('img');
			    img.setAttribute("style", "position: absolute; top: 0; left: 0; width: 100%; height: 100%;");
			    img.setAttribute("src",foodImg);///////////////////////////////////////////수정
			    imgA.appendChild(img);
			    
			} else {
			    var img = document.createElement('img');
			    img.setAttribute("style", "position: absolute; top: 0; left: 0; width: 100%; height: 100%;");
			    img.setAttribute("src", "resources/images/noimage.jpg");
			    imgA.appendChild(img);

			}  */

			offers_image_background.appendChild(imgA);
			offers_image_container.appendChild(offers_image_background);
			col_lg_5.appendChild(offers_image_container);

			var col_lg_7 = document.createElement('div');
			col_lg_7.setAttribute("class", "col-lg-7");

			var offers_content = document.createElement('div');
			offers_content.setAttribute("class", "offers_content");

			var offers_price = document.createElement('div');
			offers_price.setAttribute("class", "offers_price");
			offers_price.setAttribute("style", "line-height: 1.2em");
			offers_price.textContent = data[i].BZ_NM; //////////////////////////////

			var offer_reviews = document.createElement('div');
			offer_reviews.setAttribute("class", "offer_reviews");

			var offers_text = document.createElement('p');
			offers_text.setAttribute("class", "offers_text");
			if (data[i].SMPL_DESC != null) {
				offers_text.textContent = data[i].SMPL_DESC;//////////////////////////////여기에 음식점 설명 or 메뉴 
			}

			var book_button = document.createElement('div');
			book_button.setAttribute("class", "button book_button");

			var bookA = document.createElement('a');
			bookA.setAttribute('href',

			"foodResForm.do?food_id=" + data[i].OPENDATA_ID + "&food_name="
					+ data[i].BZ_NM + "&food_location=" + data[i].GNG_CS);/////일단은 그냥 해둠... 
			bookA.textContent = "예약";
			for (var i = 0; i < 3; i++) {
				var span = document.createElement('span');
				bookA.appendChild(span);
			}
			book_button.appendChild(bookA);

			col_lg_7.appendChild(offers_content);
			col_lg_7.appendChild(offers_price);
			col_lg_7.appendChild(offer_reviews);
			col_lg_7.appendChild(offers_text);
			col_lg_7.appendChild(book_button);

			row.appendChild(col_lg_5);
			row.appendChild(col_lg_7);
			td.appendChild(row);

			tr.appendChild(td);

			//tbody.appendChild(tr);

			return tr;

		}

		////////////////////////사진 저장 fnc
		/*		 function findImgLink(food_id, food_name) {
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
		 */
	</script>
</body>
</html>