<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/board/include/include-header.jspf"%>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view" id="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<h1>내놓기</h1>
			<h4>매물정보 입력</h4>
			<tbody>
				<tr>
					<th scope="col">매물유형</th>
					<td><input type="radio" id="house_type" name="HOUSE_TYPE"
						value="아파트" checked="checked">아파트 <input type="radio"
						id="house_type" name="HOUSE_TYPE" value="빌라">빌라 <input
						type="radio" id="house_type" name="HOUSE_TYPE" value="원룸">원룸
						<input type="radio" id="house_type" name="HOUSE_TYPE" value="주택">주택</td>
				</tr>
				<tr>
					<th scope="col">거래유형</th>
					<td><input type="radio" id="trade_type" name="TRADE_TYPE"
						value="매매" checked="checked">매매 <input type="radio"
						id="trade_type" name="TRADE_TYPE" value="전세">전세 <input
						type="radio" id="trade_type" name="TRADE_TYPE" value="월세">월세</td>
				</tr>
				<tr>
					<th scope="col">주소</th>
					<td><input type="text" id="address" name="ADDRESS"
						class="wdp-90" size="50"></input></td>
				</tr>
				<tr>
					<th scope="col">면적</th>
					<td><input type="text" id="measure1" name="MEASURE1"
						class="wdp-90" size="5"></input> 평/ <input type="text"
						id="measure2" name="MEASURE2" class="wdp-90" size="5"></input> m<sup>2</sup>
					</td>
				</tr>
				<tr>
					<th scope="col">해당 층 / 총 층</th>
					<td><input type="text" id="floor1" name="FLOOR1"
						class="wdp-90" size="5"></input> 층/ <input type="text" id="floor2"
						name="FLOOR2" class="wdp-90" size="5"></input> 층</td>
				</tr>
				<tr>
					<th scope="col">희망 매매가</th>
					<td><input type="text" id="price" name="PRICE" class="wdp-90"
						size="10"></input> 만원</td>
				</tr>
				<!-- 				<tr>
					<th scope="col">희망 전세가</th>
					<td> <input type="text" id="price" name="PRICE" class="wdp-90" size="10"></input> 만원</td>
				</tr>
				<tr>
					<th scope="col">희망 보증금</th>
					<td> <input type="text" id="price" name="PRICE" class="wdp-90" size="10"></input> 만원</td>
				</tr> -->
				<tr>
					<th scope="col">희망 월세가</th>
					<td><input type="text" id="m_price" name="M_PRICE"
						class="wdp-90" size="10"></input> 만원</td>
				</tr>
				<tr>
					<th scope="col">방수</th>
					<td><input type="text" id="room" name="ROOM" class="wdp-90"
						size="5"></input> 개</td>
				</tr>
				<tr>
					<th scope="col">화장실수</th>
					<td><input type="text" id="bathroom" name="BATHROOM"
						class="wdp-90" size="5"></input> 개</td>
				</tr>
				<tr>
					<th scope="col">물건 특징</th>
					<td class="view_text"><textarea cols="15" cols="90" title="내용"
							id="note" name="NOTE"></textarea></td>
				</tr>
				<tr>
					<th scope="col">거래희망일</th>
					<td><select name="TRADE_YEAR">
							<option value="" selected disabled hidden>년도선택</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
					</select> <select name="TRADE_MONTH">
							<option value="" selected disabled hidden>월선택</option>
							<option value="1">1월</option>
							<option value="2">2월</option>
							<option value="3">3월</option>
							<option value="4">4월</option>
							<option value="5">5월</option>
							<option value="6">6월</option>
							<option value="7">7월</option>
							<option value="8">8월</option>
							<option value="9">9월</option>
							<option value="10">10월</option>
							<option value="11">11월</option>
							<option value="12">12월</option>
					</select></td>
				</tr>
			</tbody>
		</table>

		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<h4>부가정보 입력</h4>
			<tbody>
				<tr>
					<th scope="col">건물명</th>
					<td><input type="text" id="house_name" name="HOUSE_NAME"
						class="wdp-90" size="50"></input></td>
				</tr>
				<tr>
					<th scope="col">대출금</th>
					<td><input type="text" id="loan" name="LOAN" class="wdp-90"
						size="10"></input> 만원</td>
				</tr>
			</tbody>
		</table>
<br/>
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>

			<tr>
				<th scope="col" colspan="2">사진등록</th>
			</tr>
			<tr>
			<tbody>
				<tr>
					<td>
						<div id="fileDiv">
							<p>
								<input type="file" id="file" name="file_0"> <a
									href="#this" class="btn" id="delete" name="delete">삭제</a>
							</p>
						</div>
					</td>
				</tr>
			</tbody>
			</tr>

		</table>
		<br />
		<br /> 
		<a href="#this" class="btn" id="addFile">파일 추가</a> 
		<a href="#this" class="btn" id="write">등록</a> 
		<a href="#this" class="btn" id="list">취소</a>
	</form>
	
	<%@ include file="/WEB-INF/views/board/include/include-body.jspf"%>
	<script type="text/javascript">
	var gfv_count = 1;
	
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
            
            $("#addFile").on("click", function(e){ //파일 추가 버튼
                e.preventDefault();
                fn_addFile();
            });
             
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
			comSubmit.submit();
		}

		function fn_insertBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
			comSubmit.submit();
		}
		
        function fn_addFile(){
            var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
            $("#fileDiv").append(str);
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        }
         
        function fn_deleteFile(obj){
            obj.parent().remove();
        }
	</script>
</body>
</html>
