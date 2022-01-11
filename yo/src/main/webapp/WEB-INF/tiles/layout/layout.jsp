<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/styles/bootstrap4/bootstrap.min.css">
<link href="resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="resources/styles/responsive.css">
<link rel="stylesheet" type="text/css" href="resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="resources/styles/contact_responsive.css">

<!-- 검색창 왼쪽으로 가는것 필요한 페이지에 직접 넣기 -->
<!-- 
<link rel="stylesheet" type="text/css" href="resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="resources/styles/offers_responsive.css">
 -->
</head>

<body>
<div class="super_container">
	
	<!-- Header -->

	<tiles:insertAttribute name="header" />

	<!-- Home -->

	<tiles:insertAttribute name="body" />
	<!-- Footer -->

	<tiles:insertAttribute name="footer" />

</div>

<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/styles/bootstrap4/popper.js"></script>
<script src="resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="resources/plugins/easing/easing.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
<!-- 
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
 -->
<script src="resources/js/contact_custom.js"></script>

<script src="resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="resources/plugins/easing/easing.js"></script>
<script src="resources/js/offers_custom.js"></script>
<script src="resources/plugins/greensock/TweenMax.min.js"></script>
<script src="resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="resources/plugins/progressbar/progressbar.min.js"></script>
<script src="resources/plugins/jquery-circle-progress-1.2.2/circle-progress.js"></script>

</body>

</html>