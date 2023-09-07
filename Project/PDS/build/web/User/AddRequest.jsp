<%-- 
    Document   : AddRequest
    Created on : 9 May, 2021, 3:42:04 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Members</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        
        <%
            if(request.getParameter("crid")!=null){
                session.setAttribute("crid", request.getParameter("crid"));
            }
        %>
        <form method="post" enctype="multipart/form-data" action="../ActionPages/RequestMemberUpload.jsp">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Name</td>
                <td><input type="text" name="txtname" required="" pattern="([A-Za-z/s]{1,15})"></td>
                </tr>
                <tr>
                <td>Photo</td>
                <td><input type="file" name="photo" required=""></td>
                </tr>
                <tr>
                <td>Proof</td>
                <td><input type="file" name="proof" required=""></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Add"></td>
                </tr>
            </table>
        </form>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
