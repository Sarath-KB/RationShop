<%-- 
    Document   : ViewRequest
    Created on : 10 May, 2021, 8:12:29 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Updates</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <%
            if(request.getParameter("delid")!=null){
                String del="delete from tbl_cardrequest where cardrequest_id='"+request.getParameter("delid")+"'";
                if(con.executeCommand(del)){
                    %>
                    <script>alert("Data Deleted");</script>
                    <%
                }else{
                    out.println(del);
                }
            }
        %>
        <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
            <tr>
            <th>Sl.No</th>
            <th>Request ID</th>
            <th>Status</th>
            <th>Action</th>
            </tr>
            <%
                String sel="select * from tbl_cardrequest where user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next()){
                    i++;
                    %>
                    <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("cardrequest_id")%></td>
                    <td><%if(rs.getString("cardrequest_status").equals("1")){out.println("Accepted");}else if(rs.getString("cardrequest_status").equals("2")){out.println("Rejected");}else{out.println("Pending");}%></td>
                    <td><a href="ViewRequest.jsp?delid=<%=rs.getString("cardrequest_id")%>">Delete</a></td>
                    </tr>
                    <%
                }
            %>
        </table>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
