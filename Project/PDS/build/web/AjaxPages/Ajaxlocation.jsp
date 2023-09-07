<%-- 
    Document   : Ajaxlocation.jsp
    Created on : 24 Jan, 2020, 3:05:59 PM
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
    <option>-----Select------</option>
                  <%
                                String sel0="select * from tbl_location where place_id='"+request.getParameter("pid")+"'";
             ResultSet rs0=con.selectCommand(sel0);
            while(rs0.next())
            {
                             %>
                              <option value="<%=rs0.getString("location_id") %>"><%=rs0.getString("location_name") %></option>

                             <%
            }
            %>
           

    </body>
</html>
