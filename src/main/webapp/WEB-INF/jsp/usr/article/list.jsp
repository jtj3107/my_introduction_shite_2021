<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>
<div class="h-16"></div>
<section class="section section-article-list">
  <div class="container mx-auto px-4">
    <span>${board.name}</span>

    <div class="mt-3">
      <table class="table table-fixed w-full">
        <colgroup>
          <col width="10%" />
          <col width="20%" />
          <col width="20%" />
          <col width="*" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>번호</th>
            <th>작성날짜</th>
            <th>수정날짜</th>
            <th>작성자</th>
            <th>제목</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="article" items="${articles}">
            <tr>
              <th>${article.id}</th>
              <td>${article.forPrintType1RegDate}</td>
              <td>${article.forPrintType1UpdateDate}</td>
              <td>${article.extra__writerName}</td>
              <td>
                <a class="btn-text-link block w-full truncate" href="../article/detail?id=${article.id}">${article.title}</a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>