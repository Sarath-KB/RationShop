<%-- 
    Document   : UpdateCard
    Created on : 9 May, 2021, 1:33:16 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Card Deatils</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br> <br><br><br>
        <%
            if(request.getParameter("btnsub")!=null){
                String up="update tbl_user set user_cardno='"+request.getParameter("txtcard")+"',povertytype_id='"+request.getParameter("selpov")+"' where user_id='"+session.getAttribute("uid")+"'";
                if(con.executeCommand(up)){
                    %>
                    <script>alert("updated");</script>
                    <%
                }else{
                    out.println(up);
                }
            }
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Card Number</td>
                <td><input type="text" name="txtcard"></td>
                </tr>
                <tr>
                <td>Card Type</td>
                        <td><select name="selpov">
                                <option>--SELECT--</option>
                                <%
                                    String selp="select * from tbl_povertytype";
                                    ResultSet rs=con.selectCommand(selp);
                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("povertytype_id")%>"><%=rs.getString("povertytype_name") %></option>
                                        <%
                                    }
                                %>
                    </select></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Update"></td>
                </tr>
            </table>
        </form>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
