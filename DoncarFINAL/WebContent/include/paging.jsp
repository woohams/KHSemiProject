<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<style type="text/css">
.pagination{float:left; position:relative;  left:40%; margin-top: 10%;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

var command = "<%=request.getParameter("command")%>";
var nowPage = "<%=request.getParameter("page")%>";
var countPage = 5;
var countDto = 10;
var totalPage;
var totalDto = ${ fn:length(list)};
var startDto;
var endDto;
var startPage;
var endPage;

   $(function(){


      if(nowPage=='null' || nowPage==""){
         nowPage=1;
      }
      totalPage = Math.ceil(totalDto/countDto);
      setPage();
      })
      
      function setPage(){
      var dtos = $(".dto").get();
      var page = $("#page");
      
      if(nowPage!=1){
         startDto = (nowPage-1)*countDto;
         endDto = nowPage*countDto;
      }else{
         startDto = 0;
         endDto = countDto;
      }
      
      if(endDto > totalDto){
         endDto = totalDto;
      }
      

      
      pageArr = new Array();
      
      startPage = (Math.floor((nowPage-1)/countPage)*countPage)+1;
      endPage = startPage + countPage - 1;
      if(endPage>totalPage){
         endPage = totalPage;
      }
      
      
      if(Math.floor((nowPage-1)/countPage)*countPage>0){
         pageArr[0] = "true";
      }else {
         pageArr[0] = "false";
      }
      var cnt = 1;
      for(var i = startPage; i<=endPage; i++){
         pageArr[cnt] = i;
         cnt++;
      }
      if(endPage == totalPage){
         pageArr[pageArr.length] = "false";
      }else{
         pageArr[pageArr.length] = "true";
      }
      
      $(".dto").css("display","none");
      

      for(var i= startDto; i<endDto; i++){
         dtos[i].setAttribute("style","display:");
         }
      
      for(var i=0; i<pageArr.length; i++){
         if(i==0){
            if(pageArr[i]=="true"){
                  page.append("<ul class='pagination '> <li class='page-item '><a class='page-link' href='doncar.do?command="+command+"&page="+(startPage-1)+"'><</a></li></ul>");
            }else{
               }
            }
         else if(i==pageArr.length-1){
            if(pageArr[i]=="true"){
            	page.append("<ul class='pagination '><li class='page-item '><a class='page-link' href='doncar.do?command="+command+"&page="+(endPage+1)+"'>></a></li></ul>");
            }
            else{
            }            
         }else{
            if(pageArr[i]==nowPage){
               page.append("<ul class='pagination '><li class='page-item active'><a class='page-link' href='#'>"+pageArr[i]+"</a></li></ul>");
            }else{
               page.append("<ul class='pagination '><li class='page-item '><a class='page-link' href='doncar.do?command="+command+"&page="+pageArr[i]+"'>"+pageArr[i]+"</a></li></ul>");
            }
         }
      }
   }
      
   
</script>