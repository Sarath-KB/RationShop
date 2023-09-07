<%-- 
    Document   : Product.jsp
    Created on : 24 Jan, 2020, 9:05:24 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
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
   </script>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br>
        
  <%
            String pname="", place="",pphoto="", pdescription="",pprice="", punit="",selname1="",selname2="",
                    location="",name="",price="",description="",unit="",photo="";
            pname=request.getParameter("txtname");
            pprice=request.getParameter("txtname");
            pdescription=request.getParameter("txtname");
            punit=request.getParameter("txtname");
            pphoto=request.getParameter("txtname");
            selname1=request.getParameter("selcategory");
            selname2=request.getParameter("selsubcategory");
            
                if(request.getParameter("delid")!=null){
                boolean delCheck;
                String del="delete from tbl_product where product_id='"+request.getParameter("delid")+"'";
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                  <script>alert('Delete Successful')</script>
                  <%
                    response.sendRedirect("Product.jsp");%>
                }
                else{
                   %>
                    <script>alert('Delete Unuccessful')</script>
                   <%
                }
            }
            if(request.getParameter("edid")!=null){
                String EditId = request.getParameter("edid");
                String selQry = "select * from tbl_product where product_id='"+EditId+"'";
                System.out.println(selQry);
                ResultSet re=con.selectCommand(selQry);
                while(re.next()){
                    name= re.getString("product_name");
                    price= re.getString("product_price");
                    description= re.getString("product_description");
                    unit= re.getString("product_unit");
                    photo= re.getString("product_photo");
                    
                }
            }
            
            %>
           
            <form method="post" enctype="multipart/form-data" action="../ActionPages/ProductUploadAction.jsp">
                <table border="1" cellpadding="10" align="center" style="border-collapse: collapse;">
                <tr>
                    <td>Category</td>
                    <td>
                        <select name="selcategory" id="selcategory" onchange="getsubcategory(this.value)" required="">
                            <option>------Select-------</option>
                            <%
                                String sel="select *from tbl_category";
             ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                             %>
                             <option value="<%=rs.getString("category_id") %>"><%=rs.getString("category_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Sub Category</td>
                    <td>
                        <select name="selsubcategory" id="selsubcategory" required="">
                            <option>------Select-------</option>
                            <%
                                String sel1="select *from tbl_subcategory";
             ResultSet rs1=con.selectCommand(sel1);
            while(rs1.next())
            {
                             %>
                             <option value="<%=rs1.getString("subcategory_id") %>"><%=rs1.getString("subcategory_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" required=""> </td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="txtprice" required=""> </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="txtdescription" required="" ></textarea> </td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td><input type="text" name="txtunit" required=""> </td>
                </tr>
                <tr>            
                    <td>Photo</td>
                    <td><input type="file" name="txtimage" required="">
                         </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Submit" name="btnsubmit">
                        <input type="submit" value="Cancel" name="btncancel">
                    </td>
                </tr>
            </table>
        
        </form>
        
         <table border="1" align="center" cellpadding="10">
            <tr>
                <th>Sl.no</th>
                <th>Name</th>
                <th>Market Price</th>
                <th>Description</th>
                <th>Unit</th>
                <th>Photo</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            
            <%
            int i=1;
            String sel2="select *from tbl_product";
             ResultSet rs2=con.selectCommand(sel2);
            while(rs2.next())
            {
            %>
            <tr>
                <td><%= i %> </td>
                <td><%= rs2.getString("product_name") %> </td>
                 <td><%= rs2.getString("product_price") %> </td>
                  <td><%= rs2.getString("product_description") %> </td>
                   <td><%= rs2.getString("product_unit") %> </td>
                    <td><img src="../Admin/Photo/<%= rs2.getString("product_photo") %>" height="100" width="100" ></td>
                <td><a href="Product.jsp?delid=<%=rs2.getString("product_id") %>">Delete</a></td>
                <td><a href="Product.jsp?edid=<%=rs2.getString("product_id") %>">Edit</a></td>
            </tr>
            <%
            i++;
            }
            %>
         </table>
    </body>
    <br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>