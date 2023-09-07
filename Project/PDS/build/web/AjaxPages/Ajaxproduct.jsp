<%-- 
    Document   : Ajaxproduct.jsp
    Created on : 28 Feb, 2020, 10:38:24 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <option>------Select-------</option>
                            <%
                                String sel3="select *from tbl_povertytype";
             ResultSet rs3=con.selectCommand(sel3);
            while(rs3.next())
            {
                             %>
                             <option value="<%=rs3.getString("povertytype_id") %>"><%=rs3.getString("povertytype_name") %></option>
                             <%
            }
            %>
    </body>
</html>
