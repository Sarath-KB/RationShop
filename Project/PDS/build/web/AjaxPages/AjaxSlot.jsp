<%-- 
    Document   : AjaxSlot
    Created on : 16 May, 2021, 11:11:45 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<option>---SELECT---</option>
<%
    String sel="select * from tbl_slot where slot_date='"+request.getParameter("did")+"' and shop_id='"+session.getAttribute("spid") +"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next()){
        %>
        <option value="<%=rs.getString("slot_id")%>"><%=rs.getString("slot_from")%></option>
        <%
    }
    
%>
