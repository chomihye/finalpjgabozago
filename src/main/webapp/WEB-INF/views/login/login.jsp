<!DOCTYPE html>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>login</title>

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
    <!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
	  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    <!-- 카카오 로그인 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script type="text/javascript">
      // 1. 카카오 로그인
	    Kakao.init('38c41b61e80cae65961a9ddb0441a69c');
		  console.log(Kakao.isInitialized());
		
     	function kakaoLogin() {
        Kakao.Auth.login({
          success: function (response) {
            Kakao.API.request({
              url: '/v2/user/me',
              success: function (response) {
                console.log(response);
              },
              fail: function (error) {
                console.log(error);
              },
            })
          },
          fail: function (error) {
            console.log(error);
          },
        })
      }// kakaoLogin
     	
     	 
     	function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
              console.log(response);
            },
            fail: function (error) {
              console.log(error);
            },
          })
          Kakao.Auth.setAccessToken(undefined);
        }//if
      } // kakaoLogout
     	  
      // 2. 네이버 로그인
//       var naverLogin = new naver.LoginWithNaverId({
//             clientId: "ogYcfVAWiOHE79qtuGQH",
//             callbackUrl: "http://localhost:8080/login/naver/auth",
//             isPopup: false
//       });	// 

//       naverLogin.init();

//       window.addEventListener('load', function () {
//         naverLogin.getLoginStatus(function (status) {
        	
//           if (status) { // 필수 설정 항목 조건문 작성
//             const name = naverLogin.user.getName();
//             const email = naverLogin.user.getEmail();
//             const nickname = naverLogin.user.getNickName();
//             const birthday = naverLogin.user.getBirthday();
//             const profile_image = naverLogin.user.getProfileImage(); 
//             const birthyear = naverLogin.user.getBirthyear(); // MM-DD
//             const mobile = naverLogin.user.getMobile();

//             console.log(naverLogin.user); 
              
//             if( name == undefined || name == null 
//             		|| email == undefined || email == null 
//             		|| nickname == undefined || nickname == null 
//             		|| birthday == undefined || birthday == null 
//             		|| profile_image == undefined || profile_image == null 
//             		|| birthyear == undefined || birthyear == null 
//             		|| mobile == undefined || mobile == null) {
//               alert("필수 정보 제공에 동의해주세요.");
//               naverLogin.reprompt();
//               return;
//             }// if

//           } else {
//             console.log("callback 처리에 실패하였습니다.");
//           }//if-else
//         });// getLoginStatus
//       });

//       var testPopUp;

//       function openPopUp() {
//           testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
//       }// openPopUp

//       function closePopUp(){
//           testPopUp.close();
//       }// closePopUp

//       function naverLogout() {
//         openPopUp();

