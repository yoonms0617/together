<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="../fragments/head.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<style>
    .form-select {
        margin: 10px;
        border: 1px solid #ddd;
        border-radius: 60px;
        padding: 10px 28px;
        width: 140px;
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

    .s21_SearchInput {
        margin: 10px;
        border: 1px solid #ddd;
        border-radius: 60px;
        padding: 10px 28px;
    }

    .s21_tour_search_button {
        padding: 10px 17px;
        color: #477A7B;
        margin: 10px;
        background-color: #dfe9e8;
        border: 1px solid #ddd;
        border-radius: 60px;
        font-size: 13px;
        max-width: 100%;
        min-height: 40px;
        background-size: 20px auto;
        background-position: right 10px center;
        background-repeat: no-repeat;
    }

    .search_keyword {
        display: inline-block;
        padding: 0 13px;
        margin: 2px 2px;
        font-size: 13px;
        text-align: center;
        background: #f3f3f3;
        height: 35px;
        line-height: 35px;
        border-radius: 20px;
        color: #477A7B;
        text-decoration: none;
    }

    .search_keyword:hover {
        background: #477A7B;
        color: #fff;
        text-decoration: none;
    }

    /* 슬라이드 이미지를 감싸는 div의 스타일 */
    #slideshow {
        position: relative;
        width: 100%;
        height: 400px;
        margin: auto;
    }

    /* 각 이미지의 스타일 */
    #slideshow img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    /* 이전/다음 버튼의 스타일 */
    .prev, .next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        font-size: 30px;
        font-weight: bold;
        padding: 10px;
        cursor: pointer;
    }

    /* 이전 버튼의 위치 */
    .prev {
        left: 0;
    }

    /* 다음 버튼의 위치 */
    .next {
        right: 0;
    }
</style>
<script>
    // 이미지 슬라이드 기능을 구현하는 JavaScript 코드
    var slideIndex = 1;
    showSlides(slideIndex);

    // 이전/다음 버튼 클릭시 호출되는 함수
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    // 현재 이미지를 보여주는 함수
    function showSlides(n) {
        var i;
        var slides = document.getElementsByTagName("img");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex - 1].style.display = "block";
    }

    // 3초마다 자동으로 슬라이드하는 함수
    setInterval(function () {
        plusSlides(1);
    }, 3000);
</script>
<body>
<jsp:include page="../fragments/header.jsp"/>
<!-- 슬라이드 이미지를 감싸는 div -->
<div id="slideshow">
    <!-- 이미지 목록 -->
    <img src="/image/place_image/dog2.jpeg">
    <img src="/image/place_image/dog2.jpeg">
    <img src="/image/place_image/dog3.jpeg">
    <img src="/image/place_image/dog4.jpeg">
    <img src="/image/place_image/dog5.jpeg">
</div>

<!-- 이전/다음 버튼 -->
<div class="prev" onclick="plusSlides(-1)">&#10094;</div>
<div class="next" onclick="plusSlides(1)">&#10095;</div>

<div class="s21_sm_search">
    <div class="d-flex justify-content-center">
        <div class="d-flex justify-content-center">
            <select v-model="selectedRegion" @change="onChangeRegion" class="form-select" aria-label="Default select example">
                <option value="">전국</option>
                <option v-for="(region, index) in regions" :key="index" :value="region">{{region}}</option>
            </select>
            <select v-model="selectedCity" class="form-select" aria-label="Default select example">
                <option value="">시군선택</option>
                <option v-for="(city, index) in cities" :key="index" :value="city">{{city}}</option>
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
            <button type="button" class="s21_tour_search_button">검색하기</button>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <strong style="margin: 5px;">추천검색어</strong>
    </div>
    <div class="d-flex justify-content-center">
        <p>
            <a href="/product/search.html?keyword=UFO 넥카라" class="search_keyword">UFO 넥카라</a>
            <a href="/product/search.html?keyword=꿀잠방석" class="search_keyword">꿀잠방석</a>
            <a href="/product/search.html?keyword=논슬립 슬라이드 계단" class="search_keyword">논슬립 슬라이드 계단</a>
        </p>
    </div>
