<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<%@ include file="../common/head.jspf"%>
<div class="h-16"></div>

<section class="section section-member-login flex-grow flex justify-center items-center h-screen">
  <div class="w-full max-w-md">
    <div class="bordered shadow-lg bg-white">

      <div class="flex justify-center font-bold py-4">
        <span>Login</span>
      </div>

      <div class="p-4">
        <script>
			let MemberLogin__submitDone = false;
			function MemberLogin__submit(form) {
				if (MemberLogin__submitDone) {
					return;
				}

				form.loginId.value = form.loginId.value.trim();
						
				if (form.loginId.value.length == 0) {
					alert('아이디를 입력해주세요.');
					form.loginId.focus();

					return;
				}

				form.loginPw.value = form.loginPw.value.trim();

				if (form.loginPw.value.length == 0) {
					alert('비밀번호를 입력해주세요.');
					form.loginPw.focus();

					return;
				}
				
				form.loginPwReal.value = sha256(form.loginPw.value);
				form.loginPw.value = "";
				
				form.submit();
				MemberLogin__submitDone = true;
			}
		</script>

        <form action="../member/doLogin" method="POST" onsubmit="MemberLogin__submit(this); return false;">
          <input type="hidden" name="loginPwReal" />

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
          <div>
            <button type="submit" class="btn btn-link">로그인</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>