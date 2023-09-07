<%-- 
    Document   : ViewQuota
    Created on : 22 May, 2021, 11:14:01 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User Quota</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
         <br><br><br><br><br><br><br><br><br>
        <%
            int no=0;
            String ctype="";
            String sel="select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
//            out.println(sel);
            ResultSet rs=con.selectCommand(sel);
            if(rs.next()){
                ctype=rs.getString("povertytype_id");
//                out.println(ctype);
                no=Integer.parseInt(rs.getString("user_nomember"));
//                out.println(no);
            }
            if(request.getParameter("btnsub")!=null){
                session.setAttribute("qid", request.getParameter("txthidden"));
                response.sendRedirect("Viewshop.jsp");
            }
        %>
        <div id="tab">
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <th>Sl.No</th>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Product Quantity</th>
                </tr>
                <%
            String selq="select * from tbl_quota q inner join tbl_product p on p.product_id=q.product_id  where q.povertytype_id='"+ctype+"'";
            ResultSet rs1=con.selectCommand(selq);
//            out.println(selq);
            int i=0;
            float q=0;
            while(rs1.next()){
                i++;
                q=no*Float.parseFloat(rs1.getString("product_qty"));
                %>
                <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("product_name")%></td>
                <td><img src="../Admin/Photo/<%=rs1.getString("product_photo")%>" width="150" height="150"></td>
                <td><%=q%></td>
                </tr>
                <input type="hidden" name="txthidden" value="<%=rs1.getString("quota_id")%>">
                <%
               
            }
                %>
                <tr>
                <td colspan="4" align="center"><input type="submit" name="btnsub" value="Search Shop"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
     <br><br><br><br><br><br><br><br><br>
     <%@include file="Footer.jsp" %>
</html>
