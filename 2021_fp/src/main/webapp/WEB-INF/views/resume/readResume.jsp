<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/resume/readResume.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/resume/resume.jpg" class="main-header-top-img" alt="...">
</div>
<div style="margin-top: 180px;"></div>
<form action="updateResume" method="get">
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
					<input type="file" name="profilePic" id="profilePic" accept="image/*" disabled/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3" ><p>이름</p></div>
				<div class="col-md-5">
				<input type="text" name="rname" id='name' class="form-control" value="${resume.rname } " readonly/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>생년월일</p></div>
				<div class="col-md-5">
				<input type="date" name="rbirth" id='birth' class="form-control" value="${resume.rbirth } " readonly/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>이메일</p></div>
				<div class="col-md-5">
				<input type="email" name="email" id='email' class="form-control" value="${resume.email }" readonly />
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>핸드폰번호</p></div>
				<div class="col-md-5">
				<input type="text" name="mobile" id='mobile' class="form-control" value="${resume.mobile }" readonly/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3"><p>전화번호</p></div>
				<div class="col-md-5">
					<input type="text" name="phone" id='phone' class="form-control" value="${resume.phone }" readonly />
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
					<input type="text" name="detailAddr" id="sample6_detailAddress" value="${resume.detailAddr }" readonly class="form-control">
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
						${resume.schoolType == "primary" ? "checked" : "" } readonly />
						<span class="radio-btn">초등학교</span>
					</label>
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu" >
						<input class='radioo' type="radio" name="schoolType" value="middle" class="form-control"  
						${resume.schoolType == "middle" ? "checked" : "" } readonly />
						<span class="radio-btn">중학교</span>
					</label>
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu">
						<input class='radioo' type="radio" name="schoolType" value="high" class="form-control" 
						${resume.schoolType == "high" ? "checked" : "" } readonly />
						<span class="radio-btn">고등학교</span>
					</label>	
				</div>
				<div class="col-lg schoolType rounded">
					<label class="col-lg-12 schoolType pt-3 pb-2" id="labelu">
						<input class='radioo' type="radio" name="schoolType" value="university" class="form-control" 
						${resume.schoolType == "university" ? "checked" : "" } readonly />
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
					<input type="text" name="uniName" id="uniName" class="form-control" value="${resume.uniName }" readonly/>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">대학교종류</span>
				</div>
				<div class='col'>
					<select name="uniType" id="uniType" class="form-control" readonly>
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
					<input type="text" name="uniMajor" id="uniMajor" value="${resume.uniMajor }" class="form-control" readonly/>
				</div>
			</div>
			<div class='row mb-3'>
				<div class='col-sm-3'>
					<span class="p">평균학점</span>
				</div>
				<div class='col'>
					<input type="number" name="uniGrade" id="uniGrade" value="${resume.uniGrade }" class="form-control" readonly/>
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
						<input type="radio" name="careerType" value="1" ${resume.careerType == 1 ? "checked" : "" } readonly/>
						<span class="radio-btn">신입</span>
					</label>
				</div>
				<div class="col careerType" >
					<label class="col-md-12 pt-3 pb-2">
						<input type="radio" name="careerType" value="2" ${resume.careerType == 2 ? "checked" : "" } readonly/> 
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
						<input type='text' name='companyName' value="${resume.companyName }" class="form-control" readonly/>
					</div>
				</div>
				<div class='row mb-3'>
					<div class='col-md-3'>
						<span class="p">경력기간</span>
					</div>
					<div class='col-md-2'>
						<input type='date' id='exStartDate' name='exStartDate' value="${resume.exStartDate }" class="form-control" readonly/>
					</div>
					<div class='col-sm-1'>
						<span>~</span>
					</div>
					<div class='col-md-2 ml-n5'>
						<input type='date' id='exEndDate' name='exEndDate' value="${resume.exEndDate }" class="form-control" readonly/>
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
					<textarea readonly name="introduce" class="form-control col-md-8 mb-5 d-flex justify-content-center ml-3" rows="10" cols="100" maxlength="200">
						${resume.introduce }
					</textarea>
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
					<input type="file" name="portfolio" class="form-control col-md-6" value="${resume.portfolio }" disabled/>
					<input type="text" value="${pageContext.request.contextPath}/upload/${resume.portfolio }" readonly/>
				</div>
			</div>		
		</div>
		<hr/>
		<div class="container">
			<div class='row d-flex mb-2 portfolio-btn-box'>
				<div class="col">
					<c:choose>
						<c:when test="${userInfo.uno eq rno }">
							<input class="btn btn-outline-danger" type="button" value="${resume.showhide eq 'y' ? '비공개' : '공개'}" id="showhideBtn"/>	
							<input class="btn btn-outline-success" type="submit" value="수정" />
						</c:when>
						<c:otherwise>
							<input class="btn btn-outline-success" type="button" value="좋아요" id="likeBtn"/>	
						</c:otherwise>
					</c:choose>
					<input class="btn btn-outline-primary" type="button" onclick="location.href='resumeList'" value="글목록"/>
				</div> 
			</div>
		</div>
		<input type="hidden" name="rno" id="rno" value="${resume.rno}">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
</form>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	$("#profilePic").on("change",function(){
		var files = this.files;
		console.log(files)
		$("#profile").attr("src",window.URL.createObjectURL(files[0]));
	});
	
	$("#showhideBtn").on("click",function(){
		var form = $("form");
		form.
	});
	
	
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
