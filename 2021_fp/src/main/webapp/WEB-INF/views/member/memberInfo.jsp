<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/memberInfo.css">
<!-- 상단 이미지 -->
<div class="top-img">
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="sign-header-top-img" alt="...">
</div>

<style>
	.hiddenMember{
		display: none;
	}
	
</style>
<section>
	<div class="container">
	<div class="m-auto w-75 info-box">
			<div class="shadow p-3 pl-3 mb-5 rounded w-75 m-auto memberBoxing" >
				<form id="signForm" action="#">
				 <div class="form-row inline">
				    <div class="form-group col-md-12 mb-0">
				    	<div class="row align-items-center">
				    		<div class="form-group col-md-6 sign-epw">
							<h2 class="title">회원 정보 확인</h2>
						      <label for="userEmaill">Email</label>
						      <input type="email" class="form-control" id="userEmaill" required="required" disabled />
						      <!-- 아이디 중복 시에 나타나는 오류 창  -->
						      <!-- <label class=""  ></label> -->
						      <label for="password">비밀번호</label>
						      <input type="password" class="form-control" id="password" required="required" />
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
				      		<input type="text" class="form-control" id="userName" disabled required="required">
				      	</div>
				      	<div class="form-group col-md-5 btnFile">
				      		<input type="file" accept="image/*" class="custom-file-input" id="validatedInputGroupCustomFile" disabled required>
					     	<label class="custom-file-label hiddenMember" for="validatedInputGroupCustomFile">Choose</label>
				      	</div>
				     </div>
				     <div class="row">
				     	<div class="form-group col-md-6">
				      		<label for="nickName">닉네임</label>
					      	<input type="text" class="form-control" id="nickName" disabled required="required">	
				      	</div>
				      	<div class="form-group col-md-6">
				      		<label for="userAge">생년월일</label>
					      	<input type="number" class="form-control" disabled id="userAge">	
				      	</div>
			     	</div>
				</div>
			</div>
			  <div class="form-row inline">
			    <div class="form-group col-md-12">
			      <label for="sample4_postcode">주소</label>
			      <div class="row">
			      	<div class="form-group col-md-6">
			      		<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" disabled />
			      	</div>
			      	<div class="form-group col-md-6">
			      		<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" disabled />
			      	</div>
			      </div>
			      <div class="hiddenMember">
			       <input type="button" onclick="sample4_execDaumPostcode()" class="btn member-btn hiddenMember" value="우편번호 찾기" />
			      </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" disabled />
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" disabled />
			  </div>
			 <span id="guide" style="color:#999;display:none"></span> 
			 <div class="clickHidden">
			  <button type="button" class="btn member-btn mr-2" id="modifyMember"> 회원정보 수정 </button>
			  <button type="button" class="btn member-btn mr-2" id="withdraw"> 회원탈퇴 </button>
			 </div>
			 <div class="hiddenMember">
			  <button type="button" class="btn member-btn mt-2 mr-2" id="modify"> 수정완료 </button>
			 </div>
			</form>
		</div>
		 </div>
	</div>
	
</section>

<script>
   var modifyBtn = document.getElementById("modify");
   var modifyClick = document.getElementById("modifyMember");
   var title = document.getElementById("title");
   var password = document.getElementById("password");
   var inputTag = document.getElementsByTagName("input");
   var hiddenMember = document.getElementsByClassName('hiddenMember');
   var clickHidden = document.getElementsByClassName('clickHidden');
    
    document.getElementById("modifyMember").addEventListener("click", function(){
        
    	alert("수정 버튼 클릭");
        if(password.value == "" || password.value == null){
            alert("비밀번호를 입력해주세요");
            return;
        }
        if(hiddenMember != null){
            for(var i = 0; i < hiddenMember.length; i++){
            	hiddenMember[i].style.display = 'inline-block';	
            }
            for(var i=0; i<clickHidden.length; i++){
            	clickHidden[i].style.display = 'none';
            }
            for(var i=0; i<inputTag.length; i++){
            	inputTag[i].removeAttribute("disabled",0);    	
            	
            }
            password.value = "";
            password.removeAttribute("required",0);
            title.innerHTML = "회원 정보 수정";    
        }
        
    });

    
</script>

<!-- 이하 daum 주소 찾기 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>