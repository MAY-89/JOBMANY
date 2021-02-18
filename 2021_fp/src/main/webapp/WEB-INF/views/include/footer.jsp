<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/include/footer.css">
<!-- footer -->		 
<footer>
	<div class="container">
		<div class="row footer-top">
			<div class="col footer-body-box">
				<a href="#" class="userInfos">회원약관</a>
				<div class="row footer-logo">
					<span class="footer-logo-front h2">J</span>
 					<span class="footer-logo-tail h2">ob Many</span>
				</div>
			</div>
			<div class="col footer-body-box">
				<a href="#">개인정보처리방침</a>
				<div class="row">test</div>
				<div class="row">test text shot</div>
				<div class="row">test</div>
				<div class="row">test text shot</div>
			</div>
			<div class="col footer-body-box">
				<a href="#">이메일무단수집거부</a>
				<div class="row">test text shot</div>
				<div class="row">test</div>
				<div class="row">test</div>
				<div class="row">test text shot</div>
			</div>
			<div class="col footer-body-box">
				<div class="row">test</div>
				<div class="row">test text shot</div>
				<div class="row">test text shot</div>
				<div class="row">test</div>
			</div>
		</div>
	</div>
	<div class="row footer-bottom">
			<span>Copyright 2021. ㈜Jobmany. All rights reserved.</span>
	</div>
</footer>


<!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src=" ${pageContext.request.contextPath}/resources/js/daum.js"></script>
<script>

//날짜 자동변환
function inputYMDNumber(obj) {
    // DELETE 키버튼이 눌리지 않은 경우에만 실행
    if(event.keyCode != 8) {
    	
        // 숫자와 하이픈(-)기호의 값만 존재하는 경우 실행
        if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {
        	
            // 하이픈(-)기호를 제거한다.
            var number = obj.value.replace(/[^0-9]/g,"");
            var ymd = "";
            
            // 문자열의 길이에 따라 Year, Month, Day 앞에 하이픈(-)기호를 삽입한다.
            if(number.length < 4) {
                return number;
            } else if(number.length < 6){
                ymd += number.substr(0, 4);
                ymd += "-";
                ymd += number.substr(4);
            } else {
                ymd += number.substr(0, 4);
                ymd += "-";
                ymd += number.substr(4, 2);
                ymd += "-";
                ymd += number.substr(6);
            }
            obj.value = ymd;
        } else {
            alert("숫자 이외의 값은 입력하실 수 없습니다.");
            obj.focus();
            // 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.
            obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");
            return false;
        }
    } else {
        return false;
    }
}

function inputMobileNumber(obj) {
    // DELETE 키버튼이 눌리지 않은 경우에만 실행
    if(event.keyCode != 8) {
    	
        // 숫자와 하이픈(-)기호의 값만 존재하는 경우 실행
        if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {
        	
            // 하이픈(-)기호를 제거한다.
            var number = obj.value.replace(/[^0-9]/g,"");
            var ymd = "";
            
            // 문자열의 길이에 따라 Year, Month, Day 앞에 하이픈(-)기호를 삽입한다.
            if(number.length < 3) {
                return number;
            } else if(number.length < 8){
                ymd += number.substr(0, 3);
                ymd += "-";
                ymd += number.substr(4);
            } else {
                ymd += number.substr(0, 3);
                ymd += "-";
                ymd += number.substr(4, 4);
                ymd += "-";
                ymd += number.substr(13);
            }
            obj.value = ymd;
        } else {
            alert("숫자 이외의 값은 입력하실 수 없습니다.");
            // 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.
            obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");
            
            return false;
        }
    } else {
        return false;
    }
}

</script>
</body>
</html>
</html>