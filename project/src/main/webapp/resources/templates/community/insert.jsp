<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.select_box{
  background-color: #dfe9e8;
  color: #477A7B;
  font-size: 15px;
}
.button1{
  color:#fff;
  background-color: #477a7b;
  border: 1px solid #477a7b;
}
.button2{
  color:#477a7b;
  background-color:#fff;
  border: 1px solid #477a7b;
}
</style>
</head>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div>
 <div class="wrapper row3 rows">
  <main class="container clear">
   <div class="write_select">
    <select class="select_box" name="bcode" style="width:100%;height:35px;border:none">
     <option value="review">여행후기</option>
     <option value="place">맛집추천</option>
     <option value="info">장소추천</option>
     <option value="share">유머나라</option>
     <option value="mydog">내반려견</option>
    </select>
   </div> 
   <table class="table">
    <tr>
     <th width=20%>제목</th>
     <td width=80%><input type=text wize="55" class="input-sm" v-model="title"></td>
    </tr>
    <tr>
     <th width=20%>내용</th>
     <td width=80%><textarea rows="10" cols="55" v-model="content"></textarea></td>
    </tr>
     <tr>
       <th width=15% class="file">첨부파일</th>
        <td width=85%>
          <input type=file name=upload size=20 class="input-sm">
        </td>
     </tr>
    <tr> 
     <td colspan="2" class="text-center"> 
      <input type=button value="글쓰기" class="button1" v-on:click="write()">
      <input type=button value="취소" class="button2" onclick="javascript:history.back()">
     </td>
    </tr> 
   </table>
  </main>
 </div>
</div>
<script>
   new Vue({
	   el:'.rows',
	   data:{
		   title:'',
		   content:'',
		   type:''
	   },
	   methods:{
		   write:function(){
			   let _this=this;
			   axios.get('http://localhost/web/community/insert_vue.do',{
				   params:{
					   title:this.title,
					   content:this.content,
					   type:this.type
				   }
			   }).then(function(response){
				   location.href="../communtiy/list.do"
			   })
		   }
	   }
   })
 </script>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>