//         setTimeout(function() {
//           closePopUp();
//           }, 1000);
//       }// naverLogout

      $(function(){
        var resultMsg = '${__RESULT__}'
        
        if(resultMsg != null && resultMsg.length > 0){
          alert(resultMsg);
        }// if
      });

      // 아이디 저장 쿠키
      $(document).ready(function(){
        // 저장된 쿠키값을 가져와서 ID 입력창에 넣고 없으면 공백
        var userid = getCookie("userid");

        $("#userid").val(userid); 
        
        if($("#userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태인 경우
            $("#saveId").attr("checked", true); // 아이디 저장 체크박스 체크 상태로 유지
        }// if
      
        $("#saveId").change(function(){ // 체크박스에 변화가 있는 경우
          if($("#saveId").is(":checked")){ // 1) 아이디 저장 체크했을 때
              var userid = $("#userid").val();
              setCookie("userid", userid, 7); // 쿠키 보관(7일)
          }else{ // 2) ID 저장하기 체크 해제했을 때
              deleteCookie("userid");
          }// if-else
        });// onchange
     
        // 아이디 저장을 체크한 상태에서 아이디 입력하면 쿠키 저장
        $("#userid").keyup(function(){ // 입력창에 ID 입력하는 경우
            if($("#saveId").is(":checked")){ // 아이디 저장하기 체크했다면
                var userid = $("#userid").val();
                setCookie("userid", userid, 7); // 쿠키 보관(7일)
            }// if
        });// onkeyup
      });
 
      function setCookie(cookieName, value, exdays){
          var exdate = new Date();
          exdate.setDate(exdate.getDate() + exdays);
          var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
          document.cookie = cookieName + "=" + cookieValue;
      }// setCookie
      
      function deleteCookie(cookieName){
          var expireDate = new Date();
          expireDate.setDate(expireDate.getDate() - 1);
          document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
      }// deleteCookie
      
      function getCookie(cookieName) {
          cookieName = cookieName + '=';
          var cookieData = document.cookie;
          var start = cookieData.indexOf(cookieName);
          var cookieValue = '';
          if(start != -1){
              start += cookieName.length;
              var end = cookieData.indexOf(';', start);
              
              if(end == -1) end = cookieData.length;
              cookieValue = cookieData.substring(start, end);
          }// if
          return unescape(cookieValue);
      }// getCookie
    </script>
</head>

<body>

	<% 
		String msg = null; // if session scope이 null 아닌지 뭐가 있는지 확인 후 수행
	
		if( ( msg = (String) session.getAttribute("__RESULT__")) != null ){
			if(msg.equals("로그아웃 되었습니다.") || msg.equals("회원 전용 서비스입니다. 먼저 로그인을 해주세요.")){ // 로그아웃 성공한 경우 or 로그인이 안됐는데 회원서비스 접근한 경우 Session Scope 삭제
				// session.invalidate();
				session.removeAttribute("__RESULT__");
				System.out.println(">>> 세션 삭제 <<< ");
			}// if
		}// if
		
	    String clientId = "ogYcfVAWiOHE79qtuGQH";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8080/login/naver/auth", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	%>
	
    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>


        <div id="imgSection">
            <div id="imgSection_img">
                <img src="/resources/member/img/samplesize4.jpg" alt="loginImg" id="loginImg">
                <div class="gradient"></div>
            </div>

            <div id="imgSection_text">
                <p class="center">ENJOY YOUR JOURNEY WITH</p>
                <p class="center">GABOZAGO</p>
            </div>
        </div>

        <div id="body">
        
            <section id="loginBox">
                <div class="midHr">&nbsp;로그인&nbsp;</div>
                <div id="idpwError" class="center">아이디 또는 비밀번호가 일치하지 않습니다.</div>
                
                <form action="/login/loginProcess" method="POST">
                  <label for="userid">아이디(이메일)</label><br>
                  <input type="text" name="email" id="userid" placeholder="sample@email.com"><br>
                  
                  <label for="userpw">비밀번호</label><br>
                  <input type="password" name="password" id="userpw" placeholder="●●●●●●●●"><br>
                  
                  <div id="checkboxes">
                      <input type="checkbox" name="saveId" id="saveId">
                      <label for="saveId">아이디 저장</label>
                      <input type="checkbox" name="rememberMe" id="autoLogin">
                      <label for="saveId">자동 로그인</label>
                  </div>
                  
                  <div id="findInfoLink">
                      <i class="fa-solid fa-magnifying-glass"></i><a href="/findInfo/id">아이디/비밀번호 찾기</a>
                  </div>
                  
                  <input type="submit" value="로그인" id="loginBtn"></input>
                </form>
                <div class="midHr">&nbsp;소셜 로그인&nbsp;</div>

                <div class="socialLoginBtn"><img src="/resources/member/img/naver_loginBtn/btnG_아이콘사각.png" alt="naverLogo"><a href="<%=apiURL%>" id="naverIdLogin">네이버 로그인</a></div>
                <div class="socialLoginBtn"><img src="/resources/member/img/kakao_loginBtn/kakaotalk_sharing_btn_small/kakaotalk_sharing_btn_small.png" alt="kakaoLogo"><a href="#" onclick="kakaoLogin();">카카오 로그인</a></div>
                <div class="socialLoginBtn"><img src="/resources/member/img/google_loginBtn/google_test.png" alt="GoogleLogo" style="border: 1px solid rgb(220, 220, 220);"><a href="#">&nbsp;구글 로그인</a></div>
        
                <div class="center">
                    <hr>
                    <p>계정이 없으신가요?</p>
                    <a href="/join" id="joinText">회원가입</a>
                    <br><button onclick="kakaoLogout();" style="background-color: yellow;">★카카오 로그아웃용 임시 버튼★</button>
                    <br><button onclick="naverLogout();" style="background-color: green;">★네이버 로그아웃용 임시 버튼★</button>
                </div>
            </section>

        </div>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
    </div>

</body>

</html>