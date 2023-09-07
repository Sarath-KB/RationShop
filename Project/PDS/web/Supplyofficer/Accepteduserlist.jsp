<%-- 
    Document   : Accepteduserlist
    Created on : 29 Jan, 2020, 8:41:27 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accepted User List</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
         <%
              String name="",address="",contact="",email="",cardno="";
            if(request.getParameter("rejectid")!=null)
            {
                String upd="update tbl_user set user_status='1' where  user_id='"+request.getParameter("rejectid")+"'";
                con.executeCommand(upd);
            }
            %>
        <form method="post">
            <table border="2" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <th>Sl.no</th> 
                <th>Name</th> 
                <th>Address</th> 
                <th>Contact</th> 
                <th>Email</th> 
              
                <th>Proof</th> 
               
                
                <th>Location</th>
                <th>Action</th> 
                
                <%
                   
                    int i=1;
                 String sel="select * from tbl_user u inner join tbl_location l on l.location_id=u.location_id inner join tbl_place p on p.place_id=l.place_id  where u.user_status=2 and p.place_id='"+session.getAttribute("pid")+"'";
        ResultSet rs=con.selectCommand(sel);
        while(rs.next())
        {
              %>
                <tr>
                <td><%=i %></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("user_address")%></td>
                <td><%=rs.getString("user_contact")%></td>
                <td><%=rs.getString("user_email")%></td>
               
                <td><img src="../User/Proof/<%= rs.getString("user_proof") %>" height="100" width="100" ></td>
                
              
                <td><%=rs.getString("location_name")%></td>
                
                <td><a href="Accepteduserlist.jsp?rejectid=<%=rs.getString("user_id")%>">Reject</td>
                </tr>
                    
                    
                <%
               i++;
        }
        %>
            </table>
        </form>
            
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>