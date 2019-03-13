<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<head>
<title>User Regd</title>
</head>

<body bgcolor="gray">

 
 
 <%!
 Statement stmtSave;
 String  vendno,vendname,contactper,locality,city,state,phoneno,fax,date,gstno,ccode,emailid,website; 
 Connection conn;
 public void doConnect()
    {
      try
      {
        Class.forName("sun.jdbc.odbc.JdbcodbcDriver");
      }
      catch(ClassNotFoundException e)
      {
        System.out.println("A error"+e);
      }
      try
      {
        conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","root");
      }
      catch(SQLException e)
      {
        System.out.println("B error");
      }
    }
%>

<%
vendno=request.getParameter("numvendno");
 vendname=request.getParameter("txtvendname");
 contactper=request.getParameter("txtcontper");
 locality=request.getParameter("txtlocality");
 city=request.getParameter("txtcity");
 state=request.getParameter("txtstate");
 ccode=request.getParameter("countrycode");
 phoneno=request.getParameter("numphno");
 fax=request.getParameter("numfax");
date=request.getParameter("date");
 gstno=request.getParameter("numgst");
 emailid=request.getParameter("email");
 website=request.getParameter("urlvend");
 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("insert into tblvendorinfo values('"+vendno+"','"+vendname+"','"+contactper+"','"+locality+"','"+city+"','"+state+"','"+ccode+"','"+phoneno+"','"+fax+"','"+gstno+"','"+emailid+"','"+website+"','"+date+"')");
   %>
   
  <center>
    <h1 style="margin:150px; background-color:yellow">Data Added Successfully</h1>
  </center>

   <%
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }
%>

</body>
</html>