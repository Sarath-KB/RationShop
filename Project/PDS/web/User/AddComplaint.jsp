<%-- 
    Document   : Complaint.jsp
    Created on : 6 Feb, 2020, 7:34:11 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Add Complaint</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
    <%
        String date="",content="";
        date=request.getParameter("txtdate");
        content=request.getParameter("txtcontent");
        String user_id=session.getAttribute("uid").toString();
        //String shop_id=session.getAttribute("sid").toString();
       if(request.getParameter("btnsubmit")!=null)
            {
               String ins="insert into tbl_complaint(user_id,shop_id,complaint_date,complaint_content) values('"+user_id+"','"+request.getParameter("spid")+"',curdate(),'"+content+"')";
            con.executeCommand(ins);
            //out.println(ins);
            }
              
                
            
            %>
    <form method="post"   >
        <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
               
                <tr>
                    <td>Complaint Description</td>
                    <td><textarea name="txtcontent" required=""></textarea></td>
                </tr>
                
                <td><input type="submit" name="btnsubmit" value="Submit"></td>
               <td><input type="submit" name="btncancel" value="Cancel"></td>
               
            </table>
        </form>
   </body>
   <br><br><br><br><br><br>
   <%@include file="Footer.jsp" %>
</html>

