
# ✈ 가보자GO!

여행 웹사이트

# 🛫 프로젝트 소개

지도를 통한 여행 경로 확인과 일정짜기, 숙박 조회 및 예약, 여행 후기를 나눌 수 있는 여행 웹사이트 입니다.

# 🧭 개발 기간
22.05 ~ 22.09

# 🖥 사용 기술
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white">

<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">  <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=for-the-badge&logo=Apache Tomcat&logoColor=white">





# 👩‍💻 팀 구성
- 조미혜 : 숙박 조회 및 예약, 결제 페이지 담당 및 전체적인 개발 일정 관리, 회의진행 및 회의록 정리 팀원업무 배정
- 김혜진 : 관리자 페이지 담당 
- 김지수 : 커뮤니티, Q&A, 고객센터 담당
- 박성은 : 로그인, 회원가입, ID&PW찾기 담당
- 배은정 : 마이페이지 담당
- 이정선 : 메인화면 및 여행 상세일정 담당
- 전채림 : 지도를 이용한 여행 일정 부분 담당

# 📌 담당 부분 기능 설명
- ✅ 지역별 숙소 조회하기
- ✅ 숙소 상세 페이지에서 숙소 룸 타입이나 위치, 후기 확인가능
- ✅ 룸 타입 선택 시, 상세 정보와 이미지 확인 가능
- ✅ 결제 페이지를 통해 포인트를 사용하여 결제 가능함

# 💺 후기
처음으로 진행한 7인 팀프로젝트 입니다. 처음 주제선정시 다양한 주제가 나왔지만 팀원들의 공통 관심사가 여행이였고 평소 사용하던 다양한 여행 웹사이트에서 이런 기능들이
더 있다면 편리하게 이용할 수 있지 않을까라는 생각으로 원하는 기능들을 추가하여 제작하였습니다.웹 개발의 전체적인 과정을 경험해 보고 싶은 생각이 들어 따로 프론트앤드 백앤드 파트를 
나누지않고 각자 웹사이트의 한 파트씩 맡아 피그마를 사용한 디자인부터 시작하여 프론트앤드, 백앤드까지 맡아서 화면과 기능 구현을 하였습니다. 웹 개발의 기본을 경험 할 수 있는 좋은 기회였습니다.

# 🛬 구현 이미지
### 1️⃣Main page
![메인](https://user-images.githubusercontent.com/88229797/217470310-e08ed514-bf4b-4e62-bb28-c41dcae01d17.png)
#### 숙소 예약화면의 메인 페이지입니다
- 부트스트랩 슬라이드를 사용하여 숙소의 이미지가 다양하게 바뀔 수 있도록 구현
- 여행지 선택을 통해 전국의 다양한 여행지를 선택 할 수 있고 선택 내용에 따라 숙소가 조회 가능하도록 구현
- Flatpickr 달력 오픈 소스를 사용하여 체크인 & 체크아웃 날짜 선택 가능
- 인원 선택시 팝업으로 성인과 어린이의 인원을 조정할 수 있는 팝업창이 뜸
- flex를 이용하여 추천 숙소의 사진과 간단한 정보를 정렬함
- ajax를 이용하여 로그인한 사용자의 위시리스트 확인이 가능하며 하트모양 클릭시 색상이 변하며 위시리스트에 추가되었다는 안내 팝업이 뜨며
  위시리스트를 확인 할 수 있도록 마이페이지로 이동 가능

### 2️⃣Detail page
![상세](https://user-images.githubusercontent.com/88229797/217470975-7847d94f-f6d8-4b5f-83eb-0d1c4e98da5f.png)
#### 선택한 숙소의 상세 정보 페이지입니다
- 숙소 목록 옆에 이전 메인페이지에서 선택했던 날짜와 인원 정보가 표현됨
- 슬라이드를 통해 룸 타입 정보를 확인 가능하며 사진을 누를시 상세 룸 설명 페이지로 이동함
- 예약하기 버튼을 누를시, 결제 화면으로 이동함
- 숙소의 위치를 지도를 통해 확인 할 수 있음
- 마이페이지에서 받을 수 있는 후기 목록인 숙소의 상세 후기정보를 별점으로 표현하여 3가지 분야의 별점으로 확인 할 수 있으며 전체적인 평균 점수가 상단에 표현됨

### 3️⃣Room detail page
![룸 상세](https://user-images.githubusercontent.com/88229797/217471073-8e213e08-afb8-4666-b69e-cd8093107d7b.png)
#### 선택한 숙소의 룸 타입에 관한 상세한 설명을 확인 할 수 있습니다
- 슬라이드를 통해 상세 이미지를 볼 수 있도록 구현


### 4️⃣Payment page
![결제](https://user-images.githubusercontent.com/88229797/217471162-ed2e9a4a-28d3-45d9-b20c-ecf676aab6ac.png)
#### 선택한 숙소의 결제 페이지입니다
- 예약 정보를 통해 예약한 숙소의 사진과 이름, 원래 가격등의 정보를 확인 할 수 있음
- 포인트 사용 부분을 통해 회원이 가지고 있는 포인트를 입력 가능하며 결제정보의 포인트 사용금액에 바로 반영됨
- 전액 사용 버튼을 통해 가지고 있는 포인트를 전부 사용 할 수 있음
- 예약자 정보를 통해 회원의 정보를 확인 가능함
- 약관안내 부분을 통해 결제 약관들을 확인 할 수 있음
- 최종 금액 결제하기를 누르면 현재 날짜를 반영하는 데이터 포맷과 순번 네자리를 조합한 예약번호가 생성된 팝업과 예약 내역을 확인 할 수 있도록
  마이페이지로 이동가능

