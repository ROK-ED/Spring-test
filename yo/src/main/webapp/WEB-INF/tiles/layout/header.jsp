<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header">

	<!-- Top Bar -->

	<div class="top_bar">
		<div class="container">
			<div class="row">
				<div class="col d-flex flex-row">
					<div class="phone">+45 345 3324 56789</div>
					<div class="social">
						<ul class="social_list">
							<li class="social_list_item"><a href="#"><i
									class="fa fa-pinterest" aria-hidden="true"></i></a></li>
							<li class="social_list_item"><a href="#"><i
									class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li class="social_list_item"><a href="#"><i
									class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li class="social_list_item"><a href="#"><i
									class="fa fa-dribbble" aria-hidden="true"></i></a></li>
							<li class="social_list_item"><a href="#"><i
									class="fa fa-behance" aria-hidden="true"></i></a></li>
							<li class="social_list_item"><a href="#"><i
									class="fa fa-linkedin" aria-hidden="true"></i></a></li>
						</ul>
					</div>
					<div class="user_box ml-auto">
						<c:choose>
							<c:when test="${sessionScope.member_email == null }">
								<!-- 로그인 전 -->
								<div class="user_box_login user_box_link">
									<a href="memberLoginForm.do">login</a>
								</div>
								<div class="user_box_register user_box_link">
									<a href="memberJoinForm.do">회원가입</a>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 로그인 후 -->
								<div class="user_box_register user_box_link">
									${sessionScope.member_nick }님(${sessionScope.member_author }),
									환영합니다.</div>
								<div class="user_box_login user_box_link">
									<a href="memberLogout.do">LOGOUT</a>
								</div>
								<div class="user_box_register user_box_link">
									<a href="memberselectForm.do">마이페이지</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Navigation -->

	<nav class="main_nav">
		<div class="container">
			<div class="row">
				<div
					class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
					<div class="logo_container">
						<div class="logo">
							<a href="home.do"><img src="resources/images/logo.png" alt="">yogihang</a>
						</div>
					</div>
					<div class="main_nav_container ml-auto">
						<ul class="main_nav_list">
							<li class="main_nav_item" style="margin-right: 15px;"><a href="placeSelectList.do">place</a></li>
							<li class="main_nav_item" style="margin-right: 15px;"><a href="hotelSelectList.do">hotel</a></li>
							<li class="main_nav_item" style="margin-right: 15px;"><a href="ajaxFoodList.do">food</a></li>
							<li class="main_nav_item" style="margin-right: 15px;"><a href="reservation.do">reservation</a></li>
							<li class="main_nav_item" style="margin-right: 15px;"><a href="boardSelectList.do">board</a></li>
							<li class="main_nav_item" style="margin-right: 15px;"><a href="chat.do">chat</a></li>
							<c:if test="${sessionScope.member_author == 'ADMIN' }">
								<li class="main_nav_item" style="margin-right: 15px;"><a href="memberSelectList.do" >회원목록(ADMIN)</a></li>
							</c:if>
						</ul>
					</div>
					<div class="">
						<div class="weather"
							style="color: white; width: 75px; font-size: 15px; display: inline-block;">
							<div>
								<img class="CurrIcon" style="width: 75px;">
							</div>
							<div class="CurrTemp" style="display: inline-block;"></div>
							<div class="City" style="display: inline-block;" ></div>
						</div>
					</div>

					<form id="search_form" class="search_form bez_1">
						<input type="search" class="search_content_input bez_1">
					</form>

					<div class="hamburger">
						<i class="fa fa-bars trans_200"></i>
					</div>
				</div>
			</div>
		</div>
	</nav>

</header>

<div class="menu trans_500">
	<div
		class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
		<div class="menu_close_container">
			<div class="menu_close"></div>
		</div>
		<div class="logo menu_logo">
			<a href="home.do"><img src="resources/images/logo.png" alt=""></a>
		</div>
		<ul>
			<li class="menu_item"><a href="home.do">yogihang</a></li>
			<li class="menu_item"><a href="placeSelectList.do">place</a></li>
			<li class="menu_item"><a href="hotelSelectList.do">hotel</a></li>
			<li class="menu_item"><a href="ajaxFoodList.do">food</a></li>
			<li class="menu_item"><a href="reservation.do">reservation</a></li>
			<li class="menu_item"><a href="boardSelectList.do">board</a></li>
			<li class="menu_item"><a href="chat.do">chat</a></li>
			<c:if test="${sessionScope.member_author == 'ADMIN' }">
				<li class="menu_item"><a href="memberSelectList.do">회원목록(ADMIN)</a></li>
			</c:if>
		</ul>
	</div>
</div>

<script type="text/javascript">
window.onload = function a(testy, testy) {
	var testx = 128.593347;
	var testy = 35.8690419;
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
            $('.CurrTemp').prepend($Temp);
            $('.City').append($city);
        }
    })
}
</script>

