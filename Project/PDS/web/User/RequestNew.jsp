<%-- 
    Document   : RequestNew
    Created on : 9 May, 2021, 3:07:08 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request New Card</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <h1>Hello You Can Register...Here..</h1>
        <form method="post" enctype="multipart/form-data" action="../ActionPages/CardRequestUpload.jsp">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Name</td>
                <td><input type="text" name="txtname"></td>
                </tr>
                <tr>
                <td>Address</td>
                <td><textarea name="txtaddr"></textarea></td>
                </tr>
                 <tr>
                <td>Annuel Income In Rupees</td>
                <td><input type="text" name="txtamount"></td>
                </tr>
                <tr>
                <td>No.Of Members</td>
                <td><input type="number" name="txtnumber"></td>
                </tr>
                <tr>
                <td>Photo</td>
                <td><input type="file" name="photo"></td>
                </tr>
                <tr>
                <td>Proof</td>
                <td><input type="file" name="proof"></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Request"></td>
                </tr>
                <%
                    String sel="select * from tbl_cardrequest where user_id='"+session.getAttribute("uid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    if(rs.next()){
                        %>
                        <tr>
                        <td colspan="2" align="center"><a href="AddRequest.jsp?crid=<%=rs.getString("cardrequest_id")%>">Add Members</a></td>
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
