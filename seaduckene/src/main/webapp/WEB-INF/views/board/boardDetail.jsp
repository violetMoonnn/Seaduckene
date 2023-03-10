<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ include file="../include/header.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/detail.css" rel="stylesheet">

<section>
<div class="container board-detail-container mt-4"> 
	  <div class="row">
      <div class="mb-3">
	  	<div class="col col align-self-center" style="position: relative;">
        	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='15'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb" style="margin-bottom: 0; font-size: 25px; color: #ffc107;">
			    <li class="breadcrumb-item mt-1" id="majorTitle">${category.categoryMajorTitle}</li>
			    <li class="breadcrumb-item mt-1" id="minorTitle">${category.categoryMinorTitle}&nbsp;&nbsp;</li>
			  </ol>
			</nav>
        </div>
	</div>
   </div>
</div>

<form action="${pageContext.request.contextPath}/board/boardModify"
	id="writeForm" method="post">

	<div class="container">
		<!-- <div class="card mb-4">
			<div class="card-body"> -->
				<div class="mb-3">
					<input type="hidden" name="boardNo" value="${ list.boardNo }">
					<input type="hidden" name="boardCategoryNo" value="${ list.boardCategoryNo }">
					<label for="title" class="form-label"></label> <input type="text"
						class="form-control" id="title" name="boardTitle"
						value="${list.boardTitle}" readonly>
						
				<div class="col d-flex flex-row justify-content-end"
					id="board-detail-item">
		
					<p>
						<fmt:formatDate value="${list.boardRegDate}" pattern="yyyy/MM/dd" />
					</p>
					<p>&nbsp;&nbsp;์กฐํ์: ${list.boardViews }</p>
				</div>

				<div class="col d-flex flex-row justify-content-end"
					id="board-detail-item">
							
				</div>
				<hr>
				<div class="mb-3" id="board-detail-content">
					<label for="content" class="form-label"></label>
					<textarea class="form-control" id="summernote" name="boardContent"
						readonly rows="15"></textarea>
				
				<br>

				</div>
				<div id="board-detail-button">
					<a href='<c:url value='/board/boardList/${list.boardCategoryNo}'/>'
						class="right sbtn blue small rounded" id="listBtn">๋ชฉ๋ก๊ฐ๊ธฐ</a>
					<button type="submit" class="right sbtn cyan small rounded" id="ModBtn">์์?ํ๊ธฐ</button>
				</div>
				
			</div>
<!-- 		</div>
	</div> -->
	</div>
</form> 

<br>


<div class="container regReply" >
	<div class="card-body">
		<div class="row gx-5">
			
			<!-- ๋ก๊ทธ์ธ ์ -->
			<c:if test="${login != null}">
				<div class="col">
					<div class="d-flex align-items-center mb-1"  >
						<h6 class="me-auto mb-0" id="replyBoardNo">&nbsp;${login.userNickname}</h6>
					</div>

					<div class="d-flex align-items-center">
						<input type="hidden" value="${login.userNo}" id="replyUserNo"></input>
						<textarea class="form-control" rows="3" id="reply"></textarea>
					</div>
					<br>
					<div>

						<button type="button" id="replyRegist" class="right sbtn cyan small rounded" style="margin-bottom: 15px;">๋ฑ๋กํ๊ธฐ</button>

					</div>
				</div>
			</c:if>
			<br>
		

			<div id="replyList">
				<!-- <div class=col>
				<div class="d-flex align-items-center mb-3"></div>
				<div class="reply-content"> <strong class='left'>nick</strong>
					<small class='left'>date</small> <a href='#' class='right'>
					<textarea class="form-control" rows="3" id="reply"></textarea>
					<a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>์์?</a> 
					<a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>์ญ์?</a>
				</div>
				<p class='clearReply'>๋๊ธ</p>
			</div>
			<button type="button" class="form-control" id="moreList">๋๋ณด๊ธฐ</button> -->
			</div>
			
		</div>
		<br>

		 <div style="text-align: center;">
		 	<button type="button" class="sbtn cyan small rounded" id="moreList">๋๋ณด๊ธฐ</button>
		 </div>

	</div>

</div>


