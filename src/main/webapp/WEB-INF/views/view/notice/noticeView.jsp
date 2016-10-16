<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<title>Insert title here</title>
<style type="text/css">
a {text-decoration: none;}

/* .bar {float:left; margin-top:50px;} */

#no {border-bottom:1px solid; border-color: #dfdfdf; height: 10px; }
#title {border-bottom:1px solid; border-color: #dfdfdf; height: 10px; }
#userid {border-bottom:1px solid;border-color: #dfdfdf; height: 10px; }
#date {border-bottom:1px solid; border-color: #dfdfdf; height: 10px; }
#cnt {border-bottom:1px solid; border-color: #dfdfdf; height: 10px; }
/* #map { width: 100%; height: 100%;} */

</style>
</head>

<body>

   <input type="hidden" name="cnt" value="${bean.cnt }">
   
   <c:choose>
      <c:when test="${bean.noticekey eq 'info' }"> 
         <img  src="../../../${bean.resource }/notice/notice_info_11.gif" >
        
        <div id="t" style="margin-top:30px;">
           <img src="../../../${bean.resource }/notice/notice_info.jpg">
        </div>    
   
       
         <div id="mapTopbar"></div>
         <div  id="map-canvas" style="margin-bottom:100px; width: 100%; height: 340px" title=""></div>
   
   
          
      </c:when>
   
      <c:when test="${bean.noticekey eq 'question' }">
      
         <img alt="" src="../../../${bean.resource }/notice/notice_question_11.gif">
         <img alt="" src="../../../${bean.resource }/notice/notice_cal.jpg">
         
             
               <tr>
                  <td height="50px"></td>
               
               </tr>
      </c:when>
               
   
      <c:otherwise>
         <c:choose>
            <c:when test="${bean.noticekey eq 'noticeboard' }">
               <img  src="../../../${bean.resource }/notice/notice_noticeboard_11.gif">    
          
            </c:when>
           
            
            <c:when test="${bean.noticekey eq 'qna' }">
                 <img  src="../../../${bean.resource }/notice/notice_QnA_11.jpg">
            </c:when>
         </c:choose>
            
            
            <table border="0"  width="100%" align="center" id="wrap" cellpadding="0" cellspacing="0" >
           
               <tr>
                  <img src="../../../${bean.resource }notice/notice_title.jpg">
               </tr>
               <tr height="10px"></tr>
               
               <c:forEach items="${bean.insertboard }" var="dd" varStatus="no">
                     
                     <tr >
                        <td width="80px" id="no" align="center">
                           <font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${dd.ids }</font> </td>
                        <td width="510px" id="title" align="left">
                           <c:forEach begin="1" end="${dd.ref }" >&nbsp;&nbsp;</c:forEach>
                           <c:if test="${dd.ref>0 }">
                              <img src="../../../${bean.resource }notice/notice_re.jpg">
                           </c:if>
          
                          <a href="#" onclick="noticedetail('${dd.title }',${dd.ids},'${dd.noticekey }',${no.index+dd.start })"> 
                          <font color="black" face="dothum" style="font-size:10pt; font-weight: bold;">${dd.title }</font></a>
                         
                         </td>
                      
                        <td width="7%" id="userid" align="center"> 
                           <font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${dd.userid }</font>
                        </td>
                        
                        <td width="18%" id="date" align="center"> 
                           <font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">
                           <fmt:formatDate value="${dd.reg_date }"  pattern="yy-MM-dd  "/></font>
                        </td>
                               
                        <td id="cnt" align="center">
                           <font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${dd.cnt }</font></td>
                           
                        
                     </tr>
                     <tr height="10px"></tr>
                   
               </c:forEach>
         </table>      
  <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->                
             <table border="0" align="center" width="100%">  
                     <tr>
                        <c:choose>
                        
                       
                           <c:when test="${bean.serviceKey eq 'noticeboard' }">
                              <td align="right" style="margin-top: 20px;" width="30%" height="40px" valign="middle">       
                              <c:if test="${bean.startPage>1}">
                        <div style="margin-top: 2px; float:left; margin-left:240px; "><a href="#" onclick="noticepaging(1,'${bean.serviceKey }')"><img  border="0" src="../../../${bean.resource }/btn/pyosi_left_left.png"></a></div>
                       <div style="margin-top: 2px; float:reft;"><a href="#"  onclick="noticepaging(${bean.pageLimit},'${bean.serviceKey }')">
                        <img  border="0" src="../../../${bean.resource }/btn/pyosi_left.png"></a></div>
                                          
                        </c:if>
                        </td>
                        <td align="center" style="margin-top: 20px;" height="40px" width="10%" valign="middle">
                          <c:forEach  begin="${bean.startPage }" end="${bean.endPage }" var="i">
                            
                                 <c:choose>
                                    <c:when test="${i == bean.noticePage }">
                                       <font color="red" face="dothum"  style="font-size:10pt; font-weight: bold;">[${i }]</font>
                                    </c:when>
                                    <c:otherwise>
                                       <a href="#" onclick="noticepaging(${i},'${bean.serviceKey }')"><font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i }</font></a>
                                    </c:otherwise>
                                 </c:choose>
                             
                              </c:forEach>
                               </td>
                           <td align="left"  height="40px" valign="middle" width="30%">
                            
                              <c:if test="${bean.endPage < bean.totalPage}">
                              
                             <div style="margin-top: 2px;float:left;"><a href="#" onclick="noticepaging(${bean.pageLimit+1},'${bean.serviceKey }')"><img border="0" src="../../../${bean.resource }/btn/pyosi_right.png"> </a></div>
                               <div style="margin-top: 2px; float:left; margin-left:10px; "><a href="#" onclick="noticepaging(${bean.totalPage},'${bean.serviceKey }')"><img border="0" src="../../../${bean.resource }/btn/pyosi_right_right.png"> </a></div>
                                                  
                            </c:if>
                            
                            <c:if test="${  bean.noticekey eq 'noticeboard' &&  logchk.grade <2}">
                  
                            <div style="margin-top: 2px;float:right; margin-right: 0px;"><a href="#" onclick="noticewrite('noticeWrite','${bean.noticekey}')"><img border="0" src="../../../${bean.resource }/btn/write.jpg"></a> </div>
                  
                           </c:if>
                              </td>
                           </c:when>
                          
                         
                        <c:when test="${bean.serviceKey eq 'qna' }">
                        
                       
                          <td align="right" style="margin-top: 20px;" width="30%" valign="middle"> 
                            <c:if test="${bean.startPage>1}">
                               <div style="margin-top: 2px; float:left; margin-left: 240px;">
                                     <a href="#" onclick="noticepaging(1,'${bean.serviceKey }')">
                                     <img  border="0" src="../../../${bean.resource }/btn/pyosi_left_left.png">
                                  </a>
                               </div>
                                <div style="margin-top: 2px; float:reft; ">
                                   <a href="#" onclick="noticepaging(${bean.pageLimit},'${bean.serviceKey }')">
                                    <img border="0" src="../../../${bean.resource }/btn/pyosi_left.png"></a></div>
                           </c:if>
                        </td>
                       <td align="center" style="margin-top: 20px;" height="40px" width="26%" valign="middle">
                              <c:forEach  begin="${bean.startPage }" end="${bean.endPage }" var="i"> 
                                 <c:choose>
                                    <c:when test="${i == bean.qnaPage }">
                                       <font color="red"  face="dothum"  style="font-size:10pt; font-weight: bold;">[${i }]</font>
                                    </c:when>
                                    <c:otherwise>
                                       <a href="#" onclick="noticepaging(${i},'${bean.serviceKey }')">
                                             <font color="black" face="dothum"  style="font-size:10pt; font-weight: bold;">${i }</font>
                                       </a>
                                    </c:otherwise>
                                 </c:choose>
                              
                              </c:forEach>
                         </td>  
                        <td align="left"  height="40px" width="30%" valign="middle">
                              <c:if test="${bean.endPage < bean.totalPage}">
                                <div style="margin-top: 2px; float:left;">
                                     <a href="#" onclick="noticepaging(${bean.pageLimit+1},'${bean.serviceKey }')">
                                        <img border="0" src="../../../${bean.resource }/btn/pyosi_right.png"> 
                                     </a>
                                  </div>
                                  <div style="margin-top: 2px; float:left; margin-left:10px; ">
                                  <a href="#" onclick="noticepaging(${bean.totalPage},'${bean.serviceKey }')">
                                     <img border="0" src="../../../${bean.resource }/btn/pyosi_right_right.png"> 
                                  </a>
                               </div>
                  
                           </c:if>
                     
                           <c:if test="${  bean.noticekey eq 'qna' &&  logchk.grade > 1 && logchk.grade<4 }">
                 
                               <div style="margin-top: 2px;float:right; margin-right: 0px;">
                                 <a href="#" onclick="noticewrite('noticeWrite','${bean.noticekey}')">
                                   <img border="0" src="../../../${bean.resource }/btn/write.jpg">
                                 </a>
                               </div>
                  
                          </c:if>  
                        </td> 
                           </c:when>
                        
                        </c:choose>
                    </tr>    
               
                  
                
               <tr>
                  <td height="50px"></td>
               
               </tr>
            </table>
            
         
      </c:otherwise>
         
   
   </c:choose>

   
