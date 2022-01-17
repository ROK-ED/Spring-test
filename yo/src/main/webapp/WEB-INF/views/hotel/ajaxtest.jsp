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
				
				var imgstack=0;
				var telstack=0;
 				for(var i = 0; i < itemList.length; i++) {
					//console.log($(itemList[i]).children("firstimage")[0]);
					var ad=add[i].childNodes[0].nodeValue;
					if(!!$(itemList[i]).children("firstimage")[0])
					{
						var im=img[imgstack].childNodes[0].nodeValue;
						imgstack+=1;
					}
					else
						var im="";
					var lox=locx[i].childNodes[0].nodeValue;
					var loy=locy[i].childNodes[0].nodeValue;
					
					if(!!$(itemList[i]).children("tel")[0])
					{
						var te=tel[telstack].childNodes[0].nodeValue;
						telstack+=1;
					}
					else
						var im="";
					
					var titl=title[i].childNodes[0].nodeValue;
					 

				 console.log(ad+" "+im+" "+lox+" "+loy+" "+te+" "+titl);
				 	$.ajax({
						type : "POST",
						url : "ajaxhotelinset.do",
						data : {
							"id" : (i+1),//일반 insert문 사용시 pk제약조건때문에 새로운insert문사용으로 id값을지정함
							"ad" : ad,
							"im" : im,
							"lox" : lox,
							"loy" : loy,
							"te" : te,
							"titl" : titl
			
						},
						success : function(result) {
							
						},
						error : function(e) {
						
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