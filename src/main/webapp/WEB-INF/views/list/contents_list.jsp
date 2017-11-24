<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- PORTFOLIO -->
<div id="wrapper-container" class="page-animation">
    <div class="container object">
        <div id="main-container-image">
            <section class="work">
            <%-- <% for(int i=0; i < 20; i++){ %> --%>
            <input type="hidden" id="getMenuName" value="${menu }"/>
            <input type="hidden" id="getPageNum" value=""/>
            
            <c:if test="${not empty list}">
	            <c:forEach var="tmp" items="${list }">
	                <figure class="img-panel"> <%-- ${pageContext.request.contextPath } --%> 				
	                    <a href="${pageContext.request.contextPath }/list/contents_detail.do?cont_id=${tmp.cont_id}&mn=${tmp.menu_name}">
	       					<img src="${tmp.cont_image_fill }" class="lazy" alt="" />	       					       					
	       				</a>	                
	                    <div id="wrapper-part-info">
	                        <%-- <div class="part-info-image"><img src="${pageContext.request.contextPath }/resources/img/icon-psd.svg" alt="" width="28" height="28" /></div> --%>
	                        <div id="part-info">${tmp.cont_title }</div>
	                    </div>
	                </figure>  
	             <%-- <%} %> --%>    
	             </c:forEach>
             </c:if>        
            </section>
        </div>
    </div>
    <div id="wrapper-oldnew"> <!-- <div id="wrapper-oldnew"> -->
        <div class="oldnew">            
             <div class="wrapper-loadmore">
              <a href="javascript:loadMore();">
                <div id="loadmore"></div>          
                </a>
            </div> 
            <div id="loader"></div>
           <!--  <div class="wrapper-oldnew-next">
       		 <a href="javascript:loadMore();">
                <div id="oldnew-next"></div>
             </a>
            </div> -->       
        </div>
    </div>
    <div id="wrapper-thank">
        <div class="thank">
            <div class="thank-text">Pic-<span style="letter-spacing:-5px;">h</span>umor</div>
        </div>
    </div>
    <div id="main-container-footer">
        <div class="container-footer">
            <!-- <div id="row-1f">
                <div class="text-row-1f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">What is Platz</span>
                    <br>Platz is a blog showcasing hand-picked free themes, design stuff, free fonts and other resources for web designers.</div>
            </div>
            <div id="row-2f">
                <div class="text-row-2f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">How does it work</span>
                    <br>Platz offers you all the latest freebies found all over the fourth corners without to pay.</div>
            </div>
            <div id="row-3f">
                <div class="text-row-3f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">Get in touch!</span>
                    <br>Subscribe our RSS or follow us on Facebook, Google+, Pinterest or Dribbble to keep updated.</div>
            </div> -->
            <div id="row-4f">
                <div class="text-row-4f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">Newsletter</span>
                    <br>You will be informed monthly about the latest content avalaible.</div>
                <div id="main_tip_newsletter">
                    <form>
                        <input type="text" name="newsletter" id="tip_newsletter_input" list="newsletter" autocomplete=off required>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="wrapper-copyright">
        <div class="copyright">
            <div class="copy-text object">Copyright © 2016. Template by <a style="color:#D0D1D4;" href="https://dcrazed.com/">Dcrazed</a></div>
            <div class="wrapper-navbouton">
                <div class="google object">g</div>
                <div class="facebook object">f</div>
                <div class="linkin object">i</div>
                <div class="dribbble object">d</div>
            </div>
        </div>
    </div>
</div>

<script>
// 카테고리 메뉴에서 이동할때 마다 pageNum을 1로 받아와서 초기화를 시켜야 loadMore 시킬때 변수가 초기화된다.
var pageNum = "${pageNum}";
pageNum = Number(pageNum);
console.log("pageNum : " + pageNum);

function loadMore(){
	   console.log("loadMore pageNum : " + pageNum);
	   pageNum = pageNum + 1;
	   var menu = $("#getMenuName").val();	   	   
	   console.log("pageNum : " + pageNum);
	   console.log("page menu : " + menu);
	   
	   $.ajax({
        method      : 'get',
        url         : '/list/contents_jsonList.do?mn=' + menu + '&pageNum=' + pageNum,
        // json 형태로 보내기 위해서 JSON.stringify(arr)
        /* data        : JSON.stringify(arr), */
        /* SyntaxError Unexpected end of JSON input 가 발생하여 datatype을 지움
        dataType	: "json", */
        contentType	: "application/json; charset=UTF-8",
        error       : function(request, status, error) {
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        },
        success     : function(result) {		            	
    		console.log("list 받아오기 성공");
    		// 성공 후 
    		var endrow = result.endRowNum;
    		var totalrow = result.totalRow;
    		var list = result.list;
    		console.log(result);
    		console.log("endrow :" + endrow);
    		console.log("totalrow :" + totalrow);  
    		// 비교를 위해 넘겨받은 endrow, totalrow를 number type으로 변환한다.
    		endrow = Number(endrow);
    		totalrow = Number(totalrow);
    		$(result.list).each(function(){
    			console.log("image : " + this.cont_image_fill);
    			console.log("title : " + this.cont_title);    			
    			// image section 추가 하는 append
    			// $("#main-container-image").delay(1250).animate({opacity:'1'},500);
    			var item = '<figure class="img-panel ' + pageNum + '">'
 					+ '<a href="${pageContext.request.contextPath }/list/contents_detail.do?cont_id=' + this.cont_id + '&mn=' + this.menu_name +'">'
 					+ '<img src="' + this.cont_image_fill +'" class="lazy" alt="" />'
 					+ '</a>'
 					+ '<div id="wrapper-part-info">'
 					+ '<div id="part-info">' + this.cont_title + '</div>'
 					+ '</div>'
 					+ '</figure>';
 				console.log("item : " + item);
 				$(item).appendTo("section.work").hide();
 				/* $("figure." + pageNum).hide().fadeIn(1000); */
 				/* $("section.work").append(item); */ 				
 				/* item.animate({opacity:'1'},500); */
    			/* $("section.work")
	 			.append('<figure class="img-panel">'
	 					+ '<a href="${pageContext.request.contextPath }/list/contents_detail.do?cont_id=' + this.cont_id + '&mn=' + this.menu_name +'">'
	 					+ '<img src="' + this.cont_image_fill +'" class="lazy" alt="" />'
	 					+ '</a>'
	 					+ '<div id="wrapper-part-info">'
	 					+ '<div id="part-info">' + this.cont_title + '</div>'
	 					+ '</div>'
	 					+ '</figure>').fadeIn(2000); */
	 					/* .animate({opacity:'1'},500); */       			   			
    		}); // each문 종료
    		
    		$("#loadmore").hide();	
    		// 로더함수 생성
    		var $loader = $("#loader");
    		// 로더실행
    		$loader.gSpinner({
    			scale: .3
    		});
    		
    		// 2초 후 로딩 숨김, 더보기 표시
    		setTimeout(function(){
    			$loader.gSpinner("hide");
    			$("figure." + pageNum).show();
    			// endrow랑 totalrow랑 비교해서 행의 전체 row보다 커질경우 더보기 버튼을 숨긴다.
        		if(endrow >= totalrow){        			
        			$("#wrapper-loadmore").css("display", "none");        			
        		}else{
        			$("#loadmore").show();	
        		};
    		},1500);

    } // success 종료
}); // ajax 종료
};

</script>