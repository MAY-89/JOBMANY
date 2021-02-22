/**
 *  member 정규식
 */
			
		$("#uemail").focus();

		var isCheckobj ={
				bool1 : {id : $("#uemail") , bool : false, message:"아이디를 확인 해주세요"},
				bool2 : {id : $("#upassword") , bool : false,message:"패스워드를 확인 해주세요"},
				bool3 : {id : $("#passwordRe") , bool : false,message:"패스워드를 다시 확인 해주세요"},
				bool4 : {id : $("#uname") , bool : false,message:"이름을 확인 해주세요"},
				bool5 : {id : $("#unickname") , bool : false,message:"닉네임을 확인 해주세요"},
				bool6 : {id : $("#ubirth") , bool : false,message:"생년월일을 확인 해주세요"}
		}
		
		// 이메일
		var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		// 특수문자 포함 비밀번호
		var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		// 한글 영문 포함 2~6자 이내
		var regexName = /^[\uac00-\ud7a3]{2,6}$/;	
		// 생년월일  19820607
		var regexBirth = /^[0-9]{4}[0-9]{2}[0-9]{2}$/;
		// 닉네임 특수문자 제외
		var regexNick = /^[\uac00-\ud7a3a-zA-Z\s0-9]{2,16}$/;
		
		function checkRegex(elP,valP,regexP,messageP,ajaxP){
			
			if(regexP.test(valP) === false){
				showMessage(elP,messageP,false)
				return false;
			}else if(regexP.test(valP) !== false && ajaxP === null){
				showMessage(elP,"사용 가능 합니다",true);
				return true
			}else{
				
				if(ajaxP !== null){
					return ajaxP(elP,valP);
				}
			}
		}
		
		function checkUser(elP,valP){
			var isBool = false;
			var url = root+"/members/checkUser";
			$.ajax({
				url : url,
				type : "get",
				data : {
					user : valP
				},
				dataType : "json",
				async:false,
				success : function(data){
					isBool = data;
					showMessage(elP,data ? "사용가능합니다." : "이미 가입된 정보 입니다", data);
				}
			});
			return isBool;
		}
		
		function showMessage(elP,messageP,isChecked){
			isChecked ? $(elP).css("color","green") : $(elP).css("color","red");
			$(elP).text(messageP);
		}
		
		$("#uemail").on("input",function(){
			var tempval = $(this).val();
			var elP = $(this).parent().find(".result");
			var messageP = "이메일 형식으로만 사용 가능 합니다";
			isCheckobj["bool1"].bool = checkRegex(elP,tempval,regexEmail,messageP,checkUser);
		});
		
		$("#upassword").on("input",function(){
			
			var tempval = $("#upassword").val();
			var elP = $(this).parent().find(".result");
			var messageP = "패스워드는 특수 문자 포함한 영문자만 입력 가능 합니다.";
			isCheckobj["bool2"].bool = checkRegex(elP,tempval,regexPass,messageP,null)
		});
		
		$("#passwordRe").on("input",function(){
			var tempval = $(this).val();
			var elP = $(this).parent().find(".result");
			var messageP = "패스워드 확인 바랍니다";
			
			if(isCheckobj["bool2"].bool === true){
				if($("#upassword").val() === tempval){
					messageP ="비밀번호 확인 완료";
					isCheckobj["bool3"].bool = true;
				}else{
					isCheckobj["bool3"].bool = false;
				}
			}
			showMessage(elP,messageP,isCheckobj["bool3"].bool);
		});
		
		$("#uname").on("input",function(){
			var tempval = $(this).val();
			var elP = $(this).parent().find(".result");
			var messageP = "영문제외 공란 주의 바랍니다";
			isCheckobj["bool4"].bool =checkRegex(elP,tempval,regexName,messageP,null);
		});
		
		$("#unickname").on("input",function(){
			var tempval = $(this).val();
			var elP = $(this).parent().find(".result");
			var messageP = "특수문자 제외!";
			console.log(tempval);
			isCheckobj["bool5"].bool =checkRegex(elP,tempval,regexNick,messageP,checkUser);
		});
		
		$("#ubirth").on("input",function(){
			var tempval = $(this).val();
			var elP = $(this).parent().find(".result");
			var messageP = "19001231 형식으로 작성";
			console.log(tempval);
			isCheckobj["bool6"].bool =checkRegex(elP,tempval,regexBirth,messageP,null);
		});
		$("#signSubmit").click(function(){
			signSubmit();		
		});
		
		