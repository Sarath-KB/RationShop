<%-- 
    Document   : Ajaxpovertytype.jsp
    Created on : 29 Jan, 2020, 7:50:03 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</titl
    <body>
      <option>------Select-------</option>
                            <%
                                String sel4="select *from tbl_povertytype";
             ResultSet rs4=con.selectCommand(sel4);
            while(rs4.next())
            {
                             %>
                             <option value="<%=rs4.getString("povertytype_id") %>"><%=rs4.getString("povertytype_name") %></option>
                             <%
            }
            %>
    </body>
</html>
