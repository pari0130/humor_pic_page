<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- PORTFOLIO -->
<div id="wrapper-container" class="page-animation">
    <div class="container object">
        <div id="main-container-image">
            <section class="work">
            <%-- <% for(int i=0; i < 20; i++){ %> --%>
            <script>
            	var org_id = 0;
            </script>
            <c:if test="${not empty list}">
	            <c:forEach var="tmp" items="${list }">
	                <figure class="img-panel"> <%-- ${pageContext.request.contextPath } --%> 
	                <!-- data-imgLiquid-fill="true"
	                data-imgLiquid-horizontalAlign="center"
       				data-imgLiquid-verticalAlign="center"   -->    				
	                    <a href="${pageContext.request.contextPath }/list/contents_detail.do?cont_id=${tmp.cont_id}&mn=${menu}">
	                    
	                    <!-- data-imgLiquid-fill="true"
		                data-imgLiquid-horizontalAlign="center"
	       				data-imgLiquid-verticalAlign="center"> -->
	       				<img src="${tmp.cont_image_fill }" class="lazy" alt="" />
	       				<%-- <div class=img-panel>
	       					<img src="${tmp.cont_image_fill }" class="lazy" alt="" />
	       				</div> --%>	 
	       				<!-- <script>
		       				console.log("slice img 값 : " + "${tmp.cont_image}");		       				
		       				var id = org_id ++;
		       				var org_url = "${tmp.cont_image}";
		       				var slice1 = org_url.slice(0, 48);
		       				var slice2 = org_url.slice(48);
		       				console.log("slice1 : " + slice1);	     		
		       				console.log("slice2 : " + slice2);
		       				var fill_img = slice1 + "w_243,h_300,c_fill/" + slice2;
		       				console.log("slice 합 : " + slice1 + "w_243,h_300,c_fill/" + slice2);		
		       				/* $(".img-panel").prepend('<img class="lazy"' + 'id="' + id + '" ' +  'src="" alt="" />'); */
		       				var src = $(".img-panel img").attr("src");
		       				
		       				if (src == org_url){
		       					$(this).attr({
		       						src : fill_img
		       					});
		       				};
		       				console.log("src : " + src);
		       				/* $(".img-panel").find("img").attr({
		       					src: fill_img		       				
		       				}); */
	       				</script> -->                  
	                      <!--  <dl>
	                        <dt>Wordpress theme</dt>
	                        <dd>Symphony is a responsive one page website template designed with sketches and coded with html5 and php. Freebie released by Lacoste Xavier.</dd>    
	                    </dl> -->
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
    <div id="wrapper-oldnew">
        <div class="oldnew">
            <div class="wrapper-oldnew-prev">
                <div id="oldnew-prev"></div>
            </div>
            <div class="wrapper-oldnew-next">
                <div id="oldnew-next"></div>
            </div>
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