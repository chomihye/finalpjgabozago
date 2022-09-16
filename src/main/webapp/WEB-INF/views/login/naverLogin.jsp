<!DOCTYPE html>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>naverLogin</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/common/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192"  href="/resources/common/ico/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/common/ico/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/common/ico/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/common/ico/favicon-16x16.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/common/ico/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/common/ico/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/common/ico/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/common/ico/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/common/ico/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/common/ico/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/common/ico/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/common/ico/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/common/ico/apple-icon-180x180.png">
    <link rel="manifest" href="/resources/common/ico/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/resources/common/ico/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/c12d3c98b6.js" crossorigin="anonymous"></script>

    <!-- css styleSheet -->
    <link rel="stylesheet" href="/resources/member/css/loginstyle.css">
    
    <!-- jQuery Section -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    
    <!-- 네이버 로그인 -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    <!-- 카카오 로그인 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script type="text/javascript">
    
    </script>
</head>

<body>
	<%
	    String clientId = "ogYcfVAWiOHE79qtuGQH";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "JC_xKJVKpk";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/login/naver/auth", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    
	    try {
	      URL url = new URL(apiURL);
	      
	      HttpURLConnection con = (HttpURLConnection) url.openConnection();
	      con.setRequestMethod("GET");
	      
	      int responseCode = con.getResponseCode();
	      
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }// if-else
	      
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }// while
	      
	      br.close();
	      
	      if(responseCode==200) {
	        out.println(res.toString());
	      }// if
	      
	      response.sendRedirect("/main");	
	      
	    } catch (Exception e) {
	      System.out.println(e);
	    }// try-catch
  %>
  
    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>

		callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다.

        <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
    </div>

</body>

</html>