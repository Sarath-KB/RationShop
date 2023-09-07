<%-- 
    Document   : complainttype
    Created on : 10 Apr, 2021, 10:09:14 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Links.jsp" %>
    </head>
    <br>
    <br>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br>
        <%
            String cid=request.getParameter("id");
          if (request.getParameter("btnsubmit") != null) {
               
             String upq = "update tbl_complaint set complaint_reply='" + request.getParameter("txtcr") + "' , complaint_status='1' where complaint_id ='" +session.getAttribute("cid")+ "'";
                 
             if (con.executeCommand(upq)) {
                     
                        %>
                        <script>alert("Updated");</script>
                        <%

                    } else {
                        out.println("failed");
                    }
                }
                    %>
     <form method="post">
            
            <table border="2" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>Complaint Reply</td>
                    <td><textarea name="txtcr" required=""></textarea></td>

                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="submit"><input type="reset" name="btnreset" value="cancel">
                    </td>
                </tr>

            </table>
     </form>
    </body>
    <br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
