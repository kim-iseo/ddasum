<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원식당리스트</title>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/spList.css">
	<!--  jQuery 라이브러리 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/views/commons/header/site-header.jsp"%>	

    <div id="content_wrapper">
        <div id="page_title">
            <a href="/spRestaurant/spRestaurantList.do" style="all:unset;">후원 식당</a>
        </div>
        <div id="area_select">
			<div class="area" data-area="all"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=all&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }" >전체</a></div>        
            <div class="area" data-area="SEOUL"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=SEOUL&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }" >서울</a></div>
            <div class="area" data-area="INCHEON"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=INCHEON&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }" >인천</a></div>
            <div class="area" data-area="GYEONGGI"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=GYEONGGI&type=${requestScope.terms['type'] }&order=${requestScope.terms['order'] }">경기</a></div>
        </div>
        <div id="food_select">
            <div class="type" data-type="all"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=all&order=${requestScope.terms['order'] }">전체</a></div><div class="bar" style="margin-left: 0px;margin-right: -4px"></div>	
            <div class="type" data-type="KOR"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=KOR&order=${requestScope.terms['order'] }">한식</a></div><div class="bar" style="margin-left: 0px;margin-right: -4px"></div>
            <div class="type" data-type="SCH"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=SCH&order=${requestScope.terms['order'] }">분식</a></div><div class="bar" style="margin-left: 0px;margin-right: -4px"></div>
            <div class="type" data-type="WES"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=WES&order=${requestScope.terms['order'] }">양식</a></div><div class="bar" style="margin-left: 0px;margin-right: -4px"></div>
            <div class="type" data-type="CHI"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=CHI&order=${requestScope.terms['order'] }">중식</a></div><div class="bar" style="margin-left: 0px;margin-right: -4px"></div>
            <div class="type" data-type="JAP"><a href="/spRestaurant/spRestaurantList.do?currentPage=1&area=${requestScope.terms['area'] }&type=JAP&order=${requestScope.terms['order'] }">일식</a></div>
        </div>
        <div id="list_order">
            <form action="/spRestaurant/spRestaurantList.do" id="orderForm">
                <select name="order" id="order_select" style="border:none;">
                    <option value="desc">최신순</option>
                    <option value="best">예약많은순</option>
                    <option value="count">예약가능순</option>
                </select>
                	<input type="text" name="area" value="${requestScope.terms['area'] }"  hidden/>
                	<input type="text" name="type" value="${requestScope.terms['type'] }"  hidden/>
            </form>
        </div>
        
        <div id="list_select">
		<c:choose>
		  <c:when test="${!requestScope.map['list'].isEmpty() }">
		  <br />
            <ul>
              <c:forEach items="${requestScope.map['list'] }" var="list">
                <li class="item";">
                    
						<c:if test="${list.bizCount != 0 }">
	                        <div class="item_image">
	                        <a href="/spRestaurant/spRestaurantDetail.do?bizNo=${list.bizNo }" class="item_link">
	                        	<img src="${list.bizImage}" alt="" style="width:165px;height:165px;border-radius: 80px;" onerror="this.src='/resources/images/bizProfile.png'"/>
	                        </a>	
	                        </div>
	                        <div class="item_name">
	                        <a href="/spRestaurant/spRestaurantDetail.do?bizNo=${list.bizNo }" class="item_link" style="all:unset">
	                     		${list.bizName }
	                     	</a>	
	                        </div>
                        </c:if>
                        <c:if test="${list.bizCount == 0 }">
	                        <div class="item_image" style="position:relative;">
	                        <a href="/spRestaurant/spRestaurantDetail.do?bizNo=${list.bizNo }" class="item_link">
	                        	<img src="${list.bizImage}" alt="" class="closeSP" style="width:165px;height:165px;border-radius: 80px;" onerror="this.src='/resources/images/bizProfile.png'"/>
	                        	<!-- <div style="position:absolute;color:#fff;font-size:25px;background-color:black;opacity:0.5;top:0px;width:100%; height:100%;padding:60px 29px;border-radius: 80px;" >예약마감</div> -->
	                        	<div class="closeText"  >예약마감</div>
	                        </a>	
	                        </div>
	                        <div class="item_name">
	                        <a href="/spRestaurant/spRestaurantDetail.do?bizNo=${list.bizNo }" class="item_link" style="all:unset;">
	                     		${list.bizName }
	                     	</a>	
	                        </div>
	                        
                        </c:if>
                </li>
              </c:forEach> 
            </ul>
			<div id="page_wrap">
			    <ul class="page_ul">
			       ${requestScope.map['navi'] }
			    </ul>
			</div>            
          </c:when>
          <c:otherwise>
         	<div style="margin-top:20px;">
         		등록된 식당이 없습니다.
         	</div>
          </c:otherwise>    
        </c:choose>    
        </div>
    </div>
    
    <script>
    	$("#order_select").change(function(){
    			$("#orderForm").submit();
    	});
    	
    	$(function(){
    		const selectedArea = "${requestScope.terms['area'] }";
    		const selectedType = "${requestScope.terms['type'] }";
    		const selectedOrder = "${requestScope.terms['order'] }";
    		
    		$(".area").filter(function(index){    			
    			if($(this).attr("data-area")==selectedArea){
    				$(this).addClass("selected");
    				return;
    			}
    		});
    		
    		$(".type").filter(function(index){
    			if($(this).attr("data-type")==selectedType){
    				$(this).addClass("selected");
    				return;
    			}
    		});
    		$("#order_select").val(selectedOrder).prop("selected",true);
    		
    		
    	})
    </script>
    
	<!-- footer -->
	<%@include file="/WEB-INF/views/commons/footer/site-footer.jsp"%>    
</body>
</html>