<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/signMember.css">
<!-- 상단 이미지 -->
<div class="top-img">
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="sign-header-top-img" alt="...">
</div>
<section>
	<div class="container">
	<div class="m-auto w-75 ">
			<div class="shadow p-3 pl-3 mb-5 rounded w-75 m-auto memberBoxing" >
				<form id="signForm" action="signMember" method="post">
				 <div class="form-row inline">
				    <div class="form-group col-md-12 mb-0">
				    	<div class="row align-items-center">
				    		<div class="form-group col-md-6 sign-epw">
							<h1 class="title">회원 가입</h1>
						      <label for="userEmaill">Email</label>
						      <input type="email" name="uemail" class="form-control" id="userEmaill" required="required">
						      <!-- 아이디 중복 시에 나타나는 오류 창  -->
						      <!-- <label class=""  ></label> -->
						      <label for="password">비밀번호</label>
						      <input type="password" name="upassword" class="form-control" id="password" required="required">
						      <label for="passwordRe">비밀번호 확인</label>
						      <input type="password" class="form-control" id="passwordRe" required="required">
				      	</div>
				      	<div class="row">
				      		<div class="col sign-pimg">
						    <div class="shadow bg-white rounded sign-img-bg">
						    	<img src="${pageContext.request.contextPath }/resources/img/test.png" class="rounded img-fluid " alt="짱구">
						    </div>
						    </div>
						</div>
				      </div>
				  </div>
			 </div>
			 <div class="form-row inline">
				<div class="form-group col-md-12">
					<label for="userName">이름</label>
				    <div class="row">
				    	<div class="form-group col-md-6">
				      		<input type="text" name="uname" class="form-control" id="userName" required="required">
				      	</div>
				      	<div class="form-group col-md-5 btnFile">
				      		<input type="file" accept="image/*" name="pic" class="custom-file-input" id="validatedInputGroupCustomFile">
					     	<label class="custom-file-label" for="validatedInputGroupCustomFile">Choose</label>
				      	</div>
				     </div>
				     <div class="row">
				     	<div class="form-group col-md-6">
				      		<label for="nickName">닉네임</label>
					      	<input type="text" name="unickname" class="form-control" id="nickName" required="required">	
				      	</div>
				      	<div class="form-group col-md-6">
				      		<label for="userAge">생년월일</label>
					      	<input type="number" name="ubirth" class="form-control" id="userAge">	
				      	</div>
			     	</div>
				</div>
			</div>
			  <div class="form-row inline">
			    <div class="form-group col-md-12">
			      <label for="sample4_postcode">주소</label>
			      <div class="row">
			      	<div class="form-group col-md-6">
			      		<input type="text" name="postcode" id="sample6_postcode" readonly placeholder="우편번호" class="form-control " />
			      	</div>
			      	<div class="form-group col-md-6">
			      		<input type="text" name="addr" id="sample6_address" class="form-control" readonly placeholder="주소">
			      	</div>
			      </div>
			       <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success" />
			    </div>
			  </div>
			  <span id="guide" style="color:#999;display:none"></span>
			  <div class="form-group">
			    <input type="text" name="detailAddr" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
			    <input type="hidden" name="extraAddr" id="sample6_extraAddress" readonly placeholder="참고항목">
			  </div>
				<div class="form-group">
					<button type="submit" class="m-auto btn member-btn signUp-btn" id="signSubmit"> 회원가입 </button>
				</div>
			</form>
		</div>
		</div>
	</div>
	
</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<script>
		var user_age = 0;
		/* 버튼 클릭시 생년월일 일치 확인 */
		document.getElementById("signSubmit").onclick = function() {
			user_age = document.getElementById('userAge').value;
			if (user_age.length != 8) {
				alert("생년월일이 잘못 되었습니다");
				return false;
			}
			
		};
		var message = '${message}';
		
		if(message != null && message != ""){
			alert(message);
		}

		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>