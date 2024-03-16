<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Utill"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>

<script  type="text/javascript" src="check.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<section style = "position: fixed ;top : 60px ; width: 100% ; height : 100% ;
background-color: lightgray">
<h2 style= "text-align: center"><b> 홈쇼핑 회원 정보 수정 </b> </h2><br>

<form method="post" action="action.jsp" style="display:flex; align-items: center; justify-content:center; text-align: center">

<iniput type="hidden" name="mode" value = "insert">

<table border="1">

<%
Connection conn = null;
Statement stmt = null;
String mod_custno = request.getParameter("mod_custno");
String custname = "";
String phone = "";
String address="";
Date joindate;
String grade = "";
String city = "";
String joindateStr = "";




try{
	conn = Utill.getConnection(); //DB연결
	stmt = conn.createStatement(); //SQL 실행하기 위한 변수 생성
	String sql = "SELECT * FROM member_tbl_02 WHERE custno = " + mod_custno ;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next(); //1개의 결과물 출력
	mod_custno = rs.getString("custno");
	custname = rs.getString("custname");
	phone = rs.getString("phone");
	address = rs.getString("address");
	joindate =rs.getDate("joindate");
	grade = rs.getString("grade");
	city = rs.getString("city");
	
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd") ;
	joindateStr = transFormat.format(joindate);
}

catch(Exception e){
	e.printStackTrace();
}
%>

<tr>
	<td>회원번호</td>
	<td><input type="text" name="custno" value="<%=mod_custno %>"></td>
</tr>
<tr>
	<td>회원성명</td>
	<td><input type="text" name="custname" value="<%=custname %>"></td>
</tr>
<tr>
	<td>회원전화</td>
	<td><input type="text" name="phone" value="<%=phone %>"></td>
</tr>
<tr>
	<td>회원주소</td>
	<td><input type="text" name="address" value="<%=address %>" ></td>
</tr>
<tr>
	<td>가입일자</td>
	<td><input type="text" name="joindate" value="<%=joindateStr %>"></td>
</tr>
<tr>
	<td>고객등급[A:VIP,B:일반,C:직원]</td>
	<td><input type="text" name="grade" value="<%=grade %>"></td>
</tr>
<tr>
	<td>도시코드</td>
	<td><input type="text" name="city" value="<%=city %>"></td>
</tr>

<tr>
	<td colspan="2">
	<input type="submit" value="수정" onclick="return modify()">
	<input type="button" value="조회" onclick="return search()">
</tr>

</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>