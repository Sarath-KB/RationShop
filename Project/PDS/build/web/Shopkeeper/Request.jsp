<%-- 
    Document   : Request
    Created on : 10 May, 2021, 5:30:54 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Product</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <%
            if(request.getParameter("btnsub")!=null){
                String ins="insert into tbl_shoprequest(product_id,product_qty,shop_id)values('"+request.getParameter("selp")+"','"+request.getParameter("txtquan")+"','"+session.getAttribute("sid")+"')";
                if(con.executeCommand(ins)){
                    %>
                    <script>alert("Request Send SucessFully");</script>
                    <%
                }else{
                    out.println(ins);
                }
            }
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Product</td>
                        <td><select name="selp">
                                <option>--SELECT--</option>
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
                <td>Quantity</td>
                <td><input type="text" name="txtquan"></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Request"></td>
                </tr>
            </table>
        </form>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
