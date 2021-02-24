<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/findUser.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="main-header-top-img" alt="...">
</div>
<section>
	<div class="container">
	<div class="p-3 pl-3 mb-5 bg-white rounded w-75 m-auto" >
		<div class="row">
			<div class="col-sm">
				<form id="findID" >
					<div class="form-group col-md-12">
				  		<h2 class="title">아이디 찾기</h2>
		    			<div class="form-group">
						    <label class="sr-only" for="userName">이름</label>
					   		<input type="text" name="uname" class="form-control userName" id="uname" required="required" placeholder="이름을 입력해주세요"/>
					 	</div>
					 	<div class="form-group">
					 		<label class="sr-only" for="userBirth">생년월일</label>
					    	<input type="number" name="ubirth" class="form-control userBirth" id="ubirth" required="required" placeholder="생년월일을 입력해주세요" />
		      			</div>
		      			<div class="form-group pt-2">
		      				<input type="button" class="form-control btn member-btn" id="findIDBtn" value="아이디 찾기" >
		      			</div>				
					</div>
				</form>
			</div>
			<div class="col-sm virLineFind">
					<form action="#">
						<div class="form-group col-md-12">
					  		<h2 class="title">비밀번호 찾기</h2>
			    			<div class="form-group">
							    <label class="sr-only" for="userEmail">Email</label>
						   		<input type="text" class="form-control userName" id="uemail" required="required" placeholder="이메일을 입력해주세요"/>
						 	</div>
			      			<div class="form-group font-italic">
			      				비밀번호 찾기 버튼을 누르시면 해당 메일로 확인 메일이 발송됩니다
			      			</div>	
			      			<div class="form-group">
			      				<input type="button" class="form-control btn member-btn" id="findPWBtn" value="비밀 번호 찾기" >
			      			</div>				
						</div>
					</form>
			</div>
		</div>
		</div>
	</div>
</section>
<div class="modal-box">
	<div class="modal">
		<img src="${pageContext.request.contextPath }/resources/img/member/findMember.gif" />
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
	
	$("#findIDBtn").click(function(){	
		var url = "${pageContext.request.contextPath}/members/findID/"+$("#uname").val()+"/"+$("#ubirth").val();
		var input_uname = $("#uname");
		var input_ubirth = $("#ubirth");
		
		$.ajax({
			
			type : "GET",
			
			url : url,
			
			success : function(data){
				
				checkID(data);
				
			},
			error : function(res){
				checkID(res);
				
			}
		});

	});
	function checkID(data){
		
		if(data == null || data == ""){
			alert("입력하신 정보가 일치 하지 않습니다");
			return;
		}
		alert("아이디는 "+data+" 입니다" );
	}
	
	$("#findPWBtn").click(function(){
		var email = $("#uemail").val();
		var url = "${pageContext.request.contextPath}/members/findPW/"+email+"/";
		$(".modal").css("display","flex");
		$.getJSON(url,function(data){
			
			if(!data){
				alert(email+"는 등록 되지 않은 회원입니다. 확인하여 주십시오");
				$(".modal").css("display","none");
			}else{
				alert(email+"주소로 메일을 발송 했습니다. \n메일에서 비밀번호를 확인 해주십시오");
				$(".modal").css("display","none");
			}
		});
	});
</script>
