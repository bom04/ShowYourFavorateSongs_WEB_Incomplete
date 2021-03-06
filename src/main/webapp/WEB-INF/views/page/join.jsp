<%@ page pageEncoding="utf-8"%>
<meta charset="utf-8">
<title>너의 18번을 들려줘</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url var="R" value="/" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${R}res/common.js"></script>
<link rel="stylesheet" href="${R}res/common.css">


<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<body>
	<div id="wrap"
		style="background-image: url('${pageContext.request.contextPath}/res/images/loginImage.jpg'); background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
		<!--헤더: 내비게이션 & 배너-->
		<header>
			<%@ include file="/WEB-INF/include/top.jsp"%>
		</header>


		<section>
			<div id="content">
				<div class="container-fluid">
					<div
						style="margin: 300px 600px 200px; width: 700px; background-color: rgba(255, 255, 255, 0.8); padding: 100px;">
						<form method="post" modelAttribute="users"
							onsubmit="return check()">
							<fieldset style="color: #585858">
								<legend>
									<h1 style="color: #1C1C1C">회원가입</h1>
								</legend>
								<hr style="margin-bottom: 20px;">
								<script type="application/javascript">
									
								var e="";
								var n="";
								function emailCheck() {
									var email = $('#email').val();
									if(email.indexOf('@')==-1) {
										alert('이메일 형식으로 입력해주세요.');
										e="false";
										return;
									}
									else {
										<c:forEach var="user" items="${users}">
										if('${user.email}'==email) {
											alert('이메일 중복입니다. 다시 입력하세요.');
											e="false";
											return;
										}
										                                
									</c:forEach>
									}
									alert('이메일 중복 체크 완료되었습니다.');
									e="true";
								}		
								function nicknameCheck() {
									var nickname = $('#nickname').val();
									if(nickname.includes('관리자')) {
											alert('"관리자"라는 단어가 들어간 닉네임은 사용이 불가능합니다.');
											n="false";
											return;

										}
									<c:forEach var="user" items="${users}">
										if('${user.nickname}'==nickname) {
											alert('닉네임 중복입니다. 다시 입력하세요.');
											n="false";
											return;
										}
										                                
									</c:forEach>
									alert('닉네임 중복 체크 완료되었습니다.');
									n="true";
								}	

								function check() {
									var password = $('#password').val();
									var password2 = $('#password2').val();

									if(password!=password2) {
										alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
										return false;
									}
									if(e=="true" && n=="true")
										return true;
									alert("중복체크 확인해주세요");
									return false;
								}			
		
</script>
								<div class="form-group">
									<label for="inputEmail1">이메일</label> <input type="email"
										class="form-control" id="email" name="email"
										aria-describedby="emailHelp" placeholder="이메일 입력"
										width="100px;" required>
										<button type="button" class="btn btn-primary"
										style="margin-top: 20px;" onclick="emailCheck()">중복 체크</button>
										

								</div>
								<div class="form-group">
									<label for="inputPassword1">비밀번호</label> <input type="password"
										class="form-control" id="password" name="password"
										placeholder="비밀번호 입력" required>
								</div>
								<div class="form-group">
									<label for="inputPassword2">비밀번호 확인</label> <input
										type="password" class="form-control" id="password2"
										placeholder="비밀번호 확인" required>
								</div>
								<div class="form-group">
									<label for="userName">닉네임</label> <input type="text"
										class="form-control" id="nickname" name="nickname"
										aria-describedby="emailHelp" placeholder="닉네임 입력" required>
									<button type="button" class="btn btn-primary"
										style="margin-top: 20px;" onclick="nicknameCheck()">중복 체크</button>
								</div>

								<button type="submit" class="btn btn-primary btn-block"
									style="margin-top: 50px;">다음 단계</button>
								
							</fieldset>
						</form>
					</div>

				</div>

			</div>

		</section>
		<!--푸터-->
		<footer id="footer">
			<br> <br>
			<p>
				<a href="#" style="text-decoration: none;">▲ TOP</a>
			</p>
			<p>Copyright © 너의 18번을 들려줘</p>
		</footer>

	</div>

</body>
</html>