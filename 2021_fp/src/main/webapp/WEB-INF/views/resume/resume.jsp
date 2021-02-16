<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/resume/resume.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/resume/resume.jpg" class="main-header-top-img" alt="...">
</div>
<!-- 본문 -->
<form action="resumeWrite" method="post" encType="multipart/form-data">
<div class="container resume">
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
			<div class="row mb-3">
				<span class="h3 resume-subTitle">기본 정보</span>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3 " ><p>증명사진</p></div>
				<div class="col-md-5" >
					<img src="${pageContext.request.contextPath }/resources/img/jobmany.jpg" alt="사진" name="profile" id="profile" class="card-img-top"/>
					<input type="file" name="profilePic" id="profilePic" accept="image/*"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3" ><p>이름</p></div>
				<div class="col-md-5">
				<input type="text" name="rname" id='name' class="form-control" value="${userInfo.uname}" required/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>생년월일</p></div>
				<div class="col-md-5">
				<input type="text" name="rbirth" id='birth' onkeyup="inputYMDNumber(this)" maxlength="10" class="form-control date" value="${userInfo.ubirth}" placeholder="YYYY-MM-DD" required/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>이메일</p></div>
				<div class="col-md-5">
				<input type="email" name="email" id='email' class="form-control" value="${userInfo.uemail}" required/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>핸드폰번호</p></div>
				<div class="col-sm-1" >
				<select id="mobile1" class="custom-select moblieSelect" >
					<option value='010' selected>010</option>
					<option value='016'>016</option>
					<option value='017'>017</option>
					<option value='018'>018</option>
				</select>
				</div>
				<div class="col-md-2">
				<input type="text" id='mobile2' maxlength="4" class="form-control" required/>
				</div>
				<div class="col-md-2">
				<input type="text" id='mobile3' maxlength="4" class="form-control" required/>
				</div>
				<input type="hidden" name="mobile" id='mobile' class="form-control" required/>
			</div>	
			<div class="row mb-3">
				<div class="col-sm-3"><p>전화번호</p></div>
				<div class="col-md-5">
					<input type="text" name="phone" id='phone' class="form-control"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3" ><p>주소</p></div>
				<div class="col-md-3 form-floating mb-2 input-group">
					<input type="text" name="postcode" id="sample6_postcode" readonly placeholder="우편번호" class="form-control" value="${userInfo.postcode}" required />
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success" />
				</div>
			</div>	
			<div class="row mb-3">
				<div class="col-sm-3" ></div><!--  -->
				<div class="col-md-3 form-floating mb-3">
					<input type="text" name="addr" id="sample6_address" class="form-control" readonly placeholder="주소" required value="${userInfo.addr}"/>
				</div>
				<div class="col-md-3 ml-n3 form-floating mb-3">
					<input type="text" name="detailAddr" id="sample6_detailAddress" placeholder="상세주소" class="form-control" required value="${userInfo.detailAddr}" />
					<input type="hidden" name="extraAddr" id="sample6_extraAddress" readonly placeholder="참고항목" />
				</div>
			</div>
		</div>
	</div>
		<hr/>
		<div class="container">
			<div class="row mb-3">
				<span class="h3 resume-subTitle">최종학력 정보</span>
			</div>
			<div class='row'>
				<div class="col-lg schoolType rounded ">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu" >
						<input class='radioo' type="radio" name="schoolType" value="primary" class="form-control"  />
						<span class="radio-btn">초등학교</span>
					</label>
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu" >
						<input class='radioo' type="radio" name="schoolType" value="middle" class="form-control" />
						<span class="radio-btn">중학교</span>
					</label>
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu">
						<input class='radioo' type="radio" name="schoolType" value="high" class="form-control" />
						<span class="radio-btn">고등학교</span>
					</label>	
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu">
						<input class='radioo' type="radio" name="schoolType" value="university" class="form-control" />
						<span class="radio-btn">대학교</span>
					</label>
				</div>
			</div>
		</div>
		<hr/>
		<div class="container">
			<div class="row mb-3">
				<span class="h3 resume-subTitle">대학 정보</span>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">대학교이름</span>
				</div>
				<div class='col'>
					<input type="text" name="uniName" id="uniName" class="form-control"/>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">대학교종류</span>
				</div>
				<div class='col'>
					<select name="uniType" id="uniType" class="form-control">
						<option value="">대학교종류를 골라주세요</option>
						<option value="college">대학(2/3년)</option>
						<option value="University">대학(4년)</option>
						<option value="Master">석사</option>
						<option value="Doctor">박사</option>
 					</select>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">전공</span>
				</div>
				<div class='col'>
					<input type="text" name="uniMajor" id="major" class="form-control"/>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">평균학점</span>
				</div>
				<div class='col'>
					<input type="text" name="uniGrade" id="uniGrade" class="form-control"/>
				</div>
			</div>
		</div>
		<hr/>
		<div class='container'>
			<div class='row mb-3'>
				<span class="h3 resume-subTitle">경력사항</span>
			</div>
			<div class='row mb-3'>
				<div class="col careerType" >
					<label class="col-md-12 pt-3 pb-2">
						<input type="radio" name="careerType" value="1"/>
						<span class="radio-btn">신입</span>
					</label>
				</div>
				<div class="col careerType" >
					<label class="col-md-12 pt-3 pb-2">
						<input type="radio" name="careerType" value="2"/>
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
						<input type='text' name='companyName' class="form-control"/>
					</div>
				</div>
				<div class='row mb-3'>
					<div class='col-md-3'>
						<span class="p">경력기간</span>
					</div>
					<div class='col-md-2'>
						<input type='text' onkeyup="inputYMDNumber(this)" maxlength="10" placeholder="YYYY-MM-DD" id='exStartDate' name='exStartDate' class="form-control"/>
					</div>
					<div class='col-sm-1'>
						<span>~</span>
					</div>
					<div class='col-md-2 ml-n5'>
						<input type='text' onkeyup="inputYMDNumber(this)" maxlength="10" placeholder="YYYY-MM-DD" id='exEndDate' name='exEndDate' class="form-control"/>
					</div>
				</div>
			</div>
		</div>
		<hr/>
		<div class="container">
			<div class="row self">
				<div class="col-md-3">
					<span class="h3 resume-subTitle">자기소개</span>
				</div>
			</div>
			<div class="row">
				<div class='col justify-content-center'>
					<textarea name="introduce" class="form-control col-md-8 mb-5 d-flex justify-content-center ml-3" rows="10" cols="300" maxlength="400"></textarea>
				</div>
			</div>		
		</div>
		<hr/>
		<div class="container">
			<div class="row portfolio">
				<div class='col-md-3'>
					<span class="h3 resume-subTitle">포트폴리오</span>
				</div>
			</div>
			<div class="row">
				<div class='col'>
					<input type="file" accept=".zip" name="portfoliofile" class="form-control col-md-6"/>
				</div>
			</div>		
		</div>
		<hr/>
		<div class="container">
			<div class="row portfolio-btn-box">
				<div class="col">
					<input class="btn btn-outline-success" type="submit" value="작성완료"/>
					<!-- <input class="btn btn-outline-primary" type="button" value="작성글 공개"/>  --><!-- onclick="#" -->
					<input class="btn btn-outline-warning" type="reset" value="다시쓰기"/>
				</div> 
			</div>
		</div>
