<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/signMember.css">
<!-- 상단 이미지 -->
<style>
	.imgView{
		width: 200px;
	}
</style>
<div class="top-img">
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="sign-header-top-img" alt="...">
</div>
<section>
	<div class="container">
	<div class="m-auto w-75 ">
			<div class="shadow p-3 pl-3 mb-5 rounded w-75 m-auto memberBoxing" >
				<form id="form" action="signMemberUp" method="post" encType="multipart/form-data">
				 <div class="form-row inline">
				    <div class="form-group col-md-12 mb-0">
				    	<div class="row align-items-center">
				    		<div class="form-group col-md-6 sign-epw">
							<h1 class="title">회원 가입</h1>
							<div>
						      <label for="userEmaill">Email</label>
						      <input type="email" name="uemail" class="form-control" id="uemail" required="required" value="${userVO.uemail}" autocomplete="off"  >
						      <label class="result"></label>
						    </div>
						    <div>
						      <label for="password">비밀번호</label>
						      <input type="password" name="upassword" class="form-control" id="upassword" required="required" autocomplete="off"/>
						      <label class="result"></label>
						    </div>
						    <div>
						      <label for="passwordRe">비밀번호 확인</label>
						      <input type="password" class="form-control" id="passwordRe" required="required" autocomplete="off"/>
						      <label class="result"></label>
						    </div>
				      	</div>
				      	<div class="row ml-3">
				      		<div class="col sign-pimg">
						    <div class="rounded m-auto">
						    	<img src="${pageContext.request.contextPath }/resources/img/resume/resume-default-img.png" id="imgView" class="imgView" alt="profile">
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
				      		<input value="${userVO.uname}" type="text" name="uname" class="form-control" id="uname" required="required" autocomplete="off">
				      		<label class="result"></label>
				      	</div>
				      	<div class="form-group col-md-6">
				      		<input type="file" accept="image/*" name="file" class="m-auto btn member-btn form-control" id="profileImage"  />
				      	</div>
				     </div>
				     <div class="row">
				     	<div class="form-group col-md-6">
				      		<label for="nickName">닉네임</label>
					      	<input value="${userVO.unickname}" type="text" name="unickname" class="form-control" id="unickname" required="required" autocomplete="off">
					      	<label class="result"></label>	
				      	</div>
				      	<div class="form-group col-md-6">
				      		<label for="userAge">생년월일</label>
					      	<input type="text" value="${userVO.ubirth}" name="ubirth" class="form-control" id="ubirth" autocomplete="off">
					      	<label class="result"></label>
				      	</div>
			     	</div>
				</div>
			</div>
			  <div class="form-row inline">
			    <div class="form-group col-md-12">
			      <label for="sample4_postcode">주소</label>
			      <div class="row">
			      	<div class="form-group col-md-6">
			      		<input value="${userVO.postcode}" type="text" name="postcode" id="sample6_postcode" readonly placeholder="우편번호" class="form-control" />
			      	</div>
			      	<div class="form-group col-md-6">
			      		<input type="text" name="addr" value="${userVO.addr}" id="sample6_address" class="form-control" readonly placeholder="주소" />
			      	</div>
			      </div>
			       <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn member-btn" />
			    </div>
			  </div>
			  <span id="guide" style="color:#999;display:none"></span>
			  <div class="form-group">
			    <input type="text" name="detailAddr" value="${userVO.detailAddr}" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
			    <input type="hidden" name="extraAddr" id="sample6_extraAddress" readonly placeholder="참고항목">
			  </div>
				<div class="form-group">
					<button type="button" class="m-auto btn member-btn signUp-btn" id="signSubmit"> 회원가입 </button>
				</div>
				<input type="hidden" name="csrf_token" value="${csrf_token}"/>
			</form>
		</div>
		</div>
	</div>
</section>
<div class="modal-box">
		<div class="modal">
			<img src="${pageContext.request.contextPath }/resources/img/member/findMember.gif" /><br/>
			<span class="mailMessage">메일을 전달 중입니다 : )</span>
		</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script >var root = "${root}"</script>
<script src="${root}/resources/js/signMember.js"></script>
<script>
	
		var imgTemp = $("#imgView").attr("src");
		
		$("#profileImage").on("change",function(){
			
			var files = $(this)[0].files[0];
			
			if(!files.type.startsWith("image/")){
				alert("이미지 파일을 선택해 주세요");
				removeFileInfo();
			}else{
				var path = window.URL.createObjectURL(files);
				console.log(path);
				$("#imgView").attr("src",path);
			}
		});
		
		function removeFileInfo(){
			$("#imgFileName").val("");
			$("imgView").attr("src",imgTemp);
		}
		
		function signSubmit(){
			var okNum = 0;	
			for(var i = 1; i<7; i++){
				var key = 'bool'+i;
				
				if(!isCheckobj[key].bool){
					console.log(isCheckobj[key].bool);
					alert(isCheckobj[key].message);
					isCheckobj[key].id.focus();
					return;
				}else{
					okNum++;
				}
			}
			if(okNum === 6) $("#form").submit();
				$(".modal").css("display","flex");
		}
		
		var message = '${message}';
		if(message != null && message != ""){
			alert(message);
		}
</script>		
