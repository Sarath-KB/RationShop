<%-- 
    Document   : Provertytype
    Created on : 19 Jan, 2020, 10:50:56 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poverty Type</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <%
            String prname="", poverty="",EditId="";
            prname=request.getParameter("txtname");
            if(request.getParameter("txtname")!=null)
            {
                 if(request.getParameter("hdid")!=""){
                   
                    String upd ="update tbl_povertytype set povertytype_name='"+prname+"'where povertytype_id='"+request.getParameter("hdid")+"'";
                     con.executeCommand(upd);
                     
                     
                }
                else{
                String ins="insert into tbl_povertytype(povertytype_name) values('"+prname+"')";
                con.executeCommand(ins);
            }
                 
                   %>
                    <script>alert("Data Opertion Sucess");</script>
                    <%
                    }
                if(request.getParameter("delid")!=null){
                boolean delCheck;
                String del="delete from tbl_povertytype where povertytype_id='"+request.getParameter("delid")+"'";
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                  <script>alert('Delete Successful');</script>
                  <%
                    response.sendRedirect("Povertytype.jsp");%>
                }
                else{
                   %>
                    <script>alert('Delete Unuccessful');</script>
                   <%
                }
            }
            if(request.getParameter("edid")!=null){
               EditId = request.getParameter("edid");
                String selQry = "select * from tbl_povertytype where povertytype_id='"+EditId+"'";
                System.out.println(selQry);
                ResultSet re=con.selectCommand(selQry);
                while(re.next()){
                    poverty= re.getString("povertytype_name");
                }
            }
            
            %>
           
        <form>
        <input type="hidden" name="hdid" value="<%=EditId%>">
        <table border="1" cellpadding="10" align="center" style="border-collapse: collapse;">
            <tr>
                    <td>Poverty Type</td>
                    <td><input type="text" name="txtname" value="<%=poverty%>" required=""> </td>
               
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
                <th>Poverty type</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            
            <%
            int i=1;
            String sel="select *from tbl_povertytype";
             ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
            %>
            <tr>
                <td><%= i %> </td>
                <td><%= rs.getString("povertytype_name") %> </td>
                <td><a href="Povertytype.jsp?delid=<%=rs.getString("povertytype_id") %>">Delete</a></td>
                <td><a href="Povertytype.jsp?edid=<%=rs.getString("povertytype_id") %>">Edit</a></td>
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
 