/**
 *  memberInfo 정규식
 */
   var modifyBtn = document.getElementById("modify");
   var modifyClick = document.getElementById("modifyMember");
   var title = document.getElementById("title");
   var inputTag = document.getElementsByTagName("input");
   var hiddenMember = document.getElementsByClassName('hiddenMember');
   var clickHidden = document.getElementsByClassName('clickHidden');
   var signForm = document.getElementById("signForm"); 
   
   
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
		console.log($("#profileImage").val(""));
		$("#profileImage").val("");
		$("imgView").attr("src",imgTemp);
	}	
	
   
    document.getElementById("modifyMember").addEventListener("click", function(){
    	var upassword = document.getElementById("upassword");
    	var uno = document.getElementById("uno").value;
    	var url = root+"/members/modifyPWcheck/"+uno+"/"+upassword.value;
    	
    	if(upassword.value == "" || upassword.value == null){
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
		            upassword.value = "";
		            upassword.removeAttribute("required",0);
		            title.innerHTML = "회원 정보 수정";
		            
		            
		            $("#upassword").on("input",function(){
		    			
		    			var tempval = $("#upassword").val();
		    			var elP = $(this).parent().find(".result");
		    			var messageP = "패스워드는 특수 문자 포함한 영문자만 입력 가능 합니다.";
		    			isCheckobj["bool1"].bool = checkRegex(elP,tempval,regexPass,messageP,null)
		    		});
		       }
			}else{
				alert("비밀번호를 확인 해 주세요");
			}
		});
   });
    
    document.getElementById("withdraw").addEventListener("click", function(){
   		var upassword = document.getElementById("upassword").value;	
   		var uno = document.getElementById("uno").value;
   		var url = root+"/members/modifyPWcheck/"+uno+"/"+upassword;

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
    
    
    $("#modify").click(function(){
    	signSubmit();
    });
    
    
    
    /**
     *  member 정규식
     */
    			
    		var isCheckobj ={
    				bool1 : {id : $("#upassword") , bool : true,message:"패스워드를 확인 해주세요"},
    				bool2 : {id : $("#uname") , bool : true,message:"이름을 확인 해주세요"},
    				bool3 : {id : $("#unickname") , bool : true,message:"닉네임을 확인 해주세요"},
    				bool4 : {id : $("#ubirth") , bool : true,message:"생년월일을 확인 해주세요"}
    		}
    		
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
    		
    		$("#uname").on("input",function(){
    			var tempval = $(this).val();
    			var elP = $(this).parent().find(".result");
    			var messageP = "영문제외 공란 주의 바랍니다";
    			isCheckobj["bool2"].bool =checkRegex(elP,tempval,regexName,messageP,null);
    		});
    		
    		$("#unickname").on("input",function(){
    			var tempval = $(this).val();
    			var elP = $(this).parent().find(".result");
    			var messageP = "특수문자 제외!";
    			console.log(tempval);
    			isCheckobj["bool3"].bool =checkRegex(elP,tempval,regexNick,messageP,checkUser);
    			console.log(isCheckobj["bool3"].bool);
    		});
    		
    		$("#ubirth").on("input",function(){
    			var tempval = $(this).val();
    			var elP = $(this).parent().find(".result");
    			var messageP = "19001231 형식으로 작성";
    			console.log(tempval);
    			isCheckobj["bool4"].bool =checkRegex(elP,tempval,regexBirth,messageP,null);
    		});
    		
    		function signSubmit(){
    			var okNum = 0;	
    			for(var i = 1; i<5; i++){
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
    			if(okNum === 4) $("#signForm").submit();
    		}		