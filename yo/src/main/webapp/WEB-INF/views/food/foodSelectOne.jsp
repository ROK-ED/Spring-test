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
<style type="text/css">
/
html, body {
   background-color: #e8e8e8;
   height: 100%;
}

a, a:hover, a:visited, a:active {
   text-decoration: none;
   color: #000;
}

a:hover {
   color: #a00;
}

h1 {
   text-align: center;
   background-color: #fff;
   padding: 5px;
   margin: 0;
}

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
   /*  =================================바꾼부분 */
   background-repeat: no-repeat;
   background-size: 60px 60px;
   cursor: pointer;
}

.rating .ratefill {
   background-color: #fa9e1b; /*  =================================바꾼부분 */
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
                        <div class="food_title_container d-flex flex-lg-row flex-column">
                           <div class="food_title_content">
                              <input type="text" class="food_id" id="food_id"
                                 value='${jsonModel.getString("OPENDATA_ID")}'>
                              <h1 class="food_title">${jsonModel.getString("BZ_NM")}</h1>
                              <div class="food_info_text">
                                 <%--    <c:if test="${hotel.hotel_tel eq null}">
                           번호가 등록되지 않았습니다.
                           </c:if> --%>
                                 음식점 번호
                              </div>
                              <div class="food_location">${jsonModel.getString("GNG_CS")}</div>
                           </div>
                           <div class="food_title_button ml-lg-auto text-lg-right">
                              <br>
                              <div class="room_text">
                                 <%--   <h2>
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


                        <!------------ 리뷰! ---------------->
                        <div class="review_wrap">
                           <h1>후기</h1>


                           <form name="reviewform" class="reviewform" method="get"
                              action="foodReviewInsert.do">
                              <input type="text" class="rate" name="rate" id="rate"
                                 /> 
                                 
                                 <input type="text" name="review_member_email"
                                 id="review_member_email"
                                 value="${sessionScope.member_email }"> 
                                 
                                 <input
                                 type="text" name="review_food_id" class="review_food_id"
                                 id="review_food_id"
                                 value='${jsonModel.getString("OPENDATA_ID")}'>
                                 
                                 
                              <p class="title_star">별점과 리뷰를 남겨주세요.</p>

                              <div class="review_rating_click">
                                 <div class="warning_msg">별점을 선택해 주세요.</div>
                                 <div class="rating">
                                    <div class="ratefill"></div>
                                    <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
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
                              <div class="review_contents">
                                 <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
                                 <textarea rows="10" class="review_textarea"
                                    id="review_textarea" name="review_textarea"></textarea>
                              </div>
                              <div class="cmd">
                                 <input type="submit" name="save" id="save" value="등록">
                              </div>
                           </form>



                        </div>




                        <!-- Location on Map -->

                        <div class="location_on_map">
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
   </div>

   <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

   <script src="resources/plugins/easing/easing.js"></script>
   <script src="resources/plugins/parallax-js-master/parallax.min.js"></script>
   <script src="resources/plugins/colorbox/jquery.colorbox-min.js"></script>
   <script src="resources/js/single_listing_custom.js"></script>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bc9146edbdf1e1ef713709f1af03a5d"></script>
   <script>
      //지도

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

                     food_image.appendChild(img)
                     console.log(result[i]);
                  }
               } else {
                  alert("ㅠㅠㅠ");
               }
            }
         })
      }

      //////////////////////////////////////별찍기

      document.addEventListener(
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
         //this.rate.value = newrate;
         console.log("this 확인 ============"+this.rate.value);
         document.querySelector('.ratefill').style.width = parseInt(newrate * 60)
               + 'px';
         let items = document.querySelectorAll('.rate_radio');
         //document.querySelector('#rate').value = newrate;
         console.log("newrate 값 ============="+ newrate);
         document.getElementById('rate').setAttribute("value",newrate);
         
         //Rating.prototype.rate=newrate;
         //console.log("Rating.prototype.rate======== "+Rating.prototype.rate)
         //rate.value =newrate;

         
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
         case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating_click .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(
                  function() {
                     document
                           .querySelector('.review_rating_click .warning_msg').style.display = 'none';
                  }, 1000);
            break;
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
         case 'word':

            alert('사용할 수 없는 단어가 포함되어 있습니다');
            break;

         }
      }

      let rating = new Rating();//별점 인스턴스 생성

      /////////// ///////////////////////////별찍기끗

      //지도
      //카카오 맵 api로 주소 찍기
      //주소 출력하기
      var mapContainer = document.getElementById('mapi'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(35.8690419, 128.593347), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      var mapi = new kakao.maps.Map(mapContainer, mapOption);

      function mapKakao(data, i) {

         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new kakao.maps.services.Geocoder();
         var foodName = data.data[i].BZ_NM;
         var foodAddr = data.data[i].GNG_CS;
         var foodId = data.data[i].OPENDATA_ID;

         // 주소로 좌표를 검색합니다
         geocoder.addressSearch(data.data[i].GNG_CS,
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
                     var iwContent = '<div style="padding:5px;">'
                           + foodName + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                     iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

                     // 인포윈도우를 생성합니다
                     var infowindow = new kakao.maps.InfoWindow({
                        content : iwContent,
                        removable : iwRemoveable
                     });

                     // 마커에 클릭이벤트를 등록합니다
                     kakao.maps.event.addListener(marker, 'click',
                           function() {
                              // 마커 위에 인포윈도우를 표시합니다
                              infowindow.open(mapi, marker);
                           });

                  }//if

               });//geocoder

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