<%-- 
    Document   : Homepage.jsp
    Created on : 28 Jan, 2020, 8:57:41 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%
        String name=session.getAttribute("uname").toString();
       
        %>
        <center><h2>Welcome<%=name %></h2></center>
       
   


                
        
    </body>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
