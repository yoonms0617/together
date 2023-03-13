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
    <style>
        .subtitle {
            padding-left: 10px;
            font-size: 15px;
            color: #a9a9a9;
        }
    </style>
</head>
<body>
<jsp:include page="../fragments/header.jsp"/>
<div class="wrapper row3 rows">
    <main class="container clear">
        <div class="row">
            <table class="table">
                <tr>
                    <td v-for="img in place_detail.image">
                        <img :src="img" style="width: 100%">
                    </td>
                </tr>
            </table>
        </div>
        <div style="height: 20px"></div>
        <div class="two_third first">
            <table class="table">
                <tr>
                    <td colspan="2">
                        <h3><span id="name">{{place_detail.name}}</span>&nbsp;<span class="subtitle">{{place_detail.subtitle}}</span></h3>
                    </td>
                </tr>
                <tr>
                    <th width=20%>주소</th>
                    <td width=80%>
                        {{place_detail.address}}<br>
                    </td>
                </tr>
                <tr>
                    <th width=20%>전화</th>
                    <td width=80%>{{place_detail.tel}}</td>
                </tr>
                <tr>
                    <th width=20%>음식종류</th>
                    <td width=80%>{{place_detail.homepage}}</td>
                </tr>
                <tr>
                    <th width=20%>영업시간</th>
                    <td width=80%>{{place_detail.openhour}}</td>
                </tr>
                <tr>
                    <td colspan="2" class="text-right">
                        <a href="javascript:history.back()" class="btn btn-xs btn-danger">목록</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="one_third">
            <div id="map" style="width:100%;height:350px;"></div>
        </div>
    </main>
</div>
<script>
    new Vue({
        el:'.rows',
        data:{
            pno:{pno},
            place_detail:{},
            count:0
        },
        mounted:function(){
            let _this=this
            axios.get("/place/place_detail_vue.do",{
                params:{
                    pno:_this.pno
                }
            }).then(function(response){
                console.log(response.data)
                _this.place_detail=response.data

                if(window.kakao && window.kakao.maps)
                {
                    _this.initMap();
                }
                else
                {
                    _this.addScript();
                }
            })
        },
        methods:{
            addScript:function(){
                const script=document.createElement("script")
                /* global kakao */
                script.onload = () => kakao.maps.load(this.initMap)
                script.src='http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=b18319530b6d6d62d5c86a8807893413&libraries=services'
                document.head.appendChild(script)
            },
            initMap:function(){
                //let name=this.food_detail.name;
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

                // 지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다
                geocoder.addressSearch(this.place_detail.address, function(result, status) {

                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다

                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#name').text()+'</div>'
                        });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    }
                });
            }
        }
    })
</script>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>