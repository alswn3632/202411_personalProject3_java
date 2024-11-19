# 😊 Spring Framework와 MyBatis를 활용하여 게시판을 구축해보았습니다. 
## 🔧 Stack
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
<br>
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)

## 🖥️ Main Image
![image](https://github.com/user-attachments/assets/75f85027-cb60-4662-bde5-7e2d705fa924)

## 📖 Description  
- Spring Framework를 활용하여 게시판 사이트를 개발하였습니다.
- 개발 기간 : 2024.11.07 - 2024.11.12
- 주요 기능 : 
1. 게시글(파일 첨부 가능) 및 댓글의 CRUD 기능, Spring Security를 활용한 로그인 시스템을 구현했습니다. 
2. 비동기 요청을 활용한 게시글 추천 및 신고 시스템을 구현했습니다.
3. 스케줄링을 통해 필요 없는 파일 데이터를 관리하고, 누적된 신고를 감지해 관리자에게 알립니다. 
- 기술 스택: Spring Framework, MyBatis, JSP, Java, MySQL, JavaScript (AJAX)


## ⭐ Main Feature
### 게시글 CRUD
![image (6)](https://github.com/user-attachments/assets/deb736de-18ca-4fe6-8360-a31008a8077d)
![image (7)](https://github.com/user-attachments/assets/a47bd1a9-2ce0-4ef1-b85b-196629461917)
- 게시글 작성/수정/삭제 : 게시글의 기본적인 CRUD를 구현했습니다. 여기에 파일을 첨부할 수 있도록 라이브러리를 추가하였습니다. 
![image (1)](https://github.com/user-attachments/assets/2d4c90b9-3040-4c1f-86b8-46dcd6c0fe5f)
- 페이징 기능 : 게시글 목록을 출력할 때 페이징핸들러를 이용해 일정 개수만 출력되도록 하였습니다. 
<br> 이 페이징핸들러는 마이페이지에서 내가 쓴 글을 출력할 때도 활용하였습니다.  
- 검색 기능 : MyBatis의 동적 쿼리를 활용하여 다양한 검색 조건을 처리할 수 있도록 만들었습니다. 

### 댓글 CRUD
![image (3)](https://github.com/user-attachments/assets/d59db2c2-945f-4bb8-841f-853adec51a6a)
- 댓글은 비동기 요청을 통해 실시간으로 처리되도록 구현했습니다. 답글 기능을 추가하였습니다.
- RESTful API 설계 : @RestController어노테이션을 활용해 RESTful 방식으로 요청을 처리합니다.
- 다양한 매핑을 방식을 사용해보고 익히면서 코드의 가독성을 높이는 방법을 알게되었습니다. 나중에 할 프로젝트에서 API를 다룰 때 이번에 배운 지식을 활용할 것으로 기대됩니다. 

### 로그인 기능 (Spring Security)
![image (4)](https://github.com/user-attachments/assets/742f19e2-03cc-4e6a-82fc-ac72a793a3a1)
![image (5)](https://github.com/user-attachments/assets/be6bd058-4ee9-47d1-a68e-44bff7fea32c)
- Spring Security를 활용해 로그인을 구현했습니다. 로그인의 성공/실패 핸들러는 스프링에서 제공하는 것이 아닌 직접 제작하였습니다. 이를 통해 최근 로그인 기록을 업데이트하였습니다. 
- 중복 아이디 확인 : 동기 방식의 UserController를 비동기 로직으로도 유연하게 활용하였습니다.

### 스케줄러를 통한 파일 데이터 자동 처리
- 서버에 쌓인 불필요한 파일을 자동으로 관리하도록 스케줄러를 구현했습니다.
- @Scheduled 어노테이션을 활용했습니다. 주기적으로 file 테이블의 정보와 실제 저장소에 존재하는 파일 이름을 비교해 데이터베이스에 존재하지 않는 파일을 삭제합니다. 

### 신고 시스템 
![image (9)](https://github.com/user-attachments/assets/174166db-57c2-407d-888a-6a47464368af)
- 신고는 사용자의 id와 게시글 작성자의 고유 id를 비교해 신고 가능 여부를 설정합니다. 
- 비동기 요청을 통해 1(성공), 0(서버오류로 인한 실패), -1(중복신고로 인한 실패)의 세가지 답변을 받습니다.
- 신고한 내역이 쌓이면 일정 주기로 스케줄러가 작동해 누적된 신고를 alert 테이블에 추가합니다. 

### 관리자 조작 (대시보드)
![image (10)](https://github.com/user-attachments/assets/fac84d12-dd3c-4e16-bc86-a404e7ea8f7c)
- 5회 이상 누적 신고로 alert 테이블에 추가된 신고 내역은 pending 상태에서 under_review로 변합니다.
- alert 테이블에 추가된 내역은 관리자만 볼 수 있는 대시보드 페이지에서 출력됩니다.
- 관리자는 게시글을 확인한 후 보류/삭제 처리할 수 있습니다. 각각 rejected와 approved로 상태가 변합니다.

### 추천 시스템
![Honeycam_2024-11-13_02-05-49](https://github.com/user-attachments/assets/c7352277-41af-453c-9d6e-e551ae17db51)
- 이전에 리액트에서 시간 부족으로 구현하지 못했던 추천 기능을 추가했습니다.
- 비동기 요청을 통해 서버에서 실시간으로 사용자의 id를 가지고 게시글에 추천이 등록되었는지 확인하고 출력합니다.
- 추천 버튼을 눌렀을 때도 한번 더 추천 여부를 검증하고 추천 -> 해제 / 비추천 -> 추천의 동작을 진행합니다.

## 💾 DB 설계, ERD
![image (2)](https://github.com/user-attachments/assets/bb1fc59d-490e-4403-8896-6efd216a7a43)


## ❤️ Thank you!
이번 프로젝트를 통해 Spring Framework의 기초와 활용법을 체계적으로 익힐 수 있었습니다. 8일 동안 수업을 통해 기본적인 이론과 활용법을 배우고, 6일은 프로젝트를 통해 복습하고 심화된 응용을 도전해볼 수 있었습니다. <br>
Spring Framework는 Spring Boot가 등장하기 이전부터 현재까지 많은 프로젝트에서 활용되므로 단순히 예전에 쓰던 기술이라 생각하지않고, 현장에서도 사용할 수 있는 중요한 기술로 생각하며 학습에 임했습니다. <br>
화면과 서버, DB가 작은 규모로 연결되거나 각각 따로 진행되었던 그동안의 프로젝트와 달리 이번에는 완성도있는 웹 애플리케이션을 제작하게 되어서 만드는 동안 흥미로웠습니다.


## 📌 Link  
더 자세한 설명은 제 개인 블로그에서 이어집니다. <br>
https://blog.naver.com/momonocha/223658152917

