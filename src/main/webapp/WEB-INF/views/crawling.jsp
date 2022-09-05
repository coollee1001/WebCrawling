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
	<table style="float:left; width:${100/fn:length(week_index)}%; font-size:60%">
		<tr>
			<th>요일</th>
			<th>제목</th>
		</tr>
		
		<c:forEach items="${map}" var="map">
			<c:if test="${map.week eq obj}">
				<tr>
					<td>${map.week}</td>
					<td><a href="${map.link}" target="_blank">${map.title}</a></td>
				</tr>
			</c:if>
		</c:forEach>	
	</table>
	</c:forEach>

</body>
</html>