<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <form action="doncar.do" method="post">
    	<input type="hidden" name="command" value="${param.command }"/>
    	<select name="membersearch">
    		<option value="id" <c:if test="${param.membersearch eq 'id' }">selected="selected"</c:if>>아이디</option>
    		<option value="nickname" <c:if test="${param.membersearch eq 'nickname' }">selected="selected"</c:if>>닉네임</option>
    		<option value="name" <c:if test="${param.membersearch eq 'name' }">selected="selected"</c:if>>이름</option>
    	</select>
    	<input type="text" name="memberinput" value="${param.memberinput }">
    	<input type="submit" class="btn btn-default" value="검색하기"/>
    </form>
    
