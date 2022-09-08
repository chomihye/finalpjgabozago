<!DOCTYPE html>
<%@page import="com.pj.gabozago.domain.MemberVO"%>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>loginProcess</title>

</head>

<body>

	<%
		
		String originalUri = (String) session.getAttribute("__URI__");
		session.removeAttribute("__URI__");
	
		if(originalUri != null){
			response.sendRedirect(originalUri);		// AUTH Interceptor에 의해 로그인창 도달했다면 원래 URI 이동
		} else {
			response.sendRedirect("/main");			// 로그인 버튼 눌러서 직접 로그인창 도달했다면
		}
	%>

</body>

</html>