<%-- 
    Document   : stock.jsp
    Created on : 7 Feb, 2020, 3:19:13 PM
    Author     : USER
--%>


<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
       <%
           String stnumber="",stunit="",spid="";
   stnumber=request.getParameter("txtstock");
   stunit=request.getParameter("txtunit");
   spid=request.getParameter("spid");
   if(request.getParameter("btnsubmit")!=null)
   {
     String ins="insert into tbl_stock(stock_number,stock_unit,shopproduct_id) values('"+stnumber+ "','"+stunit+ "','"+spid+"')";
                
                con.executeCommand(ins); 
               // out.println(ins);
   }
   %>
   <%
    if(request.getParameter("delid")!=null)
        {
                boolean delCheck;
                String del="delete from tbl_stock where stock_id='"+request.getParameter("delid")+"'";
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                  <script>alert('Delete Successful');</script>
                  <%
                    response.sendRedirect("Stock.jsp");%>
                }
                else{
                   %>
                    <script>alert('Delete Unuccessful')</script>
                   <%
                }
            }
            %>
    <form method="post">
        <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                     <tr>
                    <td>Add Stock</td>
                    <td><input type="text" name="txtstock" required=""> </td>
               
                    <td>Unit </td>
                    <td><select name="txtunit" required=""> 
                            <option>----select Unit----</option>
                            <option value="gram">Gram</option>
                            <option value="kg">KG</option>
                            
                        </select></td>
                </tr>
                <tr>
                <td colspan="4" align="center"><input type="submit" value="Submit" name="btnsubmit">
                <input type="submit" value="Cancel" name="btncancel"></td>
            </tr>
        </table>
    </form>
    <table border="1" align="center" cellpadding="10">
            <tr>
                <th>Sl.no</th>
                <th>Product</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
            
            <%
            int i=1;
            String sel="select *from tbl_stock";
             ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
            %>
            <tr>
                <td><%= i %> </td>
                <td><%= rs.getString("stock_number") %> </td>
                 <td><%= rs.getString("stock_unit") %> </td>
                <td><a href="Stock.jsp?delid=<%=rs.getString("stock_id")%>">Delete</a></td>
                
            </tr>
            <%
            i++;
            }
            %>
    </table>
     </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
