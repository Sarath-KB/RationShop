<%-- 
    Document   : editprofile
    Created on : 1 Apr, 2021, 12:35:29 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="Links.jsp" %>
    </head>
      <br>
    <br>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
                <%
if(request.getParameter("btnsubmit")!=null){
        String upq="update tbl_user set user_name='"+request.getParameter("txtname")+"',user_contact='"+request.getParameter("txtcon")+"',user_email='"+request.getParameter("txtem")+"',user_address='"+request.getParameter("txtadd")+"'where user_id='"+ session.getAttribute("uid")+"'";
        if(con.executeCommand(upq)){
            out.println("update");
        }else{
            out.println("failed");
        }
}
%>
 <form method="post" >
            <table border="2" align="center" cellpadding="10" style="border-collapse: collapse;">
                     <%
                    String sel="select * from tbl_user where user_id='"+ session.getAttribute("uid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    if (rs.next()){
                        %>
                  
                     
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="txtname" value="<%=rs.getString("user_name")%>"></td>
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
                <td><input type="text" name="txtta" value="<%=rs.getString("user_address")%>"></td>
                </tr>
                
                
                  <%
                        }
                   %>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="update"><input type="reset" name="btnreset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
