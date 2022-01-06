
<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/contact_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">food........</div>
	</div>
</div>


<div>
	<ul>
		<li ><a href="foodInsert.do">foodInsert...</a></li>
		<li><a href="foodList.do">foodList...</a></li>
	</ul>
</div>
<div class="kakaoMap col-lg-5" id="kakaoMap"
						style="width: 500px; height: 400px;"></div>
						
						
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e03564b57be53bd6ef508d4c357031e1"></script>
	<script>
		var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>
