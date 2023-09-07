<%-- 
    Document   : viewfeedback
    Created on : 10 Apr, 2021, 11:09:04 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Links.jsp" %>
      
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br>
        <form name="frmCal">
         <table border="2" align="center" cellpadding="10">
                       
                      
                   
                   
                   
                            <tr>
                                <th>Sl.No</th>
                               
                                <th>Feedback</th>
                            </tr>
                            <%
                            
                             
                                 String sel1="select * from tbl_feedback"; 
                                ResultSet rs1=con.selectCommand(sel1);
                               
                          int i=0;
                    while(rs1.next()){
                        i++;
                    
                        %> 
              <tr>
                       <td><%=i%></td>
                                    <td><%=rs1.getString("feedback_content")%></td>
                                    
              </tr>
                        <%
                    }
                   %>
                        </table>
         </form>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
