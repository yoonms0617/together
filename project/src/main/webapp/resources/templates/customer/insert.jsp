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
.wBtn{
font-weight: 500;
    background: #477a7b;
    color: #fff;
    border: 1px solid #477a7b;
    height: 50px;
    line-height: 50px;
    padding: 0 10px;
    width: 100%;
    display: block;
    text-align: center;
    cursor: pointer;
}
.cBtn{
	background: #fff;
	color:#477a7b;
	display:block;
	border: 1px solid #477a7b;
	height: 50px;
	line-height:50px;
	padding: 0 10px;
	width: 100%;
	text-align:text-center;
	cursor:pointer;
}
body{
	display: block;
}
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>

 <div class="wrapper row3 rows">
  <main class="container clear">
   <table class="table">
    <tbody>
<tr>
<th scope="row">제목</th>
                    <td> <select id="subject" name="subject" fw-filter="isFill" fw-label="제목" fw-msg=""  >
<option value="[상품] 상품관련 문의 드립니다.">[상품] 상품관련 문의 드립니다.</option>
<option value="[배송] 배송관련 문의 드립니다.">[배송] 배송관련 문의 드립니다.</option>
<option value="[입금확인] 입금관련 문의 드립니다.">[입금확인] 입금관련 문의 드립니다.</option>
<option value="[주문취소] 주문취소 문의 드립니다. ">[주문취소] 주문취소 문의 드립니다. </option>
<option value="[환불] 환불 문의 드립니다. ">[환불] 환불 문의 드립니다. </option>
<option value="[기타] 기타 문의 드립니다. ">[기타] 기타 문의 드립니다. </option>
</select>  </td>
                </tr>

<tr>

</tr>
</tbody>
<tbody class="">
<div class="wrapper row3 rows">
  <main class="container clear">
    <table class="table">
      <tr>
        <th width=20%>작성자</th>
        <td width=80%><input type=text size="15" class="input-sm" v-model="name"></td>
      </tr>
      <tr>
        <th width=20%>제목</th>
        <td width=80%><input type=text size="55" class="input-sm" v-model="subject"></td>
      </tr>
      <tr>
        <th width=20%>내용</th>
        <td width=80%><textarea rows="10" cols="55" v-model="content"></textarea></td>
      </tr>
      <tr>
<th scope="row">첨부파일1</th>
                    <td><input name="attach_file[]" type="file"  /></td>
                </tr>
<tr>
<th scope="row">첨부파일2</th>
                    <td><input name="attach_file[]" type="file"  /></td>
                </tr>

</tbody>
<tbody>
<tr class="">
<th scope="row">비밀번호</th>
                    <td><input id="password" name="password" fw-filter="" fw-label="비밀번호" fw-msg="" value="" type="password"  /></td>
                </tr>
<tr class="">
<th scope="row">비밀글설정</th>
                    <td><input id="secure0" name="secure" fw-filter="isFill" fw-label="비밀글설정" fw-msg="" value="F" type="radio" checked="checked"  /><label for="secure0" >공개글</label>
<input id="secure1" name="secure" fw-filter="isFill" fw-label="비밀글설정" fw-msg="" value="T" type="radio"  /><label for="secure1" >비밀글</label></td>
                </tr>
<tr class="captcha ">
<th scope="row">자동등록방지<br/>보안문자</th>
                    <td>
                        <img src="/Exec/Front/Board/Captcha/?no=&type=Write"  id="captcha_Write" />  <img src="//img.echosting.cafe24.com/skin/base/common/btn_captcha_refresh.png" onclick="BOARD.refresh_captcha('Write','');" />                        <p class="gBlank5"><input id="captcha" name="captcha" fw-filter="isFill" fw-label="보안문자" fw-msg="" class="inputTypeText" placeholder="보안문자를 입력해 주세요." value="" type="text"  /> <span class="ec-base-help txtInfo">영문, 숫자 조합을 공백없이 입력하세요(대소문자구분)</span></p>
                    </td>
                </tr>
      <tr>
        <th width=20%>비밀번호</th>
        <td width=80%><input type=password size="10" class="input-sm" v-model="pwd"></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
         <input type=button value="글쓰기" class="wbtn" v-on:click="write()">
         <input type=button value="취소" class="cBtn" onclick="javascript:history.back()">
        </td>
      </tr>
    </table>
  </main>
</div>


   </table>
   </main>
  </div>
