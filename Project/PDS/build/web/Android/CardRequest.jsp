<%-- 
    Document   : CardRequest
    Created on : 02-Jun-2021, 23:51:37
    Author     : hp -pc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request New Card</title>
      
    </head>
    <body>
         <%
             String id="";
            if(request.getParameter("id")!=null)
            {
                id=request.getParameter("id").toString();
                session.setAttribute("sid", request.getParameter("id"));
            }
        %>

        <h1>Hello You Can Register...Here..</h1>
        <form method="post" enctype="multipart/form-data" action="CardrequestUpload.jsp">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Name</td>
                <td><input type="text" name="txtname"></td>
                </tr>
                <tr>
                <td>Address</td>
                <td><textarea name="txtaddr"></textarea></td>
                </tr>
                
                 <tr>
                <td>Annual Income In Rupees</td>
                <td><input type="text" name="txtamount"></td>
                </tr>
                <tr>
                <td>No.Of Members</td>
                <td><input type="number" name="txtnumber"></td>
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
                <td><input type="file" name="photo"></td>
                </tr>
                <tr>
                <td>Proof</td>
                <td><input type="file" name="proof"></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Request"></td>
                </tr>
                <%
                    String sel="select * from tbl_cardrequest where user_id='"+id+"'";
                    ResultSet rs=con.selectCommand(sel);
                    if(rs.next()){
                        %>
                        <tr>
                        <td colspan="2" align="center"><a href="AddAndroidRequest.jsp?crid=<%=rs.getString("cardrequest_id")%>">Add Members</a></td>
                        </tr>
                        <%
                    }
                %>
            </table>
        </form>
    </body>
 
</html>

