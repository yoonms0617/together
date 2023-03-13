<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../fragments/head.jsp"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
    <!-- Add this after vue.js -->
    <script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
    <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.container{
	margin-top:50px;
}
.row{
	margin:0px auto;
	width: 900px;
}
h1{
	text-align: center;
}
.plusBtn{

}
</style>
</head>

<body>
<jsp:include page="../fragments/header.jsp"/>

 <div class="wrapper row3 rows">
  <main class="container clear">
   <table class="table">
     <tr>
      <td>
       <a href="/customer/insert" class="plusBtn">+</a>
      </td>
     </tr>
   </table>
   <table class="table">
     <thead>
       <tr>
         <th width=10% class="text-center">번호</th>
         <th width=45% class="text-center">제목</th>
         <th width=15% class="text-center">이름</th>
         <th width=20% class="text-center">작성일</th>
         <th width=10% class="text-center">조회수</th>
       </tr>
     </thead>
     <tbody>
       <tr v-for="vo in cs_list">
         <td width=10% class="text-center">{{vo.nno}}</td>
         <td width=45%><a :href="'/customer/detail?nno='+vo.nno">{{vo.subject}}</a></td>
         <td width=15% class="text-center">{{vo.name}}</td>
         <td width=20% class="text-center">{{vo.dbday}}</td>
         <td width=10% class="text-center">{{vo.hit}}</td>
       </tr>
       <tr>
         <td colspan="5" class="text-rigth">
           <input type=button value="이전" class="btn btn-sm btn-danger" v-on:click="prev()">
             {{curpage}} page / {{totalpage}} pages
           <input type=button value="다음" class="btn btn-sm btn-warning" v-on:click="next()">
         </td>
       </tr>
     </tbody>
   </table>
   </main>
  </div>
<script>
  new Vue({
	 el:'.rows',
	 data:{
		 cs_list:[],
		 curpage:1,
		 totalpage:0
	 },
	 mounted:function(){
		 this.send()
		 
	 },
	 methods:{
		 send:function(){
			 let _this=this
			 axios.get("/customer/list_vue.do",{
				 params:{
					 page:this.curpage
				 }
			 }).then(function(response){
				 console.log(response.data)
				 _this.customer_list=response.data
				 _this.curpage=response.data[0].curpage
				 _this.totalpage=response.data[0].totalpage
			 }) 	
		 },
		 prev:function(){
			  this.curpage=this.curpage>1?this.curpage-1:this.curpage
			  this.send()
		  },
		  next:function(){
			  this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
			  this.send()
		  }
		 
	 }
  })
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>