<script>
  new Vue({
	  el:'.rows',
  	  data:{
  		  name:'',
  		  subject:'',
  		  content:'',
  		  pwd:''
  	  },
  	  methods:{
  		  write:function(){
  			  let _this=this;
  			  axios.post('/customer/insert_vue.do',{
  				  data:{
  					  name:this.name,
  					  subject:this.subject,
  					  content:this.content,
  					  pwd:this.pwd
  				  }
  			  }).then(function(response){
  				  location.href="/customer/list"
  			  })
  		  },
  		 (function() {
             var d = "* 성함/연락처/주문번호/문의내용을 남겨주시면 더 빠른 처리가 가능합니다! <br>";
             try {
                 var o = {"key":"DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==","toolbarSticky":false,"theme":"ec-froala","attribution":false,"htmlRemoveTags":["script"],"htmlAllowedEmptyTags":["*"],"iframe":true,"iframeStyle":".fr-view{font-size: 12px;}","iframeStyleFiles":["\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css?vs=2303081187"],"heightMin":400,"language":"ko_KR","paragraphFormatSelection":true,"fontFamilySelection":true,"fontSize":["8","9","10","12","14","16","18","20","22","24","26","28","30"],"fontSizeSelection":true,"linkInsertButtons":["linkBack"],"quickInsertButtons":["ul","ol","hr"],"codeMirror":false,"entities":"&#60;&#62;","imageEditButtons":["imageAlign","imageRemove","|","imageLink","linkOpen","linkEdit","linkRemove","-","imageDisplay","imageStyle","imageAlt","imageSize"],"tableEditButtons":[],"tableInsertHelper":false,"imageDefaultMargin":0,"imageDefaultWidth":0,"imageUpload":false,"imageInsertButtons":["imageUpload"],"imageMaxSize":5242880,"filesManagerMaxSize":5242880,"toolbarButtons":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":5},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":5},"moreRich":{"buttons":["insertTable","insertLink","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsSM":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":4},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":2},"moreRich":{"buttons":["insertTable","insertLink","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsXS":{"moreText":{"buttons":["paragraphFormat","textColor","backgroundColor","bold","italic","underline","strikeThrough"],"buttonsVisible":1},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight"],"buttonsVisible":0},"moreRich":{"buttons":["insertLink"]},"moreMisc":{"buttons":["undo","redo","html"],"buttonsVisible":0,"align":"right"}},"htmlDoNotWrapTags":["script","style","meta","link"],"htmlAllowedStyleProps":[".*"],"htmlAllowedTags":[".*"],"htmlAllowedAttrs":[".*"],"fontFamily":{"Dotum,sans-serif":"Dotum","Gulim,sans-serif":"Gulim","Batang,sans-serif":"Batang","Gungsuh,sans-serif":"Gungsuh","Arial,Helvetica,sans-serif":"Arial","Tahoma,Geneva,sans-serif":"Tahoma","Verdana,Geneva,sans-serif":"Verdana","Fixedsys,sans-serif":"Fixedsys","'Times New Roman',Times,serif":"Times New Roman","helvetica,sans-serif":"Helvetica","sans-serif":"Sans-serif","palatino,sans-serif":"Palatino","'Comic Sans MS',sans-serif":"Comic Sans MS","sand,sans-serif":"Sand","'Courier New',sans-serif":"Courier New","courier,sans-serif":"Courier","monospace,sans-serif":"Monospace","Georgia,serif":"Georgia","SimSun,sans-serif":"SimSun","SimHei,sans-serif":"SimHei","'MS PGothic',sans-serif":"MS PGothic","'MS PMincho',sans-serif":"MS PMincho","'MS UI PGothic',sans-serif":"MS UI PGothic","Meiryo,sans-serif":"Meiryo"},"colorsText":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"colorsBackground":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"docId":"content"};
                 // IE tableEditbuttons 이슈
                 o["tableEditButtons"] = FroalaEditor.DEFAULTS.tableEditButtons.filter(function(tableEditButtonName) {
                     return tableEditButtonName.indexOf("Style") === -1;
                 });

                 o["events"] = {
                     "filesManager.beforeUpload": function(files) {
                         this.opts.filesManagerUploadURL = getConvertUrlBeforeUpload(this.opts.filesManagerUploadURL);
                     },
                     "image.beforeUpload": function(images) {
                         this.opts.imageUploadURL = getConvertUrlBeforeUpload(this.opts.imageUploadURL);
                     },

                     "image.inserted": function(oImage, response) {
                         var sInstanceId = "content";
                         // 파일업로더로 이미지가 넘어오는경우에는 itslog가 이미 생성된 이미지기때문에 처리하지않음.
                         if ((sInstanceId === "product_description" || sInstanceId === "product_description_mobile") && typeof response !== "undefined") {
                             oImage.attr("data-use_its", true);
                         }
                        
                         if (iCheckedImageListCount >= 0) {
                             iCheckedImageListCount++;
                             aInsertedImageList.push(oImage);
                             
                             if (aCheckedImageList.length === iCheckedImageListCount || aCheckedImageList.length === 0) {
                                 // 마지막 이미지
                                 for (var i = 0; i < aInsertedImageList.length; i++) {
                                     aInsertedImageList[i].after("<br>");
                                 }
                                 
                                 // 리셋
                                 iCheckedImageListCount = 0;
                                 aCheckedImageList = [];
                                 aInsertedImageList = [];
                             }
                         }
                     },
                     "image.error": function (error, response) {
                         if (typeof JSON != "undefined") {
                             r = JSON.parse(response);
                             alert(r["error"]);
                         }
                     },
                     "image.loaded": function($img) {
                         // IE에서 이미지 로드 후, 커서 위치 재조정
                         if (/(trident).+rv[:\s]([\w\.]{1,9}).+like\sgecko/i.test(navigator.userAgent)) {
                             var _this = this;
                             var _img = $img[0];
                             setTimeout(function() {
                               _this.selection.setAfter(_img);
                               _this.selection.restore();
                             }, 300);
                         }
                     },
                     "filesManager.error": function (error, response) {
                         if (typeof JSON != "undefined") {
                             r = JSON.parse(response);
                             alert(r["error"]);
                         }
                     },
                     "commands.before": function(sCommand) {
                         // 코드뷰 토글시
                         if (sCommand === "html") {
                             var sContent = this.el.innerHTML;
                             sContent = sContent.replace(/<\/?null>/gi, "");
                             this.el.innerHTML = getReplaceZeroWidthSpace(sContent);
                             replaceToFroalaNewLine(this);
                         }
                         
                         // 전체화면 모드 켜기
                         if (sCommand === "fullscreen" && !this.fullscreen.isActive()) {
                             this.$box[0].setAttribute("data-window-scroll-y", window.scrollY || window.pageYOffset);
                         }
                         // 다중 이미지 삽입
                         if (sCommand === "insertAll") {
                             var popup = this.popups.get("filesManager.insert");
                             aCheckedImageList = popup.find(".fr-files-checkbox .fr-file-insert-check:checked")
                         }

                         if (sCommand === "insertSpecialCharacter") {
                             setScrollPosition(this, getIframeCursorPoint(this));
                         }
                     },
                     "commands.after": function(sCommand) {
                         if (sCommand === "html") {
                             removeFroalaNewLine(this);
                         }
                         
                         if (sCommand === "insertFiles") {
                             var enableButton= document.querySelector(".fr-trim-button.fr-plugins-enable");
                             if (enableButton) enableButton.click();
                         }
                         
                         if (sCommand === "selectAll") {
                             this.el.focus();
                         }
                         
                         // 전체 화면 토글시에 컨텐츠 높이를 정상적으로 반영하지못하는 이슈 대응
                         if (sCommand === "fullscreen") {
                             var _this = this;
                             setTimeout(function() {
                                 _this.size.syncIframe();
                             }, 300);
                             
                             if (this.fullscreen.isActive() === false) {
                                 window.scrollTo(0, this.$box[0].getAttribute("data-window-scroll-y"));
                             }
                         }
                         
                         if (sCommand === "insertSpecialCharacter") {
                             this.$wp.get(0).scrollTop = fScrollPosition;
                         }
                     },
                     "focus": function() {
                         if (this.iframe_document) {
                             var iframeHeight = this.iframe_document.body.scrollHeight;
                             this.$iframe[0].style.height = iframeHeight + "px";
                         }
                         
                         this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
                     },

                     "image.beforeRemove": function(aImage) {
                         isBeforeImageRemove = true;
                         var cursorPoint = aImage[0].offsetTop; // 제거 대상 이미지의 offsetTop 값으로 정의
                         setScrollPosition(this, cursorPoint);
                     },
                     "image.removed": function() {
                         if (isBeforeImageRemove === true) {
                             this.$wp.get(0).scrollTop = fScrollPosition; // 에디터 자체 버그동작이 수행 된 후 계산 해 둔 값으로 스크롤 위치를 이동
                         }
                         isBeforeImageRemove = false;
                     },
                     "keydown": function(e) {
                         if (isScrollFix(this, e) === true) {
                             setScrollPosition(this, getIframeCursorPoint(this));
                         }
                     },
                     "keyup": function(e) {
                         if (isScrollFix(this, e) === true) {
                             this.$wp.get(0).scrollTop = fScrollPosition;
                         }
                     },
                     "paste.before": function() {
                         if (this.fullscreen.isActive() === false) {
                             setScrollPosition(this, getIframeCursorPoint(this));
                         } 
                     },
                     "paste.after": function(e) {
                         if (this.fullscreen.isActive() === false) {
                             this.$wp.get(0).scrollTop = fScrollPosition;
                         } 
                     },
                     "codeView.update": function() {
                         this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
                         this.el.innerHTML = decodeUriAttribute(this.el.innerHTML);
                     }
                 };
  	  }
  })
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>