<%-- 
    Document   : Location
    Created on : 18 Jan, 2020, 12:50:10 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
  <%
            String pname="", place="", selname="";
            pname=request.getParameter("txtname");
            selname=request.getParameter("seldistrict");
            if(request.getParameter("txtname")!=null)
            {
                if(request.getParameter("edid")!=null){
                   
                    String upd ="update tbl_place set place_name='"+pname+"'where place_id='"+request.getParameter("edid")+"'";
                     con.executeCommand(upd);
                     
                     
                }
                else{
                String ins="insert into tbl_place(place_name,district_id) values('"+pname+ "','"+selname+"')";
                con.executeCommand(ins);
            }
                 
                    response.sendRedirect("Place.jsp");
                    }
                if(request.getParameter("delid")!=null){
                boolean delCheck;
                String del="delete from tbl_place where place_id='"+request.getParameter("delid")+"'";
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                  <script>alert('Delete Successful')</script>
                  <%
                    response.sendRedirect("Place.jsp");%>
                }
                else{
                   %>
                    <script>alert('Delete Unuccessful')</script>
                   <%
                }
            }
            if(request.getParameter("edid")!=null){
                String EditId = request.getParameter("edid");
                String selQry = "select * from tbl_place where place_id='"+EditId+"'";
                System.out.println(selQry);
                ResultSet re=con.selectCommand(selQry);
                while(re.next()){
                    place= re.getString("place_name");
                }
            }
            
            %>
           
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>District</td>
                    <td>
                        <select name="seldistrict" required="">
                            <option>------Select-------</option>
                            <%
                                String sel="select *from tbl_district";
             ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                             %>
                             <option value="<%=rs.getString("district_id") %>"><%=rs.getString("district_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                
                    <td>Place</td>
                    <td><input type="text" name="txtname" value="<%=place%>" required=""> </td>
                
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
                <th>Place</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            
            <%
            int i=1;
            String sel1="select *from tbl_place";
             ResultSet rs1=con.selectCommand(sel1);
            while(rs1.next())
            {
            %>
            <tr>
                <td><%= i %> </td>
                <td><%= rs1.getString("place_name") %> </td>
                <td><a href="Place.jsp?delid=<%=rs1.getString("place_id") %>">Delete</a></td>
                <td><a href="Place.jsp?edid=<%=rs1.getString("place_id") %>">Edit</a></td>
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