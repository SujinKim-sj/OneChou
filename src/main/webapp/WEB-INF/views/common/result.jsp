<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Result Page</h1>
	<script type="text/javascript">
		alert('${message}');				//로그인 성공여부 팝업창
		window.location.href="${path}";		//로그인 성공시 index, 실패시 login 페이지
		
	</script>
</body>
</html>