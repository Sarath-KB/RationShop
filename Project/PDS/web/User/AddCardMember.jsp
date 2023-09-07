<%-- 
    Document   : AddCardMember
    Created on : 25 May, 2021, 2:30:44 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Member Request</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%
            if(request.getParameter("delid")!=null){
                String del="delete from tbl_addrequest where req_id='"+request.getParameter("delid")+"'";
                if(con.executeCommand(del)){
                    %>
                    <script>alert("Data Deletd");</script>
                    <%
                }else{
                    out.println(del);
                }
            }
        %>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
        <form method="post" enctype="multipart/form-data" action="../ActionPages/AddRequestUpload.jsp">
            <table align="center" border="1" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Card Number</td>
                <td><input type="text" name="txtno" required></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="radio" name="re" value="Add">Add<input type="radio" name="re" value="Remove">Remove</td>
                </tr>
                <tr>
                <td>Name</td>
                <td><input type="text" name="txtname" required></td>
                </tr>
                <tr>
                <td>Proof</td>
                <td><input type="file" name="txtproof" required></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Request"></td>
                </tr>
            </table>
            <hr>
            <br>
            <table border="1" align="center" cellpadding="10">
                <tr>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Proof</th>
                <th>Status</th>
                <th>Action</th>
                </tr>
                <%
                    String sel="select * from tbl_addrequest where user_id='"+session.getAttribute("uid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    int i=0;
                    while(rs.next()){
                        %>
                        <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("req_name")%></td>
                        <td><img src="../Assets/RPhoto/<%=rs.getString("req_proof")%>" width="150" height="150"></td>
                        <td><%if(rs.getString("req_status").equals("1")){out.println("Accepted");}else if(rs.getString("req_status").equals("2")){out.println("Rejected");}else{out.println("Pending");}%></td>
                        <td><a href="AddCardMember.jsp?delid=<%=rs.getString("req_id")%>">Delete</a></td>
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
