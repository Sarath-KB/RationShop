<%-- 
    Document   : TalukOfficer
    Created on : 9 May, 2021, 10:04:45 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Taluk Supply Officer</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <form method="post" enctype="multipart/form-data" action="../ActionPages/OfficerUploadAction.jsp">
            <table align="center" cellpadding="10" border="1" style="border-collapse: collapse;">
                <tr>
                <td>Name</td>
                <td><input type="text" name="txtname" required="" pattern="([A-Za-z/s]{1,50})"></td>
                </tr>
                <tr>
                <td>Contact</td>
                <td><input type="text" name="txtcontact" required="" pattern="([0-9]{10,10})"></td>
                </tr>
                <tr>
                <td>Email</td>
                <td><input type="email" name="txtmail" required=""></td>
                </tr>
                <tr>
                <td>Place</td>
                        <td><select name="selplace" required="">
                                <option>--SELECT--</option>
                                <%
                                    String seld="select * from tbl_place where district_id='"+session.getAttribute("did")+"'";
                                    ResultSet rs=con.selectCommand(seld);
                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
                                        <%
                                    }
                                %>
                    </select></td>
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
                <td>Username</td>
                <td><input type="text" name="txtuser" required=""></td>
                </tr>
                <tr>
                <td>PassWord</td>
                <td><input type="password" name="pass" required=""></td>
                </tr>
                <tr>
                <td>RePassWord</td>
                <td><input type="password" name="pass" required=""></td>
                </tr>
                <tr>
               
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Register"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