</form>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	
	$("#mobile1").on("change",function(){
		$("#mobile2").focus();
	});
	
	$("#mobile2").on("keyup",function(){
		if(this.value.length == 4){
			$("#mobile3").focus();
		}
	});
	$("#mobile3").on("keyup",function(){
		if(this.value.length == 4){
			$("#mobile").val($("#mobile1").val() +"-"+ $("#mobile2").val() +"-"+ $("#mobile3").val());
			console.log($("#mobile").val());
		}
	});
	
	
	if(${!empty message}){
		alert("${message}");
	}	

	$("#profilePic").on("change",function(){
		var files = this.files;
		console.log(files)
		$("#profile").attr("src",window.URL.createObjectURL(files[0]));
	});
	
	
	$(document).ready(function () {
		$("radio").css({
			display : "none"
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
    	var aaa =$(':radio[name="schoolType"]:checked').val();
    }); 
     
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
     		color : "white"
     	});
     	$(this).closest("div").css({
     		backgroundColor :"#72c02c",
     		color : "white"
     	});
		var career = $(':radio[name="careerType"]:checked').val();
     	if(career == 2){
     		$("#expertInfo").show("800","linear");
     	}else{
     		$("#expertInfo").hide("800","linear");
     	}
     });
     
     
    
    
    
    
</script>
