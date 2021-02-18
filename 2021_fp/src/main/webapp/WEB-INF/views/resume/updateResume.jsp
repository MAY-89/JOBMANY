<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/resume/readResume.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/resume/resume.jpg" class="main-header-top-img" alt="...">
</div>
<div style="margin-top: 180px;"></div>
<form action="updateResume" method="post" encType="multipart/form-data">
<div class="container readResume">
	<div class="container resume-top">
		<div class="row">
			<div class="col-md-10">
				<span class="h2 resume-title-front">이</span>
				<span class="h2 resume-title-tail">력서 정보 &nbsp; </span>
			</div>
		</div>
	</div>
		<div class="container">
		<hr/>
			<div class="row mb-3 readResume-subTitle h3">
				기본 정보
			</div>
			<div class="row mb-3">
				<div class="col-sm-3 " ><p>증명사진</p></div>
				<div class="col-md-5" >
					<img src="${pageContext.request.contextPath}/upload/${resume.pic}" alt="사진" name="profile" id="profile" class="card-img-top"/>
					<input type="file" name="profilePic" id="profilePic" accept="image/*" value="${resume.pic}"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3" ><p>이름</p></div>
				<div class="col-md-5">
				<input type="text" name="rname" id='name' class="form-control" value="${resume.rname }"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>생년월일</p></div>
				<div class="col-md-5">
				<input type="text" name="rbirth" id='birth' class="form-control" value="${resume.rbirth }" onkeyup="inputYMDNumber(this)" maxlength="10"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>이메일</p></div>
				<div class="col-md-5">
				<input type="email" name="email" id='email' class="form-control" value="${resume.email }"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>핸드폰번호</p></div>
				<div class="col-md-5">
				<input type="text" name="mobile" id='mobile' class="form-control" value="${resume.mobile }"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>전화번호</p></div>
				<div class="col-md-5">
					<input type="text" name="phone" id='phone' class="form-control" value="${resume.phone }"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3" ><p>주소</p></div>
				<div class="col-md-3 form-floating mb-2 input-group">
					<input type="text" name="postcode" id="sample6_postcode" readonly class="form-control" value="${resume.postcode }" />
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success" />
				</div>
			</div>	
			<div class="row mb-3">
				<div class="col-sm-3" ></div><!--  -->
				<div class="col-md-3 form-floating mb-3">
					<input type="text" name="addr" id="sample6_address" class="form-control" readonly value="${resume.addr }" >
				</div>
				<div class="col-md-3 ml-n3 form-floating mb-3">
					<input type="text" name="detailAddr" id="sample6_detailAddress" value="${resume.detailAddr }" class="form-control">
					<input type="hidden" name="extraAddr" id="sample6_extraAddress" readonly placeholder="참고항목">
				</div>
			</div>
		</div>
	</div>
		<hr/>
		<div class="container">
			<div class="row mb-3 readResume-subTitle h3">
				최종학력 정보
			</div>
			<div class='row'>
				<div class="col-lg schoolType rounded ">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu" >
						<input class='radioo' type="radio" name="schoolType" value="primary" class="form-control" 
						${resume.schoolType == "primary" ? "checked" : "" }	/>
						<span class="radio-btn">초등학교</span>
					</label>
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu" >
						<input class='radioo' type="radio" name="schoolType" value="middle" class="form-control"  
						${resume.schoolType == "middle" ? "checked" : "" }/>
						<span class="radio-btn">중학교</span>
					</label>
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu">
						<input class='radioo' type="radio" name="schoolType" value="high" class="form-control" 
						${resume.schoolType == "high" ? "checked" : "" }/>
						<span class="radio-btn">고등학교</span>
					</label>	
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu">
						<input class='radioo' type="radio" name="schoolType" value="university" class="form-control" 
						${resume.schoolType == "university" ? "checked" : "" }/>
						<span class="radio-btn">대학교</span>
					</label>
				</div>
			</div>
		</div>
		<hr/>
		<div class="container">
			<div class="row mb-3 readResume-subTitle h3">
				대학 정보
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">대학교이름</span>
				</div>
				<div class='col'>
					<input type="text" name="uniName" id="uniName" class="form-control" value="${resume.uniName }"/>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">대학교종류</span>
				</div>
				<div class='col'>
					<select name="uniType" id="uniType" class="form-control">
						<option value="">대학교종류를 골라주세요</option>
						<option value="college" ${resume.uniType == "college" ? "selected" : "" }>대학(2/3년)</option>
						<option value="University" ${resume.uniType == "University" ? "selected" : "" }>대학(4년)</option>
						<option value="Master" ${resume.uniType == "Master" ? "selected" : "" }>석사</option>
						<option value="Doctor" ${resume.uniType == "Doctor" ? "selected" : "" }>박사</option>
 					</select>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">전공</span>
				</div>
				<div class='col'>
					<input type="text" name="uniMajor" id="uniMajor" value="${resume.uniMajor }" class="form-control"/>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">평균학점</span>
				</div>
				<div class='col'>
					<input type="number" name="uniGrade" id="uniGrade" value="${resume.uniGrade }" class="form-control"/>
				</div>
			</div>
		</div>
		<hr/>
		<div class='container'>
			<div class='row mb-3'>
				<span class="h3 readResume-subTitle">경력사항</span>
			</div>
			<div class='row mb-3'>
				<div class="col careerType" >
					<label class="col-md-12 pt-3 pb-2">
						<input type="radio" name="careerType" value="1" ${resume.careerType == 1 ? "checked" : "" }/>
						<span class="radio-btn">신입</span>
					</label>
				</div>
				<div class="col careerType" >
					<label class="col-md-12 pt-3 pb-2">
						<input type="radio" name="careerType" value="2" ${resume.careerType == 2 ? "checked" : "" }/> 
						<span class="radio-btn">경력</span>
					</label>
				</div>
				
			</div>
			<hr/>
			<div id='expertInfo' style="display:none;">
				<div class='row mb-3'>
					<div class='col-md-3'>
						<span class="p">회사명</span>
					</div>
					<div class='col-md-3'>
						<input type='text' name='companyName' value="${resume.companyName }" class="form-control"/>
					</div>
				</div>
				<div class='row mb-3'>
					<div class='col-md-3'>
						<span class="p">경력기간</span>
					</div>
					<div class='col-md-2'>
						<input type='text' id='exStartDate' name='exStartDate' value="${resume.exStartDate }" class="form-control" onkeyup="inputYMDNumber(this)" maxlength="10"/>
					</div>
					<div class='col-sm-1'>
						<span>~</span>
					</div>
					<div class='col-md-2 ml-n5'>
						<input type='text' id='exEndDate' name='exEndDate' value="${resume.exEndDate }" class="form-control" onkeyup="inputYMDNumber(this)" maxlength="10"/>
					</div>
				</div>
			</div>
		</div>
		<hr/>
		<div class="container">
			<div class="row self">
				<div class='col-md-3'>
					<span class="h3 readResume-subTitle">자기소개</span>
				</div>
			</div>
			<div class="row">
				<div class='col justify-content-center'>
					<textarea name="introduce" class="form-control col-md-8 mb-5 d-flex justify-content-center ml-3" rows="10" cols="100" maxlength="200">${resume.introduce }</textarea>
				</div>
			</div>		
		</div>
		<hr/>
		<div class="container">
			<div class="row portfolio">
				<div class='col-md-3'>
					<span class="h3 readResume-subTitle">포트폴리오</span>
				</div>
			</div>
			<div class="row">
				<div class='col'>
					<input type="file" name="portfoliofile" class="form-control col-md-6" value="${resume.portfolio }" accept=".zip"/>
				</div>
			</div>		
		</div>
		<hr/>
		<div class="container">
			<div class='row d-flex mb-2 portfolio-btn-box'>
				<div class="col">
					<input class="btn btn-outline-success" type="submit" value="수정완료"/>
					<input class="btn btn-outline-danger" type="button" value="${resume.showhide eq 'y' ? '비공개' : '공개'}" id="showhideBtn"/>
					<input class="btn btn-outline-primary" type="button" onclick="location.href='resumeList'" value="목록" id="updateBtn"/>
				</div> 
			</div>
		</div>
		<input type="hidden" name="rno" id="rno" value="${resume.rno}">
