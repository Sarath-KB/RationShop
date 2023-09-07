<%-- 
    Document   : changepassword
    Created on : 1 Apr, 2021, 12:35:43 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <%@include file="Links.jsp" %>
   
    </head>
      <br>
    <br>
    <body>
        <%@include file="Header.jsp" %>
       
        <br><br><br><br><br>
               <%
          if(request.getParameter("btnsubmit")!=null){
              String sel="select * from tbl_user where user_id='"+session.getAttribute("uid") +"'and user_password='"+request.getParameter("upass")+"'";
              ResultSet rs=con.selectCommand(sel);
              if(rs.next()){
                  if(request.getParameter("newpass").equals(request.getParameter("txtucp"))){
                  String upq="update tbl_user set user_password='"+request.getParameter("newpass")+"' where user_id='"+session.getAttribute("uid") +"'";
                  if(con.executeCommand(upq)){
                      out.println("updated");
                  }else{
                       out.println("failed");
                  }
                      
              }else{
                      %>
                      <script>alert("Pasword Mismatch...");</script>
                      <%
                  }
          }else{
                  %>
                  <script>alert("Invalid Current Password");</script>
                  <%
              }
          }
       %>
       <form method="post">
            <table border="2" align="center" cellpadding="10" style="border-collapse: collapse;">
                 <tr>
                    <td>Current Password</td>
                    <td><input type="text" name="upass" required=""></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="text" name="newpass" required=""></td>
                </tr>
                <tr>
                   <td>Confirm Pass</td>
                   <td><input type="text" name="txtucp" required=""></td>
                </tr>
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
