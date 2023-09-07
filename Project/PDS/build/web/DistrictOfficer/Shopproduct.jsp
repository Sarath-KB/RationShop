<%-- s
    Document   : Shopproduct.jsp
    Created on : 7 Feb, 2020, 10:42:01 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Product</title>
    <%@include file="Links.jsp" %>
                <script src="../JS/jQuery.js"></script>
         <script>
           
function getsubcategory(d)
{
       // alert(b);
	
	$.ajax(
		{
			url:"../AjaxPages/Ajaxsubcategory.jsp?did="+d,
			success:function(result)
			{
				$("#selsubcategory").html(result);
				
			}
		});
}
function getproduct(d)
{
       // alert(b);
	
	$.ajax(
		{
			url:"Ajaxproduct.jsp?sid="+d,
			success:function(result)
			{
				$("#selproduct").html(result);
				
			}
		});
}
   </script>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <%
            String selname1="", selname2="",selname3="";
     
        selname2=request.getParameter("selshop");
        selname3=request.getParameter("selproduct");
        if(request.getParameter("btnadd")!=null)
        {
             String ins="insert into tbl_districtproduct(districtofficer_id,product_id) values('"+session.getAttribute("userid")+ "','"+selname3+ "')";
                
                con.executeCommand(ins);
                //out.println(ins);
            }
        
        if(request.getParameter("delid")!=null)
        {
                boolean delCheck;
                String del="delete from tbl_districtproduct where districtproduct_id='"+request.getParameter("delid")+"'";
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                  <script>alert('Delete Successful')</script>
                  <%
                    response.sendRedirect("Shopproduct.jsp");%>
                }
                else{
                   %>
                    <script>alert('Delete Unuccessful')</script>
                   <%
                }
            }
            %>
            <div id="tab"> 
    <form method="post">
        <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
           
            <tr>
                    <td>Category</td>
                    <td>
                        <select name="selcategory" id="selcategory"  onchange="getsubcategory(this.value)" required="">
                            <option>------Select-------</option>
                            <%
                                String sel1="select *from tbl_category";
             ResultSet rs1=con.selectCommand(sel1);
            while(rs1.next())
            {
                             %>
                             <option value="<%=rs1.getString("category_id") %>"><%=rs1.getString("category_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Sub Category</td>
                    <td>
                        <select name="selsubcategory" id="selsubcategory" onchange="getproduct(this.value)" required="" >                       
                            <option>------Select-------</option>
                            <%
                                
                                String sel2="select *from tbl_subcategory where category_id='"+request.getParameter("did")+"'";
                                  
             ResultSet rs2=con.selectCommand(sel2);
            while(rs2.next())
            {
                             %>
                             <option value="<%=rs2.getString("subcategory_id") %>"><%=rs2.getString("subcategory_name") %></option>
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
                                
                                String sel3="select *from tbl_product where product_id='"+request.getParameter("did")+"'";
                                  
             ResultSet rs3=con.selectCommand(sel3);
            while(rs3.next())
            {
                             %>
                             <option value="<%=rs3.getString("product_id") %>"><%=rs3.getString("product_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <input type="submit" value="Add" name="btnadd">
                        <input type="submit" value="Cancel" name="btncancel">
                    </td>
                </tr>
        </table>
    
                        <table border="1" align="center" cellpadding="10">
                            
                 <tr>
            <td>Sl.No</td>
            <td>Category</td>
           <td>Sub Category</td>
            <td>Product</td>
            <td>Action</td>
            <td>Action</td>
        </tr>
        <%
            int i=1;
            String sel0="select * from tbl_districtproduct s inner join tbl_product p on p.product_id=s.product_id inner join tbl_subcategory sb on sb.subcategory_id=p.subcategory_id inner join tbl_category c on c.category_id=sb.category_id";
             ResultSet rs0=con.selectCommand(sel0);
            while(rs0.next())
            {
            %>
            <tr colspan="2" align="center">
                <td><%= i %> </td>
                <td><%= rs0.getString("category_name") %> </td>
                <td><%= rs0.getString("subcategory_name") %> </td>
                <td><%= rs0.getString("product_name") %> </td>
                
                <th><a href="Shopproduct.jsp?delid=<%=rs0.getString("districtproduct_id") %>">Delete</a></th>
                <th><a href="Stock.jsp?spid=<%=rs0.getString("districtproduct_id") %>">Add Stock</a></th>
            </tr>
            <%
            i++;
            }
            %>
     
                        </table>
            </form>
            <div id="tab">
    </body>
    
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>

