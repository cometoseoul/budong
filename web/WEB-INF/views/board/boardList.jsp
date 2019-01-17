<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/board/include/include-header.jspf"%>
</head>
<body>
	<h1>매물 목록</h1>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">IDX</th>
				<th scope="col">거래 유형</th>
				<th scope="col">사진</th>
				<th scope="col">이름/가격</th>
				<th scope="col">정보</th>
				<th scope="col">부동산</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<!-- <a href="#this" name="HOUSE_NAME"> -->
						<tr>
							<td>${row.IDX }</td>
							<td>${row.TRADE_TYPE }</td>
							<td>
								<div>
									<img
										src="https://img.icons8.com/metro/50/000000/sun-glasses.png">
								</div>
							</td>
							<td>${row.HOUSE_NAME }/${row.PRICE }만원</td>
							<td><a href="#this" name="house"> <input type="hidden"
									name="IDX" id="IDX" value="${row.IDX }"> 방${row.ROOM }개/욕실${row.BATHROOM }개
									${row.MEASURE1 }m<sup>2</sup>/${row.MEASURE2 }평 ${row.FLOOR1 }층/${row.FLOOR2 }층<br>
									${row.NOTE }<br> ${row.ADDRESS }
							</a></td>
							<td></td>
						</tr>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br />

	<%-- 	<div class="">
		<ul class="" text-align="center">
			
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
					<li>
						<a href="this" name="HOUSE_NAME" >
						<input type="hidden" id="IDX" value="${row.IDX }">
							<span class="">${row.TRADE_TYPE }</span>
							<div>
								<img src="https://img.icons8.com/metro/50/000000/sun-glasses.png">
							</div>
							<span class="">
								<strong>${row.HOUSE_NAME}</strong>
								<strong>${row.PRICE }</strong>
							</span>
							<span class="">
								<span>
									방${row.ROOM }개/욕실${row.BATHROOM }개 ${row.MEASURE1 }m<sup>2</sup>/${row.MEASURE2 }평 ${row.FLOOR1 }층/${row.FLOOR2 }층
								</span>
								<p>${row.NOTE }</p>
								<p>
									<span>${row.ADDRESS }</span>
								</p>
							</span>
						</a>
						</li>
					</c:forEach>
				</c:when>
			</c:choose>

		</ul>
	</div> --%>
	
<!-- 	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

	<br /> -->


	<a href="#this" class="btn" id="write">글쓰기</a>

	<%@ include file="/WEB-INF/views/board/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList(1);
			
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});

			$("a[name='house']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});

		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardWrite.do' />");
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardDetail.do' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
		
/*         function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/sample/selectBoardList.do' />");
            comAjax.setCallback("fn_selectBoardListCallback");
            comAjax.addParam("PAGE_INDEX",pageNo);
            comAjax.addParam("PAGE_ROW", 15);
            comAjax.ajax();
        }
         
        function fn_selectBoardListCallback(data){
            var total = data.TOTAL;
            var body = $("table>tbody");
            body.empty();
            if(total == 0){
                var str = "<tr>" +
                                "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                            "</tr>";
                body.append(str);
            }
            else{
                var params = {
                    divId : "PAGE_NAVI",
                    pageIndex : "PAGE_INDEX",
                    totalCount : total,
                    eventName : "fn_selectBoardList"
                };
                gfn_renderPaging(params);
                 
                var str = "";
                $.each(data.list, function(key, value){
                    str += "<tr>" +
                                "<td>" + value.IDX + "</td>" +
                                "<td class='house'>" +
                                    "<a href='#this' name='house_name'>" + value.HOUSE_NAME + "</a>" +
                                    "<input type='hidden' name='house' value=" + value.IDX + ">" +
                                "</td>" +
                                "<td>" + value.HIT_CNT + "</td>" +
                                "<td>" + value.CREA_DATE + "</td>" +
                            "</tr>";
                });
                body.append(str);
                 
                $("a[name='title']").on("click", function(e){ //제목
                    e.preventDefault();
                    fn_openBoardDetail($(this));
                });
            }
        } */


	</script>


</body>
</html>