</div>
<div class="d-flex justify-content-end">
    <a href="" class="search_keyword">최신순</a> <!-- 최신등록순 -->
    <a href="" class="search_keyword">인기순</a> <!-- 찜 카운트순 -->
    <a href="" class="search_keyword">조회순</a> <!-- Hit 기준 -->
</div>
<div id="app">
    <div class="container">
        <div class="row">
            <div v-for="place in placeList" class="col-md-3">
                <div class="thumbnail">
                    <a :href="'../place/place_detail.do?pno=' + place.pno">
                        <img :src="place.image" style="width:100%">
                        <div class="caption">
                            <p>{{ place.title }}</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    new Vue({
        el: '.row',
        pno: '',
        data: {
            placeList: []
        },
        mounted: function () {
            let _this=this;
            axios.get("/place/place_list_vue.do").then(function(response){
                console.log(response.data)
                _this.placeList = response.data;
            })
        }
    })
</script>
<jsp:include page="../fragments/footer.jsp"/>


<%--<script>
    export default {
        data() {
            return {
                selectedRegion: '',
                selectedCity: '',
                regions: [
                    '경기', '서울', '인천', '강원', '충남', '세종', '대전', '충북',
                    '경북', '대구', '전북', '전남', '광주', '경남', '부산', '울산', '제주'
                ],
                cities: {
                    '경기': [
                        '수원', '성남', '의정부', '안양', '부천', '광명', '평택', '동두천', '안산',
                        '고양', '과천', '구리', '남양주', '오산', '시흥', '군포', '의왕', '하남', '용인',
                        '파주', '이천', '안성', '김포', '화성', '광주', '양주', '포천', '여주', '연천',
                        '가평', '양평'
                    ],
                    '서울': [
                        '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구',
                        '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구',
                        '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구',
                        '중랑구'
                    ],
                    '인천': [
                        '계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진구',
                        '중구'
                    ],
                    '강원': [
                        '춘천', '원주', '강릉', '동해', '태백', '속초', '삼척', '홍천', '횡성', '영월',
                        '평창', '정선'
                    ],
                    '충남': [
                        '천안', '공주', '보령', '아산', '서산', '논산', '계룡', '당진', '금산', '부여',
                        '서천', '연기', '예산', '청양', '태안', '홍성'
                    ],
                    '세종': [
                        '세종'
                    ],
                    '대전': [
                        '동구', '중구', '서구', '유성구', '대덕구'
                    ],
                    '충북': [
                        '청주', '충주', '제천', '보은', '옥천', '영동', '진천', '괴산', '음성', '단양'
                    ],
                    '경북': [
                        '포항', '경산', '경주', '구미', '김천', '문경', '상주', '안동', '영주', '영천',
                        '칠곡', '예천', '울진', '의성', '청도', '청송', '칠곡'
                    ],
                    '대구': [
                        '중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군'
                    ],
                    '전북': [
                        '전주', '군산', '익산', '정읍', '김제', '남원', '고창', '부안'
                    ],
                    '전남': [
                        '목포', '여수', '순천', '나주', '광양', '담양', '곡성', '구례', '고흥', '보성',
                        '화순', '장흥', '강진', '해남', '영암', '무안', '함평', '영광', '장성', '완도',
                        '진도', '신안'
                    ],
                    '광주': [
                        '동구', '서구', '남구', '북구', '광산구'
                    ],
                    '경남': [
                        '창원', '김해', '진주', '양산', '거제', '통영', '사천', '밀양', '함안', '거창',
                        '창녕', '고성', '남해', '하동', '산청', '함양', '합천'
                    ],
                    '부산': [
                        '중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구', '북구', '강서구',
                        '해운대구', '사하구', '금정구', '연제구', '수영구', '사상구', '기장군'
                    ],
                    '울산': [
                        '중구', '남구', '동구', '북구', '울주군'
                    ]
                },
            };
        },
        methods: {
            onChangeRegion() {
                this.selectedCity = ""; // 선택된 도시 초기화
                // 선택된 지역에 해당하는 도시 리스트로 업데이트
                this.citiesForSelectedRegion = this.cities[this.selectedRegion] || [];
            },
        },
    };
</script>--%>
</body>
</html>