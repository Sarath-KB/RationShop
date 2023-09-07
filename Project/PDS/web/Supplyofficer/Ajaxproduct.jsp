<%-- 
    Document   : Ajaxsubcategory
    Created on : 25 Jan, 2020, 7:09:33 PM
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
        <option>------Select-------</option>
                            <%
                                
                                String sel3="select *from tbl_product where subcategory_id='"+request.getParameter("sid")+"'";
                                  
             ResultSet rs3=con.selectCommand(sel3);
            while(rs3.next())
            {
                             %>
                             <option value="<%=rs3.getString("product_id") %>"><%=rs3.getString("product_name") %></option>
                             <%
            }
            %>
    </body>
</html>
