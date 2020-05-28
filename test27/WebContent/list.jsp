<%@page import="jdk.management.resource.internal.TotalResourceContext"%>
<%@page import="test27.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="test27.BoardDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int pageRecords = 2;
	String numPage = request.getParameter("pageNum");
	if(numPage==null){
		numPage = "1";
	}
	int nowPage = Integer.parseInt(numPage);
	int startRow = (nowPage-1)*pageRecords+1;
	int endRow = pageRecords;
	Vector<BoardBean> vlist = null;
	
	int totalPage = 0;
	totalPage = dao.totalRecord();
%>
<center><h2>게시판</h2></center>
<div align="center">
<table width="70%">
<tr>
<td width="20%">번 호</td>
<td width="20%">제 목</td>
<td width="20%">작성자</td>
<td width="20%">날 짜</td>
<td width="20%">조회수</td>
</tr>
<%
	vlist = dao.BoardList(startRow, endRow);

	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<vlist.size();i++){
			BoardBean bean = vlist.get(i);
		%>
		
		<tr>
		<td><%=bean.getNum() %></td>
		<td><a href="read.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject() %></a></td>
		<td><%=bean.getName() %></td>
		<td><%=bean.getRegdate() %></td>
		<td><%=bean.getCount() %></td>
		</tr>
		
		<%}
	}
%>
<tr>
<td><input type="button" value="글쓰기" onclick="location.href='post.jsp'"></td>
</tr>
</table>
</div>
<div align="center">
<p>
<%
	if(totalPage>0){
		int block = 3;
		int pageCount = totalPage/pageRecords+((totalPage%pageRecords==0) ? 0 : 1);
		int startPage = ((nowPage-1)/10)*10+1;
		int endPage = startPage+block-1;
		
		if(endPage>pageCount) endPage = pageCount;
		
		for(int i=startPage;i<=endPage;i++){
		
		if(startPage>block){
			%>
			<a href="list.jsp?pageNum=<%=startPage-3%>">[이전]</a>
		<%} %>
		
		<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		
		<%}
		if(endPage<pageCount){
			%>
			<a href="list.jsp?pageNum=<%=startPage+3%>">[다음]</a>
	<%		
		}
		%><%=pageCount %>
	<%}

%>
</p>
</div>
</body>
</html>