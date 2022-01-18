<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<title>Contact</title>
<link rel="stylesheet" type="text/css"
	href="resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/styles/contact_responsive.css">
<meta charset="utf-8">
</head>

<body>
	<div class="super_container">

		<!-- Header -->



		<!-- Home -->

		<div class="home">
			<div class="home_background parallax-window" data-parallax="scroll"
				data-image-src="resources/images/foodList_background.jpg"></div>
			<div class="home_content">
				<div class="home_title">contact</div>
			</div>
		</div>

		<!-- Contact -->

		<div class="contact_form_section">
			<div class="container">

				<!-- Contact Form -->
				<div class="contact_form_container">

					<div class="contact_title text-center">식당 예약</div>

					<form action="foodResInsert.do" id="foodForm" name="foodForm"
						class="contact_form text-left">
						<div class="row">
							<div class="col-lg-5">
								<div class="contact_title text-center">

									<div id="form_food_name" name="form_food_name">
										<h3 id="res_food_name">${food_name}</h3>
										<br>
									</div>
									<div id="form_food_address" name="form_food_address">
										<h3 id="res_food_location">${food_location}</h3>
										<br>
									</div>
									<!-- 달력 -->
									<div id="food_address" name="food_address">
										<div id="res_text">예약일:</div>
										<body onload="autoReload();">
											<table align="center" id="calendar">
												<tr>
													<td><a id="before" href="javascript:beforem()"></a></td>
													<td colspan="4" align="center">
														<div id="yearmonth"></div>
													</td>
													<td><a id="next" href="javascript:nextm()"></a></td>
													<td><a href="javascript:thisMonth()">오늘</a></td>
												</tr>
												<tr>
													<td width="14%">월</td>
													<td width="14%">화</td>
													<td width="14%">수</td>
													<td width="14%">목</td>
													<td width="14%">금</td>
													<td width="14%"><font color="#009de0">토</font></td>
													<td width="14%"><font color="#ed5353">일</font></td>
												</tr>
											</table>
										</body>

										<br> <br>
									</div>



								</div>
							</div>
							<div class="col-lg-7">

								<div class="contact_title text-center">
									<div id="mapi" style="width: 100%; height: 480px;"></div>
								</div>

								<div class="contact_title text-right">
									<button type="button" onclick="subm()" id="form_submit_button"
										class="form_submit_button button trans_200">
										예약하기<span></span><span></span><span></span>
									</button>
								</div>
							</div>
						</div>
						<input type="hidden" id="reservation_date1"
							name="reservation_date1"> <input type="hidden"
							id="reservation_food_id" name="reservation_food_id"
							value="${food_id}"> <input type="hidden"
							id="reservation_food_name" name="reservation_food_name"
							value="${food_name }"> <input type="hidden"
							id="reservation_food_res_name" name="reservation_food_res_name"
							value="${food_res_name }"> <input type="hidden"
							id="reservation_food_location" name="reservation_food_location"
							value="${food_location }"> <input type="hidden"
							id="reservation_member_email" name="reservation_member_email"
							value="${sessionScope.member_email }">
						
					</form>
				</div>


			</div>

		</div>
	</div>


	<!-- About -->


	<!-- Google Map -->



	<!-- Footer -->

	<!-- Copyright -->

	<script src="resources/js/contact_custom.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('mapi'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.8690419, 128.593347), // 지도의 중심좌표
			level : 3
		};

		// 지도를 생성합니다    
		var mapi = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다

		var geocoder = new kakao.maps.services.Geocoder();
		var food_name = "${food_name}";
		var food_location_map = "${food_location}";
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
						var iwContent = '<div style="padding:5px; color: black; font-size:50%;">'
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
	</script>

	<script type="text/javascript">
		//예약일체크
		function subm() {
			if (document.getElementById('reservation_date1').value == null
					|| document.getElementById('reservation_date1').value == "")
				window.alert("예약일을 선택해주세요");
			else
				document.getElementById('foodForm').submit();
		}
	</script>

	<script language="javascript">
		//달력
		var today = new Date(); //오늘 날짜        
		var date = new Date();

		//이전달
		function beforem() //이전 달을 today에 값을 저장
		{
			today = new Date(today.getFullYear(), today.getMonth() - 1, today
					.getDate());
			document.getElementById('reservation_date1').value = ""
			document.getElementById('res_text').innerText = '예약일:'
			autoReload(); //만들기
		}
		
		//다음달
		function nextm() //다음 달을 today에 저장
		{
			today = new Date(today.getFullYear(), today.getMonth() + 1, today
					.getDate());
			document.getElementById('reservation_date1').value = ""
			document.getElementById('res_text').innerText = '예약일:';
			autoReload();

		}

		//오늘선택
		function thisMonth() {
			today = new Date();
			document.getElementById('reservation_date1').value = ""
			document.getElementById('res_text').innerText = '예약일:'
			autoReload();
		}

		function autoReload() {

			var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
			var lastDate = new Date(today.getFullYear(), today.getMonth() + 1,
					0); //현재 달의 마지막 날
			var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
			var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
			yearmonth.innerHTML = today.getFullYear() + "년 "
					+ (today.getMonth() + 1) + "월"; //년도와 월 출력

			if (today.getMonth() + 1 == 12) //  눌렀을 때 월이 넘어가는 곳
			{
				before.innerHTML = (today.getMonth()) + "월"
						+ "<";
			next.innerHTML="1월"+">";

			} else if (today.getMonth() + 1 == 1) //  1월 일 때
			{
				before.innerHTML = "12월" + "<";
				next.innerHTML = (today.getMonth() + 2) + "월" + ">";
			} else //   12월 일 때
			{
				before.innerHTML = (today.getMonth()) + "월" + "<";
				next.innerHTML = (today.getMonth() + 2) + "월" + ">";
			}

			// 남은 테이블 줄 삭제
			while (tbcal.rows.length > 2) {
				tbcal.deleteRow(tbcal.rows.length - 1);
			}
			var row = null;
			row = tbcal.insertRow();
			var cnt = 0;
			var dayCheck = (nMonth.getDay() == 0) ? 7 : nMonth.getDay(); //일요일을 마지막으로 넣기 위해서.

			// 1일 시작칸 찾기
			for (i = 0; i < (dayCheck - 1); i++) {
				cnt = cnt + 1; //요일값
				cell = row.insertCell();

				if (i > 4) { //주말
					cell.style.backgroundColor = "#f7f7f7";
				}
			}

			//여기서 현재년도랑 월 찾아놓기
			var thiyear = today.getFullYear();
			var thimonth = today.getMonth() + 1;

			if (thimonth < 10)
				thimonth = "0" + thimonth;

			// 달력 출력 
			for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
			{
				cell = row.insertCell();
				var thiday = i;
				if (thiday < 10)
					thiday = "0" + thiday;
				var str = "";

				str += "<div id='" + i + "' onclick='resSelFnc(" + i + ")'>"
						+ i + "</div>"; //클릭펑션 추가

				cell.innerHTML = str;

				cnt = cnt + 1;
				if (cnt % 7 == 6) {//토요일
					var str = "";
					str += "<div id='" + i + "' onclick='resSelFnc(" + i
							+ ")'>" + i + "</div>"; //나중에 원하는 날에 일정을 넣기위해 id값을 날자로 설정

					str += "</div>";
					cell.innerHTML = str;
					cell.style.color = "#009de0";

				}
				if (cnt % 7 == 0) { //일요일
					var str = "";
					str += "<div id='" + i + "' onclick='resSelFnc(" + i
							+ ")'>" + i + "</div>"; //나중에 원하는 날에 일정을 넣기위해 id값을 날자로 설정

					str += "</div>";
					cell.innerHTML = str;
					row = calendar.insertRow();// 줄 추가
					cell.style.color = "#ed5353";

				}

				//마지막 날짜가 지나면 일요일까지 칸 그리기
				if (lastDate.getDate() == i && ((cnt % 7) != 0)) {
					var add = 7 - (cnt % 7);
					for (var k = 1; k <= add; k++) {
						cell = row.insertCell();
						cnt = cnt + 1;
					}
				}

				//오늘날짜배경색
				if (today.getFullYear() == date.getFullYear()
						&& today.getMonth() == date.getMonth()
						&& i == date.getDate()) {
					cell.style.backgroundColor = "#e2f3da"; //오늘날짜배경색
				}

				//마지막 날짜가 지나면 일요일까지 칸 그리기
				if (lastDate.getDate() == i && ((cnt % 7) != 0)) {
					var add = 7 - (cnt % 7);
					for (var k = 1; k <= add; k++) {
						cell = row.insertCell();
						cnt = cnt + 1;
					}
				}

			}

		}

		function resSelFnc(i) {
			autoReload();
			var x = document.getElementById(i);
			var txt = document.getElementById('res_text');

			var month = document.getElementById('yearmonth').innerText;
			txt.innerText = '예약일:' + month + ' ' + i + '일';

			//저장할 데이터 잘라내기

			var yea = today.getFullYear() + "";
			var ye = yea.substring(2, 4);
			var mon = today.getMonth() + 1;
			var da = i;
			if (i < 10)
				da = '0' + i;
			if (mon < 10)
				mon = '0' + mon;
			var resdat = document.getElementById('reservation_date1');
			resdat.value = ye + mon + da;

			//

			x.style.backgroundColor = 'black';
		}
		function resFull() {

		}
	</script>
</body>

</html>