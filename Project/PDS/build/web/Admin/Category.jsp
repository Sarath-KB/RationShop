<%-- 
    Document   : Category.jsp
    Created on : 19 Jan, 2020, 5:51:48 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Category</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br><br>
        

        <%
             String edit="",hid="",name="";
             hid=request.getParameter("txthidden");
            if(request.getParameter("btnsubmit")!=null){
                if(hid.equals("")){
                String ins="insert into tbl_category(category_name)values('"+request.getParameter("txtcat")+"')";
                if(con.executeCommand(ins)){
                    %>
                    <script>alert("Data Inserted");</script>
                    <%
                }else{
                    %>
                    <script>alert("Failed");</script>
                    <%
                }
            }else{
                    String upq="update tbl_category set category_name='"+request.getParameter("txtcat")+"' where category_id='"+hid+"'";
                    if(con.executeCommand(upq)){
                        %>
                    <script>alert("Data Updated");</script>
                    <%
                    }else{
                        %>
                    <script>alert("Update Failed");</script>
                    <%
                    }
                    
                }
            }
            if(request.getParameter("deleteid")!=null){
                String del="delete from tbl_category where category_id='"+request.getParameter("deleteid")+"'";
                if(con.executeCommand(del)){
                   %>
                    <script>alert("Data Deleted");</script>
                    <%
                }else{
                    %>
                    <script>alert("Failed");</script>
                    <%
                }
            }
             if(request.getParameter("editid")!=null){
                 edit=request.getParameter("editid");
                 String sele="select * from tbl_category where category_id='"+edit+"'";
                 ResultSet rs1=con.selectCommand(sele);
                 if(rs1.next()){
                     name=rs1.getString("category_name");
                 }
            
             }
        
        %>
        <br>
        <br>
        <form  method="POST">
            <input type="hidden" name="txthidden" value="<%=edit%>">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>Category</td>
                    <td><input type="text" name="txtcat" value="<%=name%>" required=""></td>
                
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit"><input type="reset" name="resubmit" value="cancel">
                    </td>
                </tr>
                
            </table>    
                <hr>
                <br>
            <table border="2" align="center" cellpadding="10">
                <tr>
                    <th>Sl.no</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
                <%
                String sel="select * from tbl_category";
                ResultSet rs=con.selectCommand(sel);
                int i=0;
                while(rs.next()){
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("category_name")%></td>
                        <td><a href="Category.jsp?deleteid=<%=rs.getString("category_id")%>">Delete</a> <a href="Category.jsp?editid=<%=rs.getString("category_id")%>">Edit</a></td>
                    </tr>
                    <%
                }
                %>
            </table>
                   
        </form>
            
        
    </body>
    <br><br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
