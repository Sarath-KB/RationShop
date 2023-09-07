<%-- 
    Document   : ViewBooked
    Created on : 26 May, 2021, 9:28:21 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slots Booked</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <th>Sl.No</th>
                <th>Slot Time</th>
                <th>Name</th>
                <th>Booked Date</th>
                </tr>
                <%
                    String sel="select * from tbl_assignslot a oinner join tbl_slot s on s.slot_id=a.slot_id inner join tbl_user u on u.user_id=a.user_id where shop_id='"+session.getAttribute("sid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                        <td<%=i%>></td>
                        <td><%=rs.getString("slot_from")%></td>
                        <td><%=rs.getString("user_name")%></td>
                        <td><%=rs.getString("slot_date")%></td>
                        </tr>
                        <%
                    }
                %>
            </table>
        </form>
    </body>
    <br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
