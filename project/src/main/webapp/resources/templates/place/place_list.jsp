<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<style>
    .form-select {
        margin: 10px;
        border: 1px solid #ddd;
        border-radius: 60px;
        padding: 12px 28px;
    }

    .s21_sm_search {
        top: -80px;
        width: 100%;
        background: #fff;
        border: 1px solid #f3ebe1;
        border-radius: 40px;
        height: 150px;
        box-shadow: 5px 5px 48px rgb(207 207 207 / 60%);
        -webkit-box-shadow: 5px 5px 48px rgb(207 207 207 / 60%);
        -moz-box-shadow: 5px 5px 48px rgba(207, 207, 207, 0.6);
    }
</style>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div id="app">
    <div class="s21_sm_search">
        <div class="d-flex justify-content-center">
            <div class="row">
                <div class="d-flex justify-content-center">
                    <select class="form-select" aria-label="Default select example" v-model="selectedRegion" @change="onRegionChange">
                        <option selected>전국</option>
                        <option value="경기">경기</option>
                        <option value="서울">서울</option>
                        <option value="인천">인천</option>
                        <option value="강원">강원</option>
                        <option value="충남">충남</option>
                        <option value="세종">세종</option>
                        <option value="대전">대전</option>
                        <option value="충북">충북</option>
                        <option value="경북">경북</option>
                        <option value="대구">대구</option>
                        <option value="전북">전북</option>
                        <option value="전남">전남</option>
                        <option value="광주">광주</option>
                        <option value="경남">경남</option>
                        <option value="부산">부산</option>
                        <option value="울산">울산</option>
                        <option value="울산">제주</option>
                    </select>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>시군선택</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                    <select class="form-select" aria-label="Default select example" v-if="selectedRegion === '경기'" v-model="selectedCity">
                        <option value="0">시군선택</option>
                        <option value="수원">수원</option>
                        <option value="성남">성남</option>
                        <option value="의정부">의정부</option>
                        <option value="안양">안양</option>
                        <option value="부천">부천</option>
                        <option value="광명">광명</option>
                        <option value="평택">평택</option>
                        <option value="동두천">동두천</option>
                        <option value="안산">안산</option>
                        <option value="고양">고양</option>
                        <option value="과천">과천</option>
                        <option value="구리">구리</option>
                        <option value="남양주">남양주</option>
                        <option value="오산">오산</option>
                        <option value="시흥">시흥</option>
                        <option value="군포">군포</option>
                        <option value="의왕">의왕</option>
                        <option value="하남">하남</option>
                        <option value="용인">용인</option>
                        <option value="파주">파주</option>
                        <option value="이천">이천</option>
                        <option value="안성">안성</option>
                        <option value="김포">김포</option>
                        <option value="화성">화성</option>
                        <option value="광주">광주</option>
                        <option value="양주">양주</option>
                        <option value="포천">포천</option>
                        <option value="여주">여주</option>
                        <option value="연천">연천</option>
                        <option value="가평">가평</option>
                        <option value="양평">양평</option>
                    </select>
                    <select class="form-select" aria-label="Default select example">
                        <option value="0">여행지선택</option>
                        <option value="T">관광지</option>
                        <option value="F">음식점</option>
                        <option value="H">숙소</option>
                        <option value="C">캠핑</option>
                        <option value="S">쇼핑</option>
                        <option value="A">호텔링</option>
                    </select>
                    <input type="text" class="s21_SearchInput" name="sch_text" id="sch_text" placeholder="여행지명을 입력하세요" title="">
                </div>
                <hr>
                <%--<div v-for="place in placeList" :key="place.pno" class="col-md-3">
                    <div class="thumbnail">
                        <a :href="'../place/place_detail.do?pno=' + place.pno">
                            <img :src="place.image" style="width:100%">
                            <div class="caption">
                                <p>{{ place.title }}</p>
                            </div>
                        </a>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</div>]
<script>
    new Vue({
        el: '#app',
        data: {
            selectedRegion: '',
            selectedCity: ''
        },
        methods: {
            onRegionChange() {
                this.selectedCity = '';
            }
        }
    });
</script>

<%--<script>
    new Vue({
        el: '#app',
        data: {
            placeList: {},
            pno: {pno}
        },
        mounted() {
            let _this = this;
            axios.get("http://localhost/web/place/place_list.do", {
                params: {
                    pno: _this.pno
                }
            }).then(response => {
                console.log(response.data);
                _this.placeList = response.data; // placeList 변수를 response.data로 초기화합니다.
            }).catch(error => {
                console.log(error);
            });
        }
    });
</script>--%>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>