<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>
<div class="h-16"></div>
<section class="section section-article-list">
  <div class="container mx-auto px-4">
    <span>${board.name}</span>

    <div>
      게시물 개수 :
      <span class="badge badge-primary">${articlesCount}개</span>
    </div>

    <div class="mt-3">
      <table class="table table-fixed w-full">
        <colgroup>
          <col width="10%" />
          <col width="*" />
          <col width="20%" />
          <col width="20%" />
          <col />
        </colgroup>
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>수정날짜</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="article" items="${articles}">
            <tr>
              <th>${article.id}</th>
              <td>
                <a class="btn-text-link block w-full truncate" href="../article/detail?id=${article.id}">${article.title}</a>
              </td>
              <td>${article.extra__writerName}</td>
              <td>${article.forPrintType1RegDate}</td>
              <td>${article.forPrintType1UpdateDate}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="page-menu hidden md:flex justify-center mt-5">
      <c:set var="pageMenuArmSize" value="4" />
      <c:set var="startPage" value="${page - pageMenuArmSize >= 1 ? page - pageMenuArmSize : 1}" />
      <c:set var="endPage" value="${page + pageMenuArmSize <= pageCount ? page + pageMenuArmSize : pageCount}" />

      <c:set var="UriBase" value="?boardId=${boardId}" />
      <c:set var="UriBase" value="${UriBase}&searchKeywordTypeCode=${param.searchKeywordTypeCode}" />
      <c:set var="UriBase" value="${UriBase}&searchKeyword=${param.searchKeyword}" />

      <c:set var="pre" value="${page -1}" />
      <c:set var="next" value="${page +1}" />

      <div class="btn-group">
        <a class="btn" href="${UriBase}&page=1">[처음]</a>
        <c:if test="${page > 1}">
          <a class="btn" href="${UriBase}&page=${pre}">◀ 이전</a>
        </c:if>
        <c:if test="${page > pageMenuArmSize + 1}">
          <button class="btn btn-disabled">...</button>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
          <c:set var="aClassStr" value="${i == page ? 'btn btn-active' : '' }" />
          <a class="${aClassStr} btn" href="${UriBase}&page=${i}"> ${i} </a>
        </c:forEach>

        <c:if test="${page < totalPage - pageMenuArmSize}">
          <button class="btn btn-disabled">...</button>
        </c:if>
        <c:if test="${page < totalPage}">
          <a class="btn" href="${UriBase}&page=${next}">다음 ▶</a>
        </c:if>
        <a class="btn" href="${UriBase}&page=${pageCount}">[마지막]</a>
      </div>
    </div>
    
    <div class="page-menu flex md:hidden justify-center mt-5">
      <c:set var="pageMenuArmSize" value="2" />
      <c:set var="startPage" value="${page - pageMenuArmSize >= 1 ? page - pageMenuArmSize : 1}" />
      <c:set var="endPage" value="${page + pageMenuArmSize <= pageCount ? page + pageMenuArmSize : pageCount}" />

      <c:set var="UriBase" value="?boardId=${boardId}" />
      <c:set var="UriBase" value="${UriBase}&searchKeywordTypeCode=${param.searchKeywordTypeCode}" />
      <c:set var="UriBase" value="${UriBase}&searchKeyword=${param.searchKeyword}" />

      <c:set var="pre" value="${page -1}" />
      <c:set var="next" value="${page +1}" />

      <div class="btn-group">
        <a class="btn" href="${UriBase}&page=1">[처음]</a>
        <c:if test="${page > 1}">
          <a class="btn" href="${UriBase}&page=${pre}">◀ 이전</a>
        </c:if>
        <c:if test="${page > pageMenuArmSize + 1}">
          <button class="btn btn-disabled">...</button>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
          <c:set var="aClassStr" value="${i == page ? 'btn btn-active' : '' }" />
          <a class="${aClassStr} btn" href="${UriBase}&page=${i}"> ${i} </a>
        </c:forEach>

        <c:if test="${page < totalPage - pageMenuArmSize}">
          <button class="btn btn-disabled">...</button>
        </c:if>
        <c:if test="${page < totalPage}">
          <a class="btn" href="${UriBase}&page=${next}">다음 ▶</a>
        </c:if>
        <a class="btn" href="${UriBase}&page=${pageCount}">[마지막]</a>
      </div>
    </div>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>