<script type="text/javascript">
function initialize() {
   
   var res = "<img border=\"0\" style=\"margin-bottom: 10px;\" src=\"../../../resources/menuimage/MapDetailBoardTopBar2.jpg\">";
   
   document.getElementById("mapTopbar").innerHTML = res;
   
   var addressResult = '서울시 종로구 연지동 261-1';
   
   
   var mapOptions = {
                      zoom: 18, // 지도를 띄웠을 때의 줌 크기
                      mapTypeId: google.maps.MapTypeId.ROADMAP
                  };
   
   
  var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
                              mapOptions);
/*    
  var size_x = 40; // 마커로 사용할 이미지의 가로 크기
  var size_y = 40; // 마커로 사용할 이미지의 세로 크기 */

  // 마커로 사용할 이미지 주소
 /*  var image = new google.maps.MarkerImage('http://www.travista.co.kr/files/where/thumb/thumb_20101031_102502_581_C0',
                                              new google.maps.Size(size_x, size_y),
                                              '',
                                              '',
                                              new google.maps.Size(size_x, size_y));
    */
  
  // Geocoding *****************************************************
  var address = ""+addressResult; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
  var marker = null;
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          marker = new google.maps.Marker({
                          map: map,
                          title: '대표이사 : 이신협', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                          position: results[0].geometry.location
                      });

          var content = "연지점"; // 말풍선 안에 들어갈 내용
       
          // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
          var infowindow = new google.maps.InfoWindow({ content: content});
          google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
      } else {
          alert("Geocode was not successful for the following reason: " + status);
      }
  });
  // Geocoding // *****************************************************
   

}

google.maps.event.addDomListener(window, 'load', initialize);
   

</script>

            
</body>
</html>