<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<%@ include file="../common/head.jspf"%>
<div class="h-16"></div>

<section class="section section-member-join flex-grow flex justify-center items-center h-screen">
  <div class="w-full max-w-md">
    <div class="bordered shadow-lg bg-white">

      <div class="flex justify-center font-bold py-4">
        <span>회원가입</span>
      </div>

      <div class="p-4">
        <script>
    		let MemberJoin__submitDone = false;
    		function MemberJoin__submit(form) {
    			if (MemberJoin__submitDone) {
    				return;
    			}
    
    			if(form.agreementTermsOfService.checked == false) {
    				alert('이용약관에 동의해야 진행할 수 있습니다.');
    				form.agreementTermsOfService.focus();
    				
    				return;
    			}
    			
    			if(form.agreementPrivacyPolicy.checked == false) {
    				alert('개인정보취급방침에 동의해야 진행할 수 있습니다.');
    				form.agreementPrivacyPolicy.focus();
    				
    				return;
    			}
    			
    			form.loginId.value = form.loginId.value
    					.trim();
    
    			if (form.loginId.value.length == 0) {
    				alert('아이디를 입력해주세요.');
    				form.loginId.focus();
    
    				return;
    			}
    
    			form.loginPw.value = form.loginPw.value
    					.trim();
    
    			if (form.loginPw.value.length == 0) {
    				alert('비밀번호를 입력해주세요.');
    				form.loginPw.focus();
    
    				return;
    			}
    			
    			form.loginPwConfirm.value = form.loginPwConfirm.value
				.trim();

        		if (form.loginPwConfirm.value.length == 0) {
        			alert('비밀번호 확인을 입력해주세요.');
        			form.loginPwConfirm.focus();
        
        			return;
        		}
        		
        		if(form.loginPw.value != form.loginPwConfirm.value ) {
        			alert('로그인 비밀번호가 일치하지 않습니다.');
        			form.loginPwConfirm.focus();
        			
        			return;
        		}
        		
        		form.name.value = form.name.value
				.trim();

        		if (form.name.value.length == 0) {
        			alert('이름을 입력해주세요.');
        			form.name.focus();
        
        			return;
        		}
        		
        		form.nickname.value = form.nickname.value
				.trim();

        		if (form.nickname.value.length == 0) {
        			alert('별명을 입력해주세요.');
        			form.nickname.focus();
        
        			return;
        		}
        		
        		form.email.value = form.email.value
				.trim();

        		if (form.email.value.length == 0) {
        			alert('이메일을 입력해주세요.');
        			form.email.focus();
        
        			return;
        		}
        		
        		form.cellphoneNo.value = form.cellphoneNo.value
				.trim();

        		if (form.cellphoneNo.value.length == 0) {
        			alert('전화번호를 입력해주세요.');
        			form.cellphoneNo.focus();
        
        			return;
        		}
            
    			form.loginPwReal.value = sha256(form.loginPw.value);
    			form.loginPw.value = "";
    
    			form.submit();
    			MemberJoin__submitDone = true;
    		}
    	</script>

        <form action="../member/doJoin" method="POST" onsubmit="MemberJoin__submit(this); return false;">
          <input type="hidden" name="loginPwReal" />

          <div class="form-control">
            <label class="label">
              <span class="label-text">
                <span>이용약관</span>
                <a href="#" class="s-link">다시 확인하기</a>
              </span>
            </label>
            <div>
              <label class="flex">
                <input type="checkbox" class="checkbox" name="agreementTermsOfService" />
                <span class="ml-2">이용약관에 동의합니다.</span>
              </label>
            </div>
          </div>
          
          <div class="form-control">
            <label class="label">
              <span class="label-text">
                <span>개인정보취급방침</span>
                <a href="#" class="s-link">다시 확인하기</a>
              </span>
            </label>
            <div>
              <label class="flex">
                <input type="checkbox" class="checkbox" name="agreementPrivacyPolicy" />
                <span class="ml-2">개인정보취급방침에 동의합니다.</span>
              </label>
            </div>
          </div>

          <div class="form-control">
            <label class="label">
              <span class="label-text">로그인 아이디</span>
            </label>
            <input type="text" name="loginId" placeholder="로그인 아이디를 입력해주세요." class="input input-primary input-bordered">
          </div>

          <div class="form-control">
            <label class="label">
              <span class="label-text">로그인 비밀번호</span>
            </label>
            <input type="password" name="loginPw" placeholder="로그인 비밀번호를 입력해주세요." class="input input-secondary input-bordered">
          </div>

          <div class="form-control">
            <label class="label">
              <span class="label-text">로그인 비밀번호 확인</span>
            </label>
            <input type="password" name="loginPwConfirm" placeholder="로그인 비밀번호 확인을 입력해주세요." class="input input-secondary input-bordered">
          </div>

          <div class="form-control">
            <label class="label">
              <span class="label-text">이름</span>
            </label>
            <input type="text" name="name" placeholder="이름을 입력해주세요." class="input input-secondary input-bordered">
          </div>

          <div class="form-control">
            <label class="label">
              <span class="label-text">닉네임</span>
            </label>
            <input type="text" name="nickname" placeholder="별명을 입력해주세요." class="input input-secondary input-bordered">
          </div>
          
          <div class="form-control">
            <label class="label">
              <span class="label-text">이메일</span>
            </label>
            <input type="email" name="email" placeholder="이메일을 입력해주세요." class="input input-secondary input-bordered">
          </div>
          
          <div class="form-control">
            <label class="label">
              <span class="label-text">전화번호</span>
            </label>
            <input type="tel" name="cellphoneNo" placeholder="별명을 입력해주세요." class="input input-secondary input-bordered">
          </div>
          
          <div>
            <button type="submit" class="btn btn-link">회원가입</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>