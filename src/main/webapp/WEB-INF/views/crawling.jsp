<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<html>
<head>
	<title>크롤링</title>
</head>
<body>
	<c:forEach items="${week_index}" var="obj" varStatus="status">
	<table>
		<tr>
			<th class="weekend">요일</th>
			<th>제목</th>
		</tr>
		<c:forEach items="${map}" var="map">
			<c:if test="${map.week eq obj}">
				<tr>
					<td>${fn:substring(map.week, 0, fn:indexOf(map.week,'웹툰'))}<br>웹툰</td>
					<td><a href="${map.link}" target="_blank"><img src="${map.imagesrc}" alt="${map.title}"></a><br>
					<label>${map.title}</label></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	</c:forEach>
</body>
</html>
<style>
	table {
		float:left;
		width:${100/fn:length(week_index)-0.2}%;
		font-size::${100-(100/fn:length(week_index))}%;
		border-top:1px solid #444444;
		border-collapse:collaspe;
	}
	.weekend{
		width:${100/(fn:length(week_index)-1)*2.5}%;
	}
	th {
		border-bottom:1px solid #444444;
		padding:10px;
	}
	td {
		padding:7px;
	}
</style>