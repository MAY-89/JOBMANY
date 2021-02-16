<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/memberInfo.css">
<!-- 상단 이미지 -->
<div class="top-img">
	<img src="${pageContext.request.contextPath}/resources/img/member/loginImg.jpg" class="sign-header-top-img" alt="...">
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
				<form id="signForm" action="modifyMember" method="post">
				 <div class="form-row inline">
				    <div class="form-group col-md-12 mb-0">
				    	<div class="row align-items-center">
				    		<div class="form-group col-md-6 sign-epw">
							<h2 id="title">회원 정보 확인</h2>
						      <label for="userEmaill">Email</label>
						      <input type="email" class="form-control" name="uemail" value="${userInfo.uemail}" id="userEmaill" required="required" readonly />
						      <!-- 아이디 중복 시에 나타나는 오류 창  -->
						      <!-- <label class=""  ></label> -->
						      <label for="password">비밀번호</label>
						      <input type="password" name="upassword" class="form-control" id="password" required="required" />
				      	</div>
				      	<div class="row">
				      		<div class="col sign-pimg">
						    <div class="shadow bg-white rounded sign-img-bg">
						    	<img src="${pageContext.request.contextPath}/resources/img/test.png" class="rounded img-fluid " alt="짱구">
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
				      		<input type="text" value="${userInfo.uname}" name="uname" class="form-control" id="userName" disabled required="required">
				      	</div>
				      	<div class="form-group col-md-5 btnFile">
				      		<input type="file" accept="image/*" class="custom-file-input" id="validatedInputGroupCustomFile" disabled />
					     	<label class="custom-file-label hiddenMember" for="validatedInputGroupCustomFile">Choose</label>
				      	</div>
				     </div>
				     <div class="row">
				     	<div class="form-group col-md-6">
				      		<label for="nickName">닉네임</label>
					      	<input type="text" name="unickname" value="${userInfo.unickname}" class="form-control" id="nickName" disabled required="required">	
				      	</div>
				      	<div class="form-group col-md-6">
				      		<label for="userAge">생년월일</label>
					      	<input type="number" class="form-control" value="${userInfo.ubirth}" name="ubirth"  disabled id="userAge">	
				      	</div>
			     	</div>
				</div>
			</div>
			  <div class="form-row inline">
			    <div class="form-group col-md-12">
			      <label for="sample4_postcode">주소</label>
			      <div class="row">
			      	<div class="form-group col-md-6">
			      		<input value="${userInfo.postcode}" type="text" name="postcode" id="sample6_postcode" readonly placeholder="우편번호" class="form-control"/>
			      	</div>
			      	<div class="form-group col-md-6">
			      		<input type="text" name="addr" value="${userInfo.addr}" id="sample6_address" class="form-control" readonly placeholder="주소">
			      	</div>
			      </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn member-btn hiddenMember" />
			  </div>
			  <span id="guide" style="color:#999;display:none"></span>
			  <div class="form-group">
			    <input type="text" name="detailAddr" value="${userInfo.detailAddr}" id="sample6_detailAddress" placeholder="상세주소"  disabled class="form-control">
			    <input type="hidden" name="extraAddr" id="sample6_extraAddress" readonly placeholder="참고항목">
			  </div>
			 <div class="clickHidden">
			  <button type="button" class="btn member-btn mr-2" id="modifyMember"> 회원정보 수정 </button>
			  <button type="button" class="btn member-btn mr-2" id="withdraw"> 회원탈퇴 </button>
			 </div>
			 <div class="hiddenMember">
			  <button type="submit" class="btn member-btn mt-2 mr-2" id="modify"> 수정완료 </button>
			 </div>
			 	<input type="hidden" id="uno" name="uno" value="${userInfo.uno}"/>
			</form>
		</div>
		 </div>
	</div>
	
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
   var modifyBtn = document.getElementById("modify");
   var modifyClick = document.getElementById("modifyMember");
   var title = document.getElementById("title");
   var inputTag = document.getElementsByTagName("input");
   var hiddenMember = document.getElementsByClassName('hiddenMember');
   var clickHidden = document.getElementsByClassName('clickHidden');
   var signForm = document.getElementById("signForm"); 
   
    document.getElementById("modifyMember").addEventListener("click", function(){
    	var upassword = document.getElementById("password").value;
    	var uno = document.getElementById("uno").value;
    	var url = "${pageContext.request.contextPath}/members/modifyPWcheck/"+uno+"/"+upassword;
    	if(upassword == "" || upassword == null){
            alert("비밀번호를 입력해주세요");
            return;
        }
    	$.getJSON(url,function(data){
			if(data){
				if(hiddenMember != null){
		            for(var i = 0; i < hiddenMember.length; i++){
		            	hiddenMember[i].style.display = 'inline-block';	
		           }
		            for(var i=0; i<clickHidden.length; i++){
		            	clickHidden[i].style.display = 'none';
		           }
		            for(var i=1; i<inputTag.length; i++){
		            	inputTag[i].removeAttribute("disabled",0);    	
		           }
		            password.value = "";
		            password.removeAttribute("required",0);
		            title.innerHTML = "회원 정보 수정";    
		       }
			}else{
				alert("비밀번호를 확인해 주십시오");
			}
		});
   });
    
    document.getElementById("withdraw").addEventListener("click", function(){
   		var upassword = document.getElementById("password").value;	
   		var uno = document.getElementById("uno").value;
   		var url = "${pageContext.request.contextPath}/members/modifyPWcheck/"+uno+"/"+upassword;

   		if(upassword == null || upassword == "") {
   			alert("비밀번호를 입력 해주세요");
   			return;
   		}
   		
   		$.getJSON(url,function(data){
   			
   			if(!data){
   				alert("비밀번호를 다시 한번 확인 해주십시오");
   				return;
   			}
   			
   			if(confirm("정말로 삭제 하시겠습니까?")){
   				signForm.setAttribute("action","deleteMember");
   				signForm.submit();
   			}
   		});
   	});
    
</script>




