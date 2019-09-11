<%@page import="com.doncar.biz.CommentBiz"%>
<%@page import="com.doncar.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
	<%
		String command = request.getParameter("command");
		List<CommentDto> list = null;
		CommentDto dto = new CommentDto();
		CommentBiz biz = new CommentBiz();
		if (command.contains("rent")) {
			int rent_board_no = Integer.parseInt(request.getParameter("rent_board_no"));
			dto.setRent_board_no(rent_board_no);
			List<CommentDto> commentlist = biz.selectlist(dto);
			request.setAttribute("commentlist", commentlist);
			list = biz.selectlist(dto);
			System.out.println(rent_board_no);
			pageContext.setAttribute("no", rent_board_no);
		} else if (command.contains("car")) {
			int car_board_no = Integer.parseInt(request.getParameter("car_board_no"));
			dto.setCar_board_no(car_board_no);
			list = biz.selectlist(dto);
			pageContext.setAttribute("no", car_board_no);
		} else if (command.contains("free")) {
			int free_board_no = Integer.parseInt(request.getParameter("free_board_no"));
			dto.setFree_board_no(free_board_no);
			list = biz.selectlist(dto);
			pageContext.setAttribute("no", free_board_no);

		}
		pageContext.setAttribute("list", list);
	%>

	<div>
		<table border="1" class="table table-striped table-hover">
			<col width="10">
			<col width="500">
			<thead>
			<c:choose>
				<c:when test="${empty MemberDto }">
					<tr>
						<td colspan="2" style="text-align: center;">----------로그인을 해야 댓글을작성하실수있습니다----------</td>
					</tr>
				</c:when>
				<c:otherwise>
			
					<tr>
						<td id="member_nickname" style="width:100px; vertical-align:middle;">${MemberDto.member_nickname }</td>
						<td colspan="2">
							<textarea name="comment_content" rows="3" cols="100"></textarea>
							<button class="btn btn-info" name="insert" style="margin-bottom: 4%;" onclick="comment(this);">댓글작성</button>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</thead>
		</table>


		<table border="1" class="table table-striped table-hover" >
		<thead>
			<tr>
				<th>작성자</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody id="repleList">
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td id='check' colspan="3" style="text-align: center;">------------------등록된 댓글이 없습니다 -------------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="row">
						<tr title="n">
							<td><input type="hidden" class="comment_no"
								value="${row.comment_no }"> ${row.comment_nickname }</td>
							<td title="n"><span class='tab'>${row.comment_titletab }</span>
								<span id="content">${row.comment_content }</span>
								<c:choose>
									<c:when test="${empty MemberDto }"></c:when>
									<c:otherwise>			
										<button class="btn btn-info" id="repleform" name="insert" onclick="reply(this);">답글달기</button>
									</c:otherwise>
								</c:choose>
								<c:if test="${!empty MemberDto }">
									<c:if test="${ MemberDto.member_nickname eq row.comment_nickname }">
											<button class="btn btn-info" name="delete" onclick="comment_del(this);">댓글삭제</button>
											<button class="btn btn-info" name="update" onclick="updateform(this);">수정하기</button>
									</c:if>
								</c:if>
							</td>
							<td>${row.comment_regdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		</table>
	</div>
<script type="text/javascript">
	function reply(door) {
		var nickname = $("#member_nickname").html()
		var tr = $(door).parent().parent();
		var commentno = tr.children( "td:first-child" ).children(".comment_no").val();
		if (tr.attr('title') == 'n') {
			$(door).html("답글취소");
			tr.after($(
			"<tr><td><input type='hidden' class='comment_no' value="+commentno+">"+nickname+"</td>"+
			"<td colspan='2'><textarea name='comment_content' rows='2' cols='60'></textarea><button name='reply' class='btn btn-info' onclick='comment(this);'>글작성</button></td></tr>"))
			tr.attr('title', 'y');
		} else {
			$(door).html("답글달기")
			tr.next().remove();
			tr.attr('title', 'n');
		}
	}
	var tempStr = "";
	function updateform(self){
		
		var content = $(self).parent().children("#content"); 
		var td = $(self).parent();
		var str = content.html();
		var button = td.children('button[name="update"]');
		var buttons = td.children('button');
		if(td.attr('title') == 'n'){
			content.after($("<textarea id='content' row='2' cols='60'>"+str+"</textarea>"))
			tempStr = str;
			content.remove();
			buttons.toggle();
			button.html('수정취소');
			button.toggle();
			button.after($("<button name='updateres' class='btn btn-info' onclick='updateres(this);'>수정완료</button>"));
			td.attr('title','y');
		}else {
			content.after($("<span id='content'>"+tempStr+"</span>"));
			content.remove();
			button.html('수정하기');
			button.next().remove();
			buttons.toggle();
			button.toggle();
			td.attr('title','n');
		}
	}
	
	function updateres(self){
		var command = "command=comment_"+$(self).attr('name');
		var textarea = $(self).parent().children("textarea").val();
		var content = "&comment_content="+textarea;
		var commentno = "&comment_no="+$(self).parent().parent().children("td:first-child").children(".comment_no").val();
		

		
		$.ajax({
			url : "doncar.do",
			data : command+commentno+content,
			dataType : "json",
			success : function(obj){
				var tab = "";
				for(var i = 0; i<obj.titletab; i++){
					tab += "└";
				}
				var tr = $(self).parent().parent();
				tr.after($(
						'<tr title="n">'
						+'<td><input type="hidden" class="comment_no" value="'+obj.no+'">'+obj.nickname+'</td>'
							+'<td title="n"><span class="tab">'+tab+'</span>'
							+'<span id="content">'+obj.content+'</span>'
							+'<button name="insert" class="btn btn-info" onclick="reply(this);">답글달기</button>'
							+'<button name="delete" class="btn btn-info" onclick="comment_del(this);">댓글삭제</button>'
							+'<button name="update" class="btn btn-info" onclick="updateform(this);">수정하기</button>'
						+'</td>'
						+'<td>'+obj.regdate+'</td>'
					+'</tr>'
				))
				
				tr.remove();
			},error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
	function getParam(self){
		var command = "command=comment_"+$(self).attr('name');
		var type ='${param.command}';
		type = type.split('_');
		var no = "&no="+${no}; //게시글번호
		type = "&type="+type[0];
		var nickname = "&comment_nickname="+$("#member_nickname").html();
		var textarea = $(self).parent().children("textarea").val();
		var content = "&comment_content="+textarea;
		var commentno = $(self).parent().parent().children("td:first-child").children(".comment_no").val();
		if(commentno == '' || commentno == null || typeof commentno =='undefined'){
			commentno = "";
		}else{
			commentno = "&comment_no="+commentno;
		}
		var res = command+type+no+nickname+content+commentno;
		return res;
		
	}
	
	function comment_del(self){
		var command = "command=comment_"+$(self).attr('name');
		var commentno = "&comment_no="+$(self).parent().parent().children("td:first-child").children(".comment_no").val();
		
		$.ajax({
			url : "doncar.do",
			data : command+commentno,
			dataType : "text",
			success : function(msg){
				var arr = new Array();
				var tr = $(self).parent().parent();
				arr[0] = tr;
				for(var i=1; i<msg; i++){
					arr[i] = arr[i-1].next();
				}
				
				$(arr).each(function(){
					this.remove();
				})
			},error : function(request,status,error){
		        alert("실패!");
			}
		})
	}
	function comment(self){


		$.ajax({
			url:"doncar.do",
			data : getParam(self),
			dataType : "json",
			success : function(obj){
				var tab = "";
				for(var i = 0; i<obj.titletab; i++){
					tab += "└";
				}
				if(obj.titletab>0){
					var tr = $(self).parent().parent();
					var button = $("#repleform");
					tr.after($(
							'<tr title="n">'
						+'<td><input type="hidden" class="comment_no" value="'+obj.no+'">'+obj.nickname+'</td>'
							+'<td title="n"><span class="tab">'+tab+'</span>'
							+'<span id="content">'+obj.content+'</span>'
							+'<button name="insert" class="btn btn-info" onclick="reply(this);">답글달기</button>'
							+'<button name="delete" class="btn btn-info" onclick="comment_del(this);">댓글삭제</button>'
							+'<button name="update" class="btn btn-info" onclick="updateform(this);">수정하기</button>'
						+'</td>'
						+'<td>'+obj.regdate+'</td>'
					+'</tr>'));
					tr.remove();
					button.html('답글달기');
					button.parent().attr('title','n');
					
				}else{
				$(self).parent().children('textarea').val("");
				var check = $("#check").html();
				if(check != '' || check != null || typeof check !='undefined'){
					$("#check").remove();
				}
				$("#repleList").prepend($(
						'<tr title="n">'
						+'<td><input type="hidden" class="comment_no" value="'+obj.no+'">'+obj.nickname+'</td>'
							+'<td title="n"><span class="tab">'+tab+'</span>'
							+'<span id="content">'+obj.content+'</span>'
							+'<button name="insert" class="btn btn-info" onclick="reply(this);">답글달기</button>'
							+'<button name="delete" class="btn btn-info" onclick="comment_del(this);">댓글삭제</button>'
							+'<button name="update" class="btn btn-info" onclick="updateform(this);">수정하기</button>'
						+'</td>'
						+'<td>'+obj.regdate+'</td>'
					+'</tr>'		
				));
				}
			},error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
	
	$(function(){
		$('.tab').each(function(index){
			var cnt = $(this).html();
			var str = "";
			if(cnt == 0){
				$(this).html("");
			}else{
				for(var i=0; i<cnt; i++){
					str += "└";
				}
				$(this).html(str);
			}
		})
	})
</script>

</html>