<%-- 
    Document   : MonthlyQuota
    Created on : 21 May, 2021, 3:55:04 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monthly Data</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
         <br><br><br><br><br><br><br><br><br>
        <%
            if(request.getParameter("btnsub")!=null){
                String ins="insert into tbl_quota(product_id,povertytype_id,product_qty)values('"+request.getParameter("selp")+"','"+request.getParameter("selc")+"','"+request.getParameter("txtq")+"')";
                if(con.executeCommand(ins)){
                    %>
                    <script>alert("Data Inserted");</script>
                    <%
                }else{
                    out.println(ins);
                }
            }
            if(request.getParameter("delid")!=null){
                String del="select * from tbl_quota where quota_id='"+request.getParameter("delid")+"'";
                if(con.executeCommand(del)){
                    %>
                    <script>alert("Data Deleted");</script>
                    <%
                }else{
                    out.println(del);
                }
            }
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse:collapse;">
                <tr>
                <td>Product</td>
                        <td><select name="selp" required>
                                <option>---SELECT---</option>
                                <%
                                    String sel="select * from tbl_product";
                                    ResultSet rs=con.selectCommand(sel);
                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("product_id")%>"><%=rs.getString("product_name")%></option>
                                        <%
                                    }
                                %>
                    </select></td>
                </tr>
                <tr>
                <td>Card Type</td>
                        <td><select name="selc" required>
                                <option>---SELECT---</option>
                                <%
                                    String selcr="select * from tbl_povertytype";
                                    ResultSet rs1=con.selectCommand(selcr);
                                    while(rs1.next()){
                                        %>
                                        <option value="<%=rs1.getString("povertytype_id")%>"><%=rs1.getString("povertytype_name")%></option>
                                        <%
                                    }
                                %>
                    </select></td>
                </tr>
                <tr>
                <td>Quantity</td>
                <td><input type="text" name="txtq" required></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Add"></td>
                </tr>
            </table>
                    <hr>
                    <br>
                    <table border="1" cellpadding="10" align="center">
                        <tr>
                        <th>Sl.No</th>
                        <th>Product Name</th>
                        <th>Card Type</th>
                        <th>Product Qty</th>
                        <th>Action</th>
                        </tr>
                        <%
                                    String sele="select * from tbl_quota q inner join tbl_product p on p.product_id=q.product_id inner join tbl_povertytype pt on pt.povertytype_id=q.povertytype_id";
                                    ResultSet rs2=con.selectCommand(sele);
                                    int i=0;
                                    while(rs2.next()){
                                        i++;
                                        %>
                                        <tr>
                                        <td><%=i%></td>
                                        <td><%=rs2.getString("product_name")%></td>
                                        <td><%=rs2.getString("povertytype_name")%></td>
                                        <td><%=rs2.getString("product_qty")%></td>
                                        <td><a href="MonthlyQuota.jsp?delid=<%=rs2.getString("quota_id")%>">Delete</a></td>
                                        </tr>
                                        <%
                                    }
                        %>
                    </table>
        </form>
    </body>
     <br><br><br><br><br><br><br><br><br>
     <%@include file="Footer.jsp" %>
</html>
