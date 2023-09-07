<%-- 
    Document   : ViewNew
    Created on : 9 May, 2021, 8:07:25 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Card Requests</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <%
            if(request.getParameter("acid")!=null){
                String up="update tbl_cardrequest set cardrequest_status=1 where cardrequest_id='"+request.getParameter("acid")+"'";
                if(con.executeCommand(up)){
                    %>
                    <script>alert("Updated Status");</script>
                    <%
                }else{
                    out.println(up);
                }
            }
            if(request.getParameter("reid")!=null){
                String up="update tbl_cardrequest set cardrequest_status=2 where cardrequest_id='"+request.getParameter("reid")+"'";
                if(con.executeCommand(up)){
                    %>
                    <script>alert("Updated Status");</script>
                    <%
                }else{
                    out.println(up);
                }
            }
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <th>Sl.No</th>
                <th>Name Of Applicant</th>
                <th>Photo</th>
                <th>Proof</th>
                <th>Action</th>
                </tr>
                <%
                    String sel="select * from tbl_cardrequest cr inner join tbl_user u on u.user_id=cr.user_id inner join tbl_location l on l.location_id=u.location_id inner join tbl_place p on p.place_id=l.place_id where p.place_id='"+session.getAttribute("pid")+"' and cr.cardrequest_status=0";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        i++;
                        %>
                        <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("user_name")%></td>
                        <td><img src="../Assets/RPhoto/<%=rs.getString("cardrequest_photo")%>"></td>
                        <td><img src="../Assets/RProof/<%=rs.getString("cardrequest_proof")%>"></td>
                        <td><a href="ViewNew.jsp?acid=<%=rs.getString("cardrequest_id")%>">Accept</a>/<a href="ViewNew.jsp?reid=<%=rs.getString("cardrequest_id")%>">Reject</a></td>
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
