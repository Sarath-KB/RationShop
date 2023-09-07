<%-- 
    Document   : Ajaxplace
    Created on : 24 Jan, 2020, 11:52:02 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
    <option>-----Select-----  </option>
        <%
                                String sel1="select *from tbl_place where district_id='"+request.getParameter("did")+"'";
             ResultSet rs1=con.selectCommand(sel1);
            while(rs1.next())
            {
                             %>
                             <option value="<%=rs1.getString("place_id") %>"><%=rs1.getString("place_name") %></option>
                             <%
            }
            %>
    </body>
</html>
