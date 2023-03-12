<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row">
        <table class="table">
            <tr>
                
            </tr>
        </table>
    </div>
    <div style="height: 20px"></div>
    <div class="row">
        <div class="col-sm-8">
            <table class="table">
                <tr>
                    <td colspan="2">
                        <h3>${placeDetailData.title }&nbsp;</h3>
                        <h3>${placeDetailData.subtitle }&nbsp;</h3>
                    </td>
                </tr>
                <tr>
                    <th width=10%>주소</th>
                    <td width=90%>${placeDetailData.address }</td>
                </tr>
                <tr>
                    <th width=10%>전화</th>
                    <td width=90%>${placeDetailData.tel }</td>
                </tr>
                <tr>
                    <th width=10%>홈페이지</th>
                    <td width=90%>${placeDetailData.homepage }</td>
                </tr>
                <tr>
                    <th width=10%>영업시간</th>
                    <td width=90%>${placeDetailData.openhour }</td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>