<%-- 
    Document   : productprice.jsp
    Created on : 28 Feb, 2020, 10:14:45 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Price</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
  <%
            String pprice="", subcat="", selname1="",selname2="",pid="",ptype="";
            pprice=request.getParameter("txtprice");;
            selname1=request.getParameter("selproduct");
            selname2=request.getParameter("selpovertytype");
            
            if(request.getParameter("btnsubmit")!=null)
            {
            
                if(request.getParameter("eid")!=null){
                    {
                    String upd ="update tbl_productprice set product_price='"+pprice+"', product_id='"+selname1+"', povertytype_id='"+selname2+"' where productprice_id='"+request.getParameter("eid")+"'";
                     con.executeCommand(upd);
                    }
                    
                     
                }
                else
                    {
                    
                
                String ins="insert into tbl_productprice(product_price,product_id,povertytype_id) values('"+pprice+ "','"+selname1+"','"+selname2+"')";
               // out.println(ins);
                con.executeCommand(ins);
            }
                }
            if(request.getParameter("did")!=null)
        {
                boolean delCheck;
                String del="delete from tbl_productprice where productprice_id='"+request.getParameter("did")+"'";
                out.println(del);
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                     
                  <script>alert('Delete Successful')</script>
                <%
                    response.sendRedirect("productprice.jsp");
                   %>   
                }
                else{
                
                    <script>alert('Delete Unuccessful')</script>
                          <%
                }
            }
            if(request.getParameter("eid")!=null){
                String EditId = request.getParameter("eid");
                String selQry = "select * from tbl_productprice where productprice_id='"+EditId+"'";
                System.out.println(selQry);
                ResultSet re=con.selectCommand(selQry);
                while(re.next()){
                    pprice= re.getString("product_price");
                     pid= re.getString("product_id");
                      ptype= re.getString("povertytype_id");
                }
            }
            
          
                 
%>
<form method="post">
            
    <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>Category</td>
                    <td>
                        <select name="selpovertytype" required="">
                            <option>------Select-------</option>
                            <%
                                String sel="select *from tbl_povertytype";
             ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                             %>
                             <option value="<%=rs.getString("povertytype_id") %>" <%if(ptype.equals(rs.getString("povertytype_id"))){ %> Selected=""<%} %>><%=rs.getString("povertytype_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td>Product</td>
                    <td>
                        <select name="selproduct" id="selproduct" required="" >
                            <option>------Select-------</option>
                            <%
                                
                                String sel3="select *from tbl_product";
                                  
             ResultSet rs3=con.selectCommand(sel3);
            while(rs3.next())
            {
                             %>
                             <option value="<%=rs3.getString("product_id") %>" <%if(pid.equals(rs3.getString("product_id"))){ %> Selected=""<%} %>><%=rs3.getString("product_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
               
                
                <tr>
                    <td>Product Price</td>
                    <td><input type="text" name="txtprice" value="<%=pprice%>" required="" > </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Submit" name="btnsubmit">
                        <input type="reset" value="Cancel" name="btncancel">
                    </td>
                </tr>
            </table>
           &nbsp;
           &nbsp;
           &nbsp;
           &nbsp;
        </form>
        
                <table border="1" align="center" cellpadding="10">
                            
                 <tr>
        
            <td>Poverty Type</td>
           <td>Product</td>
            <td>Price</td>
            <td>Action</td>
            <td>Action</td>
        </tr>
        <%
           
            String s="select * from tbl_productprice pp inner join tbl_product p on pp.product_id=p.product_id inner join tbl_povertytype pt on pp.povertytype_id=pt.povertytype_id";
             ResultSet r=con.selectCommand(s);
            while(r.next())
            {
            
        %>
       <tr>
                
                <td><%= r.getString("povertytype_name") %> </td>
                <td><%= r.getString("product_name") %> </td>
                <td><%= r.getString("product_price") %> </td>
                
                <th><a href="productprice.jsp?eid=<%=r.getString("productprice_id") %>">Edit</a></th>
                <th><a href="productprice.jsp?did=<%=r.getString("productprice_id") %>">Delete</a></th>
            </tr>
            <%
        
            }
            %>
         </table>
    </body>
    <br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>

