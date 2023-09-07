<%-- 
    Document   : Member
    Created on : 02-Jun-2021, 23:40:29
    Author     : hp -pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Details</title>
       
    </head>
    <body>
      
        
        <%
            if(request.getParameter("id")!=null)
            {
                session.setAttribute("sid", request.getParameter("id"));
            }
        %>

        <form method="post" enctype="multipart/form-data" action="MemberUploadDetails.jsp">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Name</td>
                <td><input type="text" name="txtname" required="" pattern="([A-Za-z/s]{1,15})"></td>
                </tr>
                
                  <tr>
                    <td>Proof Type</td>
                    <td>
                        <select name="selprroftype" required="">
                            <option>------Select-------</option>
                            <%
                                String selp="select *from tbl_prooftype";
                                 ResultSet rsp=con.selectCommand(selp);
                                while(rsp.next())
                                {
                             %>
                             <option value="<%=rsp.getString("prooftype_id") %>"><%=rsp.getString("prooftype_name") %></option>
                             <%
                            }
                         %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                <td>Photo</td>
                <td><input type="file" name="photo" required=""></td>
                </tr>
                <tr>
                <td>Proof</td>
                <td><input type="file" name="proof" required=""></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Add"></td>
                </tr>
            </table>
        </form>
    </body>
   
</html>
