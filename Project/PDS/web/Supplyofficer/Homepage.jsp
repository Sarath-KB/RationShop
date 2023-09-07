<%-- 
    Document   : Homepage
    Created on : 8 May, 2021, 11:52:25 AM
    Author     : White_Devil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Officer Home</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <center><h1>Hello <%=session.getAttribute("username")%></h1></center>
       
    </body>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
