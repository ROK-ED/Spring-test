<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Home -->

<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/foodList_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">food_insert</div>
	</div>
</div>

<div class="contact_form_section">
	<div class="container">
		<div class="row">
			<div class="col">

				Contact Form
				<div class="contact_form_container">
					<div class="contact_title text-center">식당 등록</div>

					<form action="foodInsert.do" id="food_insert_form" method="post"
						class="food_insert_form text-center" enctype="multipart/form-data">

						<input type="text" id="food_name" class="food_name input_field"
							placeholder="* 식당 이름" required="required" data-error="이름을 입력해주세요">
						<input type="text" id="food_phone" class="food_phone input_field"
							placeholder="* 전화번호" required="required"
							data-error="전화번호를 입력해 주세요"> <input type="text"
							id="food_address" class="food_address input_field"
							placeholder="* 주소" required="required" data-error="주소를 입력해 주세요">


						<input type="text" id="food_seat" class="food_seat input_field"
							placeholder="좌석수"> <input type="text" id="food_ot"
							class="food_ot input_field"
							placeholder="!!!!! 운영시간(ex 10:00 - 18:00) !!!!!">



						<textarea id="food_menu" class="food_menu text_field "
							name="message" rows="2" placeholder="메뉴"></textarea>

						<input type="text" id="food_class" class="food_class input_field"
							placeholder="!!!!! 분류(ex 일식, 양식) !!!!!"> <input
							type="text" id="food_picture1" class="food_picture1 input_field"
							placeholder="사진1"> <input type="text" id="food_picture2"
							class="food_picture2 input_field" placeholder="사진2"> <input
							type="text" id="food_picture3" class="food_picture3 input_field"
							placeholder="사진3">






						<button type="submit" id="form_submit_button"
							class="form_submit_button button trans_200">
							등록하기<span></span><span></span><span></span>
						</button>

					</form>
				</div>

			</div>
		</div>
	</div>
</div>