<!-- ๋ชจ๋ฌ  -->
<div class="modal fade" id="replyModal" role="dialog">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">๋๊ธ์์?</h4>
				<button type="button" class="btn btn-default pull-right modalbuttonESC"
					data-dismiss="modal">๋ซ๊ธฐ</button>
			</div>
			<div class="modal-body">
				<!-- ์์?ํผ id๊ฐ์ ํ์ธํ์ธ์-->
				<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply"
						placeholder="๋ด์ฉ์๋?ฅ" ></textarea>
					<div class="reply-group">
						<div class="reply-input">
							<input type="hidden" id="modalRno"> 
						</div>
						<br>
						<button class="right sbtn cyan small rounded" id="modalModBtn">์์?ํ๊ธฐ</button>
						<button class="right sbtn blue small rounded" id="modalDelBtn">์ญ์?ํ๊ธฐ</button>
					</div> 
				</div>
				<!-- ์์?ํผ๋ -->
			</div>
		</div>
	</div>
</div>
	

</section>





<script>


	$(document).ready(function() {
		
		console.log('์นดํ๊ณ?๋ฆฌ ๋ฒํธ' + '${list.boardCategoryNo}');

		$(function() {
			$('#summernote').summernote({
				toolbar : false,
				minHeight : 500
			});
			$('#summernote').summernote('disable');
			$('#summernote').summernote('pasteHTML', `${list.boardContent}`);
			$('.note-statusbar').hide();
			$('.note-editable').css('background', '	#fff9d6');
		});
		
		$(function() {
			console.log('์์?๋ฒํผ ํด๋ฆญ๋จ');

			const userNo = '${login.userNo}';
			console.log(userNo + 'userNo');
			
			const boardUserNo = '${list.boardUserNo}';
			console.log(boardUserNo + 'boardUserNo');
			
			if(userNo !== boardUserNo) {
				$('#ModBtn').css('display', 'none');
			} else {
				$('#ModBtn').css('display', 'inline-block');
			}
		}); // ModBtn click event ๋.
		
		$('#ModBtn').click(function() {
			 $('#writeForm').submit();
		});
		
		
		
		$('#replyRegist').click(function() {

			const boardNo = '${list.boardNo}';
			const reply = $('#reply').val();
			const replyUserNo = $('#replyUserNo').val();
			console.log('dwadwadwa' + replyUserNo);
			console.log(reply);
			console.log(boardNo);
			
			if($('#reply').val().trim() === '') {
				alert('๋ด์ฉ์ ์๋?ฅํด์ฃผ์ธ์!');
				return;
			}

			$.ajax({
				type : 'post',
				url : '<c:url value="/reply/replyRegist" />',
				data : JSON.stringify({
					"replyBoardNo" : boardNo,
					"replyContent" : reply,
					"replyUserNo" : replyUserNo
				}),
				dataType : 'text',
				contentType : 'application/json',
				success : function(data) {
					console.log('ํต์? ์ฑ๊ณต!: ' + data);
					$('#reply').val('');
					getList(1, true);
				},
				error : function() {
					alert('๋ฑ๋ก์ ์คํจํ์ต๋๋ค. ๊ด๋ฆฌ์์๊ฒ ๋ฌธ์ํด์ฃผ์ธ์.');
				}
 
			}); //ajax ๋.

		});//๋๊ธ ๋ฑ๋ก ์ด๋ฒคํธ ๋.
		
		//๋๊ธ ๋ฑ๋ก ํค ์ด๋ฒคํธ
	/* 	$('#reply').keyup(function(e) {
			if(e.key === 'Enter') {
				$('#replyRegist').click();
			} else {
				return;
			}
		}); //ํค์ด๋ฒคํธ ๋ */
		
		//๋๋ณด๊ธฐ ์ด๋ฒคํธ
		$('#moreList').click(function() {
			getList(++page, false);
		});
	 

		
		let page = 1;
		let strAdd = '';

		getList(1, true);

		function getList(pageNum, reset) {

			const bno = '${list.boardNo}';
			
			$.getJSON(
					"<c:url value='/reply/getList/' />" + bno + "/" + pageNum,
					function(data) {
						console.log('data', data);
						
						console.log("data " + data.total);
							
						let total = data.total;
						let replyList = data.list;
						let like = data.like;
						
						console.log("total "+ total);
						console.log("reply ", replyList);
						console.log("like" , like);
					/* 	console.log("like" , like[0].likeNo);
						console.log("like" , like[0].likeReplyNo);
						console.log("like" , like[0].likeUserNo);
						console.log("like" , like[0].likeState); */
						
						if(reset) {
							strAdd = '';
							page = 1; 
						}
						
						console.log('ํ์ฌ ํ์ด์ง: ' + page);
						/* console.log('์ธ๊ท: ' + replyList.userNickname); */
						if(total <= page * 5) {
							$('#moreList').css('display', 'none');
						} else {
							$('#moreList').css('display', 'inline');
						}
						/* console.log("์ต๊ณ?์ธ๊ท" + data.length); */
						if(data.length <= 0) return;
						
						for(let i=0; i<replyList.length ; i++) {
							strAdd +=
								`<div class="col">
					<div class="d-flex align-items-center mb-3"></div>
						<div class="reply-content"> <strong class='left'>`+ replyList[i].userNickname +`</strong> &nbsp&nbsp&nbsp
							<small class='left'>` + timeStamp(replyList[i].replyRegDate) + `</small>
							<a style="text-decoration:none; color : black;" id="likeBtn" href="#">`;
							
							let likeSuccess = `<img class="classlikeBtn" src="${pageContext.request.contextPath}/resources/img/like.png" width="20px"><span>`+ replyList[i].likeCount +`</span>`;
							
							if (like != null) {
								for (let j = 0; j < like.length; j++) {
									if (replyList[i].replyNo == like[j].likeReplyNo && like[j].likeState == 1) {
										likeSuccess = `<img class="classlikeBtn" src="${pageContext.request.contextPath}/resources/img/like2.png" width="20px"><span>`+ replyList[i].likeCount +`</span>`;
										break;
									}
									
								}
							}
							
							
						  strAdd += 
							likeSuccess +`</a>

				 			<input type="hidden" id="hiddenReplyNo" class="hiddenReplyNo" name="replyNo" value="`+ replyList[i].replyNo +`">
							<p data-reply-no="` + replyList[i].replyNo + `" class="form-control mt-2" id="reply" style=" word-break: break-all; border: none;">` + replyList[i].replyContent.replaceAll('\n', '<br>') + `</p>

						</div>
					
				</div>
				 <input type="hidden" id="hiddenUserNo" name="userNo" value="`+ replyList[i].userNo +`">
				`; 
						}	
						
						$('#replyList').html(strAdd);
					}		
			)
		} //get List๋
		
		$('#replyList').on('click', '.reply-content > #reply', function(e) {
			e.preventDefault();
			
			if ('${login.userNickname}' === $(this)[0].parentNode.firstElementChild.textContent){
				const replyNo = $(this).data('replyNo');
				$('#modalRno').val(replyNo);
				console.log($(this).html());
				$('#modalReply').val($(this).html().replaceAll('<br>', '\n'));
				$('#replyModal').modal('show');
				}
			
		}); //rpleyList click event ๋.
		
		$('#replyList').on('click', '#likeBtn', function(e) {
			e.preventDefault();
		});
		
		$('#replyList').on('click', '.classlikeBtn', function(e) {
			e.preventDefault();
			console.log('์ข์์!');
			console.log(e.target);
			
			let str = '';
			const userNo = '${login.userNo}';
			const replyNo = this.parentNode.nextElementSibling.value;
			let span = this.nextElementSibling;
			
			console.log("replyNo์ ๊ฐ : ", replyNo);
			console.log("this.nextElementSibling : " , this.nextElementSibling);
			console.log("userNo์ ๊ฐ : " + userNo);
			console.log("str์ ๊ฐ : " + str);
			if(userNo==''){
				alert('์ข์์๊ธฐ๋ฅ์ ๋ก๊ทธ์ธ์ด ํ์ํฉ๋๋ค');
				return;
			}
			$.getJSON(
			         '<c:url value="/snsBoard/likeUpdate?likeUserNo=' + userNo + '&likeReplyNo=' + replyNo + '"/>',
			         function(result) {
			        	 if(result === 1) {
			        		 e.target.setAttribute('src', '${pageContext.request.contextPath}/img/like2.png');
			        		 span.textContent = +span.textContent + 1;
			        		 console.log("span.textContent : ",span.textContent);
			        	 } else {
			        		 e.target.setAttribute('src', '${pageContext.request.contextPath}/img/like.png');
			        		 span.textContent = +span.textContent - 1;
			        		 console.log("span.textContent : ",span.textContent);
			        		
			        	 }
			        	 
			         } //end function
			      ); //end getJSON()

		}) //์ข์์ event click end.

		$('#modalModBtn').click(function() {
			
			const reply = $('#modalReply').val();
			const replyNo = $('#modalRno').val();
			/* const replyPw = '${login.userPw}'; */
			
			console.log('reply : ' + reply);
			console.log('replyNo : ' + replyNo);
			/* console.log('replyPw: ', replyPw); */
			
			/* if(reply === '' || replyPw === '') {
				alert('๋ด์ฉ, ๋น๋ฐ๋ฒํธ ์๋?ฅ ๋ถํ๋๋?ค์!')
				return;
			} */
		 
			$.ajax({
				type: 'post',
				url: '<c:url value="/reply/update" />',
				contentType: 'application/json',
				data: JSON.stringify({
					'replyContent': reply,
					'replyNo': replyNo,
/* 					'replyPw' : replyPw */
				}),
				success : function(result) {
					alert('์?์ ์์?๋์์ต๋๋ค.');
					$('#modalReply').val('');
					/* 	$('#modalPw').val(''); */
					$('#replyModal').modal('hide'); 
					getList(1, true);
				},
				error: function() {
					alert('์์?์ ์คํจํ์ต๋๋ค. ๊ด๋ฆฌ์์๊ฒ ๋ฌธ์ํ์ธ์!');
				}
			}); //end ajax(์์?) 
		}); //modalModBtn click event ์์? ๋.
		
		
		$('#modalDelBtn').click(function() {
			
			const replyNo = $('#modalRno').val();
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/reply/delete" />',
				data: JSON.stringify({
					'replyNo': replyNo
				}), 
				contentType: 'application/json',
				success: function(data) {
					alert('๋๊ธ์ด ์ญ์?๋์์ต๋๋ค.');
					$('#replyModal').modal('hide'); 
					getList(1, true);
				},
				error: function() {{pageContext.request.contextPath}
					alert('์์? ์คํจ! ๊ด๋ฆฌ์์๊ฒ ๋ฌธ์ํ์ธ์!');
				}
				
			}) //ajax ๋.
			
		}) //modalDelBtn click event ๋.
		
		$('.modalbuttonESC').click(function() {
			$('#replyModal').modal('hide'); 
		});
		
		$('.HomeButtonController').click(function() {
			location.href='${pageContext.request.contextPath}/';
		});
		
		
		//๋?์ง ์ฒ๋ฆฌ ํจ์
		function timeStamp(millis) {
			const date = new Date(); //ํ์ฌ ๋?์ง
			//ํ์ฌ ๋?์ง๋ฅผ ๋ฐ๋ฆฌ์ด๋ก ๋ณํ - ๋ฑ๋ก์ผ ๋ฐ๋ฆฌ์ด -> ์๊ฐ ์ฐจ
			const gap = date.getTime() - millis;
			
			let time; //๋ฆฌํดํ? ์๊ฐ
			if(gap < 60 * 60 * 24 * 1000) { //1์ผ ๋ฏธ๋ง์ผ ๊ฒฝ์ฐ
				if(gap < 60 * 60 * 1000) { //1์๊ฐ ๋ฏธ๋ง์ผ ๊ฒฝ์ฐ
					time = '๋ฐฉ๊ธ ์?';
				} else {
					time = parseInt(gap / (1000 * 60 * 60)) + '์๊ฐ ์?';
				}
			} else { //1์ผ ์ด์์ธ ๊ฒฝ์ฐ
				const regDate = new Date(millis);
				const year = regDate.getFullYear(); //๋
				const month = regDate.getMonth() + 1; //์
				const day = regDate.getDate(); //์ผ
				
				time = year + '๋' + month + '์' + day + '์ผ';
			}
			
			return time;
		}//๋?์ง ์ฒ๋ฆฌํจ์ ๋

	})
</script>
<%@ include file="../include/footer.jsp"%>
