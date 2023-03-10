<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!--Join 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/notice.css" rel="stylesheet">
    
</head>
<body>

	<%@ include file="../include/header.jsp" %>

    <div class="container" style="margin-top:30px;">
        <div class="row">
            <div class="accordion accordion-flush" id="accordionFlushExample">
                  <div id="noticeContentDiv">
                    <!-- 공지사항 리스트 자리 -->
                </div>
            </div>
        </div>
        <div class="row justify-content-center m-5" >
              <div class="col-1 w-auto">
                  <button type="button" class="sbtn cyan small rounded" id="the-noti-btn" style="display: none;">더보기</button>
              </div>
        </div>
    </div>

	<%@ include file="../include/footer.jsp" %>
    
</body>

<script>

    $(function() {
    	
    	let no = parseInt('${param.no}');
    	
    	const total = parseInt('${total}');
    	console.log('total' + total);
        
        //등록하기 버튼 클릭 이벤트
        $('#the-noti-btn').click(function() {
            if(!isFinish) {
                page++;
                getLists(page, false);
            } else {
                console.log('더이상 불러올 목록이 없다.');
            }
        });
        
        let str = '';
        let page = 1;
        let isFinish = false;
        
        getLists(1, false);
        
        let pageList = 0;
        let noticeNo = 0;
        function getLists(page, reset) {
            
            console.log('getList 함수 호출');
            console.log('page: ' + page);
            console.log('reset: ' + reset);
            
            if(reset === true) {
                str = ''; //화면 리셋 여부가 true라면 str변수를 초기화.
            }
            
            $.getJSON(
                '<c:url value="/board/noticeLists?pageNum='+ page +'" />',
                function(lists) {
                    console.log("list.length : " + lists.length);
                    console.log("list : " + lists);
                    
    				if(total > page*10){
    					$('#the-noti-btn').css('display','block');
    				}else {
    					isFinish = true;
    					$('#the-noti-btn').css('display','none');
    				}
                    
                    for(let i=0; i<lists.length; i++) {
                        if(no === lists[i].noticeNo) {
                        	str += 
                                `<div class="accordion-item border shadow">
                                    <h2 class="accordion-header" id="flush-headingOne` + lists[i].noticeNo + `">
                                        <button class="accordion-button text-black-50" id="btn-noti-btn`+lists[i].noticeNo+`" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne` + lists[i].noticeNo + `" aria-expanded="true" aria-controls="flush-collapseOne` + lists[i].noticeNo + `">` + lists[i].noticeTitle + `</button>
                                    </h2>
                                    <div id="flush-collapseOne` + lists[i].noticeNo + `" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne` + lists[i].noticeNo + `" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">` + lists[i].noticeContent + `</div>
                                    </div>
                                    </div>`;
                        } else {
                        	str += 
                                `<div class="accordion-item border shadow">
                                    <h2 class="accordion-header" id="flush-headingOne` + lists[i].noticeNo + `">
                                        <button class="accordion-button collapsed text-black-50" id="btn-noti-btn`+lists[i].noticeNo+`" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne` + lists[i].noticeNo + `" aria-expanded="false" aria-controls="flush-collapseOne` + lists[i].noticeNo + `">` + lists[i].noticeTitle + `</button>
                                    </h2>
                                    <div id="flush-collapseOne` + lists[i].noticeNo + `" class="accordion-collapse collapse" aria-labelledby="flush-headingOne` + lists[i].noticeNo + `" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">` + lists[i].noticeContent + `</div>
                                    </div>
                                    </div>`;
                        }
                       
                    }
                    
                    $('#noticeContentDiv').html(str);
                    
                }
                    
            ); //end getJSON()
            
        }; //end getList()
        
    });
</script>

</html>

