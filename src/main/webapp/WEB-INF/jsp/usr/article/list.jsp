<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>
<div class="h-16"></div>
<section class="section section-article-list">
  <div class="container mx-auto px-4">
    <span>${board.name}</span>
     
    <div class="px-4">
      <c:forEach items="${articles}" var="article">
        <div class="grid gap-3">
          <a href="#">
            <span class="badge badge-outline">제목</span>
            <div>${article.title}</div>
          </a>
        </div>
        
        <div class="mt-3 grid sm:grid-cols-2 lg:grid-cols-4 gap-3">
          <a href="#">
            <span class="badge badge-outline">번호</span>
            <div>${article.id}</div>
          </a>
          <a href="#">
            <span class="badge badge-outline">작성자</span>
            <div>${article.extra__writerName}</div>
          </a>
          <a href="#">
            <span class="badge badge-outline">등록날짜</span>
            <div>${article.forPrintType2RegDate}</div>
          </a>
          <a href="#">
            <span class="badge badge-outline">수정날짜</span>
            <div>${article.forPrintType2UpdateDate}</div>
          </a>
        </div>
        <hr />
      </c:forEach>
    </div>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>