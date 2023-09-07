<%-- 
    Document   : ViewRequest
    Created on : 10 May, 2021, 5:46:46 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Request</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <%
            int current=0,balance=0;
            if(request.getParameter("acid")!=null){
                String up="update tbl_talukrequest set talukrequest_status=1";
                if(con.executeCommand(up)){
                    String selp="select * from districtstock ts inner join tbl_districtproduct tp on tp.districtproduct_id=ts.districtproduct_id where tp.product_id='"+request.getParameter("txthidden")+"'";
                    ResultSet rs1=con.selectCommand(selp);
                    if(rs1.next()){
                        current=Integer.parseInt(rs1.getString("districtstock_number"));
                    }
                    balance=current-Integer.parseInt(request.getParameter("txthidden1"));
                    String ups="update districtstock ts inner join tbl_districtproduct tp on tp.districtproduct_id=ts.districtproduct_id  set districtstock_number='"+balance+"' where tp.product_id='"+request.getParameter("txthidden")+"' ";
                    con.executeCommand(ups);
                }
            }
        %>
        <table align="center" border="1" cellpadding="10" style="border-collapse: collapse;">
            <tr>
            <th>Sl.No</th>
            <th>Product Name</th>
            <th>Product Quantity</th>
            
            <th>Action</th>
            </tr>
            <%
                String sel="select * from tbl_talukrequest sr inner join tbl_product p on p.product_id=sr.product_id  inner join tbl_talukofficer s on s.talukofficer_id=sr.taluk_id inner join tbl_place l on l.place_id=s.place_id inner join tbl_district pl on pl.district_id=l.district_id where talukrequest_status=0 and pl.district_id='"+session.getAttribute("did")+"'";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next()){
                    i++;
                    %>
                    <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("product_name")%></td>
                    <td><%=rs.getString("product_qty")%></td>
                    <td><%=rs.getString("talukofficer_name")%></td>
                    <td><a href="ViewRequest.jsp?acid=<%=rs.getString("shoprequest_id")%>">Accept</a>/<a href="ViewRequest.jsp?reid=<%=rs.getString("shoprequest_id")%>">Reject</a></td>
                    </tr>
                    <input type="hidden" name="txthidden" value="<%=rs.getString("product_id")%>">
                     <input type="hidden" name="txthidden1" value="<%=rs.getString("product_qty")%>">
                    <%
                }
            %>
        </table>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
