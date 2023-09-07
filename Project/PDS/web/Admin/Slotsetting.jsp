<%-- 
    Document   : Slotsetting
    Created on : 16 May, 2021, 10:13:49 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slot settings </title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
        <% 
            if(request.getParameter("btnsub")!=null){
                String ins="insert into tbl_slot(slot_from)values('"+request.getParameter("txts")+"')";
                if(con.executeCommand(ins)){
                    %>
                    <script>alert("Slot Added");</script>
                    <%
                }else{
                    out.println(ins);
                }
            }
        %>
        <form method="post">
            <table border="1" cellpadding="10" align="center" style="border-collapse: collapse;">
                
                <tr>
                <td>Slot Start Time</td>
                <td><input type="time" name="txts"></td>
                </tr>
               
                
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Add Slot"></td>
                </tr>
            </table>
        </form>
    </body>
    <br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
