<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<html>
<head>
	<title>크롤링</title>
	<style>
		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
	</style>
</head>
<body>	
	<div class="list_area">
	<c:forEach items="${week_index}" var="obj" varStatus="status">
	<div class="col">
		<h4 class="weekend">${obj}</h4>
		<ul class="image_list">
			<c:forEach items="${map}" var="map">
			<c:if test="${map.week eq obj}">
			<li>
				<a href="${map.link}" target="_blank"><img src	="${map.imagesrc}" alt="${map.title}"></a>
				<dl><dt>
					<c:choose>
						<c:when test="${fn:length(map.title)>10}">
							<a href="${map.link}" title="${map.title}">${fn:substring(map.title, 0, 8)}...</a>
						</c:when>
						<c:otherwise>
							<a href="${map.link}" title="${map.title}">${map.title}</a>
						</c:otherwise>
					</c:choose>
				</dt></dl>
			</li>
			</c:if>
		</c:forEach>
		</ul>			
	</div>
	</c:forEach>
	</div>
</body>
</html>
<style>
	* {
		font-family:Pretendard-Regular;
	}
	.list_area {
		width:1000x;
	    overflow: hidden;
	    margin-top: -1px;
	    border-bottom: 1px solid #e6e6e6;
	}
	ul, li{
		list-style: none;
		margin:0px; 
		padding:0px;
	}
	li {
		padding-top:5px; 
	}
	.col {
		float: left;
	    width: 100px;
	    margin-right: -1px;
	    border-top: 1px solid #b6b6b6;
	    text-align:center;
	}
	.col ul li dl dt{
		font-size:12px;
	}
	.image_list li dl{
	    margin-top: 6px;
	}
	
	dl dt a:link, a:visited, a:hover, a:active{
		text-decoration-line:none; 
		color:black;
	}
	
</style>