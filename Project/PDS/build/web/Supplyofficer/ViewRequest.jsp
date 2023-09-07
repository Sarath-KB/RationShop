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
                String up="update tbl_shoprequest set shoprequest_status=1";
                if(con.executeCommand(up)){
                    String selp="select * from talukstock ts inner join tbl_talukproduct tp on tp.talukproduct_id=ts.talukproduct_id where tp.product_id='"+request.getParameter("txthidden")+"'";
                    ResultSet rs1=con.selectCommand(selp);
                    if(rs1.next()){
                        current=Integer.parseInt(rs1.getString("talukstock_number"));
                    }
                    balance=current-Integer.parseInt(request.getParameter("txthidden1"));
                    String ups="update talukstock ts inner join tbl_talukproduct tp on tp.talukproduct_id=ts.talukproduct_id  set talukstock_number='"+balance+"' where tp.product_id='"+request.getParameter("txthidden")+"' ";
                    con.executeCommand(ups);
                }
            }
            if(request.getParameter("acceptid")!=null){
                String upd="update tbl_addrequest set req_status=1 where req_id='"+request.getParameter("acceptid")+"'";
                if(con.executeCommand(upd)){
                    %>
                    <script>alert("Request Status Updated");</script>
                    <%
                }else{
                    out.println(upd);
                }
            }
            if(request.getParameter("rejectid")!=null){
                String upd="update tbl_addrequest set req_status=2 where req_id='"+request.getParameter("rejectid")+"'";
                if(con.executeCommand(upd)){
                    %>
                    <script>alert("Request Status Updated");</script>
                    <%
                }else{
                    out.println(upd);
                }
            }
            
        %>
        <center><h1>Request From Shop Product</h1></center>
        <table align="center" border="1" cellpadding="10" style="border-collapse: collapse;">
            <tr>
            <th>Sl.No</th>
            <th>Product Name</th>
            <th>Product Quantity</th>
            <th>Shop Name</th>
            <th>Action</th>
            </tr>
            <%
                String sel="select * from tbl_shoprequest sr inner join tbl_product p on p.product_id=sr.product_id  inner join tbl_shop s on s.shop_id=sr.shop_id inner join tbl_location l on l.location_id=s.location_id inner join tbl_place pl on pl.place_id=l.place_id where shoprequest_status=0 and pl.place_id='"+session.getAttribute("pid")+"'";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next()){
                    i++;
                    %>
                    <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("product_name")%></td>
                    <td><%=rs.getString("product_qty")%></td>
                    <td><%=rs.getString("shop_name")%></td>
                    <td><a href="ViewRequest.jsp?acid=<%=rs.getString("shoprequest_id")%>">Accept</a>/<a href="ViewRequest.jsp?reid=<%=rs.getString("shoprequest_id")%>">Reject</a></td>
                    </tr>
                    <input type="hidden" name="txthidden" value="<%=rs.getString("product_id")%>">
                     <input type="hidden" name="txthidden1" value="<%=rs.getString("product_qty")%>">
                    <%
                }
            %>
        </table>
        <hr>
        <br>
        <center><h1>Request From User To Add or Remove Member From RationCard..</h1></center>
        <table align="center" border="1" cellpadding="10">
            <tr>
            <th>Sl.No</th>
            <th>Card Number</th>    
            <th>Name</th>
            <th>Proof</th>
            <th>Action</th>
            </tr>
            <%
                String selrr="select * from tbl_addrequest ar inner join tbl_user u on ar.user_id=u.user_id inner join tbl_location l on l.location_id=u.location_id inner join tbl_place p on p.place_id=l.place_id where p.place_id='"+session.getAttribute("pid")+"'";
                ResultSet rsrr=con.selectCommand(selrr);
                int j=0;
                while(rsrr.next()){
                    j++;
                    %>
                    <tr>
                    <td><%=j%></td>
                    <td><%=rsrr.getString("card_number")%></td>
                    <td><%=rsrr.getString("req_name")%></td>
                    <td><img src="../Assets/RPhoto/<%=rsrr.getString("req_proof")%>"></td>
                    <td><a href="ViewRequest.jsp?acceptid=<%=rsrr.getString("req_id")%>">Accept</a>/<a href="ViewRequest.jsp?rejectid=<%=rsrr.getString("req_id")%>">Reject</a></td>
                    </tr>
                    <%
                }
            %>
        </table>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
