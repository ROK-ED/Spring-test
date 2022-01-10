<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="home_title">food........</div>
		</div>
	</div>
	
	




	<script type="text/javascript">
		window.onload = function() {
			$.ajax({
				type : "POST",
				url : "ajaxFood.do",
				success : function(data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
					console.log(data);
					//alert(data);

					//string의 값을 object 형식으로 변환합니다.
					//var result = "'"+data+"'";
					var result_obj = JSON.parse(data);
					console.log(result_obj);
					
					
					//console.log(data);

				},
				error : function(e) {
					console.log(e);
					alert('실패했습니다.');
				}

			});
		}
	</script>
</body>
</html>