</form>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	if(${!empty message}){
		alert("${message}");
	}
	
	$("#profilePic").on("change",function(){
		var files = this.files;
		console.log(files)
		$("#profile").attr("src",window.URL.createObjectURL(files[0]));
	});
	
	$("#showhideBtn").click(function(){
		var rno = ${resume.rno}
		console.log(rno);
			$.ajax({
				type : "post",
				url : "showhide/"+rno,
				contentType : "application/x-www-fromurlencoded; charset=utf-8",
				success : function(data){
					alert(data+"으로 변경하였습니다.")
				}
			});
	});
	
    
     $(".schoolType").find("label").click(function(){
    	$(".schoolType").css({
    		backgroundColor : "white",
    		color : "black"
    	});
    	$(this).css({
    		backgroundColor :"#72c02c",
    		color: "white"
    	});
    	$(this).closest("div").css({
    		backgroundColor :"#72c02c",
    		color: "white",
    	});
    }); 

     $.each($("input:checked"),function(){
    	$(this).closest("label").css({
    		backgroundColor :"#72c02c",
     		color : "white" 	
    	});
    	$(this).closest("div").css({
    		backgroundColor :"#72c02c",
     		color : "white" 	
    	}); 
     })
     
     
     $(".careerType").find("label").click(function(){
     	$(".careerType").css({
     		backgroundColor : "white",
     		color : "black"
     	});
     	$(".careerType").find("label").css({
     		backgroundColor : "white",
     		color : "black"
     	});
     	$(this).css({
     		backgroundColor :"#72c02c",
     		color: "white"
     	});
     	$(this).closest("div").css({
     		backgroundColor :"#72c02c",
     		color: "white"
     	});
		
	    var career = $(':radio[name="careerType"]:checked').val();
	  	if(career == 2){
	  		$("#expertInfo").show("800","linear");
	  	}else{
	  		$("#expertInfo").hide("800","linear");
	  	}
    });
     
     
    
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
