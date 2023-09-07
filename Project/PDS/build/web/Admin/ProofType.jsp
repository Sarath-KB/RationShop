<%-- 
    Document   : ProofType
    Created on : 31 Mar, 2021, 12:33:29 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proof Type</title>
        <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br><br><br>
        <%
        if(request.getParameter("btnsubmit")!=null){
            String ins="insert into tbl_prooftype(prooftype_name)values('"+request.getParameter("txtdis")+"')";
            if(con.executeCommand(ins)){
                %>
                    <script>alert("Data Inserted");</script>
                    <%
            }else{
                %>
                    <script>alert("Failed");</script>
                    <%
            }
        }
         if(request.getParameter("deleteid")!=null){
                String del="delete from tbl_prooftype where prooftype_id='"+request.getParameter("deleteid")+"'";
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
        %>
        <br><br>
        <form  method="POST">
            <table border="2" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    
               
                    <td>Proof Type</td>
                    <td><input type="text" name="txtdis" required="" autocomplete="off"></td>
                
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit"><input type="reset" name="resubmit" value="cancel">
                    </td>
                </tr>
            </table>
                         <hr>
                         <br>
            
            <table border="1" align="center" cellpadding="10">
                <tr>
                <th>sl.no</th>
               
                <th>Proof Type</th>
                <th>Action</th>
                </tr>
                <%
                                String seld="select * from tbl_prooftype ";
                                ResultSet rs1=con.selectCommand(seld);
                                int i=0;
                                while(rs1.next()){
                                    i++;
                                    %>
                                    <tr>
                                    <td><%=i%></td>
                                    
                                     <td><%=rs1.getString("prooftype_name")%></td>
                                     <td><a href="ProofType.jsp?deleteid=<%=rs1.getString("prooftype_id")%>">Delete</a></td>
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
