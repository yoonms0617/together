<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>

<body>
<jsp:include page="../fragments/header.jsp"/>
<div>
 <div class="container">
  <div class="row">
   <table class="table" style="background-color: #57E9E1">
    <tr class="text-center"> 
     <td>
       <h1><b style="color:white">커뮤니티 혜택</b></h1>
       <p>투개더에서 우리 반려동물에 대한 이야기를 공유해보세요.</p>
     </td>
    </tr>
     <tr class="text-center">
      <td>
       <a href="../community/insert.do" class="btn btn-md" style="background-color:transparent;color:white;border-color: white">커뮤니티에 글쓰기</a>
      </td>
    </tr>
   </table>
  </div>
  <div class="community area">
  
  </div>
 </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>