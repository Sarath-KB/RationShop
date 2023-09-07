<%-- 
    Document   : Ajaxcategory
    Created on : 25 Jan, 2020, 7:03:56 PM
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
   <option>------select-------</option>
                            <%
                                String sel="select *from tbl_category";
             ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {

                %>
                             <option value="<%=rs.getString("category_id") %>"><%=rs.getString("category_name") %></option>
                             <%
            }
            %>
    </body>
</html>
