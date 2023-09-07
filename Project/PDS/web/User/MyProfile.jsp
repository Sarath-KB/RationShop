<%-- 
    Document   : myprofile
    Created on : 1 Apr, 2021, 12:35:09 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <%@include file="Links.jsp" %>
    </head>
      <br>
    <br>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
        <form name="frmCal">
            <table border="2"  align="center" cellpadding="10" style="border-collapse: collapse;">
                <%
                    String sel="select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    if(rs.next()){
                        %>
                        <%
                        
                   %>
                   
                <tr>
                    <td>User Name</td>
                    <td><img src="../User/Photo/<%=rs.getString("user_photo")%>"></td>
                </tr>
                <tr>
                    <td>User Contact</td>
                    <td><input type="text" name="txtcon" value="<%=rs.getString("user_contact")%>"></td>
                </tr>
                <tr>
                   <td>User Email</td>
                   <td><input type="text" name="txtem" value="<%=rs.getString("user_email")%>"></td>
                </tr>
                <tr>
                <td>User Address</td>
                <td><textarea name="txtta"><%=rs.getString("user_address")%></textarea></td>
                </tr>
                
                
                
                  <%
                        }
                   %>
               
            </table>
        </form>
    </body>
   <br><br><br><br><br><br>
   <%@include file="Footer.jsp" %>
</html>
