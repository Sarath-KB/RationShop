<%-- 
    Document   : AddFeedback.jsp
    Created on : 27 Feb, 2020, 6:22:21 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>feedback</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <%
            String date="",feedback="",uid="",sid="";
            if(request.getParameter("btnsubmit")!=null)
            {
                date=request.getParameter("txtdate");
                feedback=request.getParameter("txtcontent");
                String user_id=session.getAttribute("uid").toString();
           
                String ins="insert into tbl_feedback(user_id,shop_id,feedback_date,feedback_content) value('"+user_id+"','"+request.getParameter("spid")+"',curdate(),'"+feedback+"')";
            con.executeCommand(ins);
            out.println(ins);
            
            
            }
            %>
            <form method="post">
                <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                    
                <tr>
                <td>Feedback</td>
                <td><textarea name="txtcontent" required=""></textarea></td>
                </tr>
                    <tr>
                    <td>
                        <input type="submit" value="Submit" name="btnsubmit">
                        <input type="submit" value="Cancel" name="btncancel">
                    </td>
                    </tr>
                </table>
            </form>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
