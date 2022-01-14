<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 id="valv"></h2>


	<script>
		var xhtp = new XMLHttpRequest(); //서버에 잇는 파일을 읽어들임.
		var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay'; /*URL*/
		var queryParams = '?'
				+ encodeURIComponent('serviceKey')
				+ '='
				+ 'yVLv4ZD5gXfl5fN5VGN1Knb%2FtclIeiybrjRJJMtR35LwsHJFDGMVFqdFnTwZVI%2BvUvyx%2F%2B6lfbbRcKyNV5WuYg%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('numOfRows') + '='
				+ encodeURIComponent('50'); /**/
		queryParams += '&' + encodeURIComponent('pageNo') + '='
				+ encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('MobileOS') + '='
				+ encodeURIComponent('ETC'); /**/
		queryParams += '&' + encodeURIComponent('MobileApp') + '='
				+ encodeURIComponent('AppTest'); /**/
		queryParams += '&' + encodeURIComponent('arrange') + '='
				+ encodeURIComponent('A'); /**/
		queryParams += '&' + encodeURIComponent('listYN') + '='
				+ encodeURIComponent('Y'); /**/
		queryParams += '&' + encodeURIComponent('areaCode') + '='
				+ encodeURIComponent('4'); /**/
		queryParams += '&' + encodeURIComponent('sigunguCode') + '='
				+ encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('hanOk') + '='
				+ encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('benikia') + '='
				+ encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('goodStay') + '='
				+ encodeURIComponent(''); /**/
		queryParams += '&' + encodeURIComponent('modifiedtime') + '='
				+ encodeURIComponent(''); /**/
		xhtp.onreadystatechange = function() {
			if (xhtp.readyState == 4) {
				var temp = xhtp.responseXML;

				var itemList = temp.getElementsByTagName("item");
				
				var add= temp.getElementsByTagName("addr1")
				var img= temp.getElementsByTagName("firstimage")
				var locx= temp.getElementsByTagName("mapx")
				var locy= temp.getElementsByTagName("mapy")
				var tel= temp.getElementsByTagName("tel")
				var title= temp.getElementsByTagName("title")
 				for(var i = 0; i < itemList.length; i++) {
					
					var ad=add[i].childNodes[0].nodeValue;
					if(img[i]!=null)
						var im=img[i].childNodes[0].nodeValue;
					else
						var im="";
					var lox=locx[i].childNodes[0].nodeValue;
					var loy=locy[i].childNodes[0].nodeValue;
					
					if(tel[i]!=null)
						var te=tel[i].childNodes[0].nodeValue;
					else
						var te="";
					
					var titl=title[i].childNodes[0].nodeValue;
					 
					 /* var ad=add[1].childNodes[0].nodeValue;
						if(img[1]!=null)
							var im=img[1].childNodes[0].nodeValue;
						else
							var im="";
						var lox=locx[1].childNodes[0].nodeValue;
						var loy=locy[1].childNodes[0].nodeValue;
						
						if(tel[1]!=null)
							var te=tel[1].childNodes[0].nodeValue;
						else
							var te="";
						
						var titl=title[1].childNodes[0].nodeValue; */
					 
					$.ajax({
						type : "POST",
						url : "ajaxhotelinset.do",
						data : {
							"ad" : ad,
							"im" : im,
							"lox" : lox,
							"loy" : loy,
							"te" : te,
							"titl" : titl
			
						},
						success : function(result) {
							console.log('성공');
						},
						error : function(e) {
							console.log(e);
						}

					})
 				}
			}
		};
		xhtp.open('get', url + queryParams);
		xhtp.send();
	</script>
</body>
</html>