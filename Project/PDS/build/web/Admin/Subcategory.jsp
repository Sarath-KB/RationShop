<%-- 
    Document   : Subcategord on : 22 Jan, 2020, 9:43:01 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub Category</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <br><br><br>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
  <%
            String subname="", subcat="", selname1="";
            subname=request.getParameter("txtname");
            selname1=request.getParameter("selcategory");
            if(request.getParameter("btnsubmit")!=null)
            {
                if(request.getParameter("edid")!=null){
                   
                    String upd ="update tbl_subcategory set subcategory_name='"+subname+"'where subcategory_id='"+request.getParameter("edid")+"'";
                     con.executeCommand(upd);
                     
                     
                }
                else{
                String ins="insert into tbl_subcategory(subcategory_name,category_id) values('"+subname+ "','"+selname1+"')";
                
                con.executeCommand(ins);
            }
                 
                   // response.sendRedirect("Subcategory.jsp");
                    }
                if(request.getParameter("delid")!=null){
                boolean delCheck;
                String del="delete from tbl_subcategory where subcategory_id='"+request.getParameter("delid")+"'";
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                  <script>alert('Delete Successful')</script>
                  <%
                    response.sendRedirect("Subcategory.jsp");%>
                }
                else{
                   %>
                    <script>alert('Delete Unuccessful')</script>
                   <%
                }
            }
            if(request.getParameter("edid")!=null){
                String EditId = request.getParameter("edid");
                String selQry = "select * from tbl_subcategory where subcategory_id='"+EditId+"'";
                System.out.println(selQry);
                ResultSet re=con.selectCommand(selQry);
                while(re.next()){
                    subcat= re.getString("subcategory_name");
                }
            }
            
            %>
           
        <form method="post">
            
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>Category</td>
                    <td>
                        <select name="selcategory" required="">
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
                    <td>Sub category</td>
                    <td><input type="text" name="txtname" value="<%=subcat%>" required=""> </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Submit" name="btnsubmit">
                        <input type="submit" value="Cancel" name="btncancel">
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
                <th>Sl.no</th>
                <th>Sub category</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            
            <%
            int i=1;
            String sel1="select * from tbl_subcategory";
             ResultSet rs1=con.selectCommand(sel1);
            while(rs1.next())
            {
            %>
            <tr>
                <td><%= i %> </td>
                <td><%= rs1.getString("subcategory_name") %> </td>
                <td><a href="Subcategory.jsp?delid=<%=rs1.getString("subcategory_id") %>">Delete</a></td>
                <td><a href="Subcategory.jsp?edid=<%=rs1.getString("subcategory_id") %>">Edit</a></td>
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