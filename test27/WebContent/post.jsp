<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><h2>게시글 작성</h2></center>
<form method="post" action="post_Proc.jsp">
<div align="center">
<table>
<tr>
<td>제목</td>
<td><input name="subject"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input name="pw" type="password"></td>
</tr>
<tr>
<td>이름</td>
<td><input name="name"></td>
</tr>
<tr>
<td>이메일</td>
<td><input name="email" type="email"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="15" cols="60" name="content"></textarea></td>
</tr>
<tr>
<td><input type="submit" value="작성">
	<input type="button" value="취소" onclick="location.href='list.jsp'">
</td>

</table>
</div>
</form>
</body>
</html>