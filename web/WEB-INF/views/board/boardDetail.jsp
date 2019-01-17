<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/board/include/include-header.jspf"%>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
		</colgroup>
		<tbody>
			<div style="text-align:justify">
				
				<span>등록일 : ${map.CREA_DATE }</span>
				<span >조회 : ${map.HIT_CNT }</span>
			</div>

			<h4>매물정보</h4>
			<tr>
				<th scope="row">공급면적</th>
				<td>${map.MEASURE1 }m<sup>2</sup>(${map.MEASURE2 }평)</td>
				<th scope="row">전용면적</th>
				<td>${map.MEASURE1 }m<sup>2</sup>(${map.MEASURE2 }평)</td>
			</tr>
			<tr>
				<th scope="row">해당층/총층</th>
				<td>${map.FLOOR1 }층/${map.FLOOR2 }층</td>
				<th scope="row">방수/욕실수</th>
				<td>${map.ROOM }개/${map.BATHROOM }개</td>
			</tr>
			<tr>
				<th scope="row">실구입자금</th>
				<td>${map.PRICE }만원</td>
				<th scope="row">입주가능일</th>
				<td>${map.TRADE_YEAR }년 ${map.TRADE_MONTH }월 이후</td>
			</tr>
			<tr>
                <th scope="row">사진</th>
                <td colspan="3">
                    <c:forEach items="${list }" var="row" >
                        <input type="hidden" id="IDX" value="${row.IDX }">
                        <a href="#this" name="file" id="file">
                        <img src="http://localhost:8080/budong/common/viewImageFile.do?IDX=${row.IDX}" width=150 height=180></a><br/>
                    </c:forEach>

                </td>
            </tr>
		</tbody>
	</table>

	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>

	<%@ include file="/WEB-INF/views/board/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});


            $("#update").on("click", function(e){ //수정하기 버튼
                e.preventDefault();
                fn_openBoardUpdate();
            });
             
            $("a[name='file']").on("click", function(e){ //파일 이름
                e.preventDefault();
            });
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
			comSubmit.submit();
		}

		function fn_openBoardUpdate() {
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardUpdate.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		function fn_downloadFile(obj){
	        var idx = obj.parent().find("#IDX").val();
	        var comSubmit = new ComSubmit();
	        comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
	        comSubmit.addParam("IDX", idx);
	        comSubmit.submit();
	    }
	</script>
</body>
</html>