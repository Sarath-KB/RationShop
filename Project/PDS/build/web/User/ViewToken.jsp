<%-- 
    Document   : ViewToken
    Created on : 25 May, 2021, 10:29:53 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Token Details</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
        <%
            if(request.getParameter("delid")!=null){
                String del="delete from tbl_assignslot where assignslot_id='"+request.getParameter("delid")+"'";
                if(con.executeCommand(del)){
                    %>
                    <script>alert("Your Booking Canceled");</script>
                    <%
                }else{
                    out.println(del);
                }
            }
        %>
        <form method="post">
            <table align="center" border="1" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <th>Sl.No</th>
                <th>Slot Time</th>
                <th>Shop Name</th>
                <th>Slot Date</th>
                <th>Action</th>
                </tr>
                <%
                    String sel="select * from tbl_assignslot a inner join tbl_slot s on s.slot_id=a.slot_id inner join tbl_shop sp on sp.shop_id=a.shop_id where a.user_id='"+session.getAttribute("uid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("slot_from")%></td>
                        <td><%=rs.getString("shop_name")%></td>
                        <td><%=rs.getString("slot_date")%></td>
                        <td><a href="ViewToken.jsp?delid=<%=rs.getString("assignslot_id")%>">Cancel Booking</a></td>
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
