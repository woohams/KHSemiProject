<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
				<form action="doncar.do" method="post">
				<input type="hidden" name="command" value="${param.command }">
				<select name="searchtype">
					<option value="title" <c:if test="${param.searchtype eq 'title' }">selected="selected"</c:if>>제목</option>
					<option value="content" <c:if test="${param.searchtype eq 'content' }">selected="selected"</c:if>>내용</option>
					<option value="writer" <c:if test="${param.searchtype eq 'writer' }">selected="selected"</c:if>>작성자</option>
					<option value="titleAcontent" <c:if test="${param.searchtype eq 'titleAcontent' }">selected="selected"</c:if>>제목+내용</option>
				</select>
				<input type="text" name="searchinput" value="${param.searchinput }">
				<input type="submit" class="btn btn-info" value="검색하기">
				</form>
				
				