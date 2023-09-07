<%-- 
    Document   : Location.jsp
    Created on : 24 Jan, 2020, 11:25:16 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Location</title>
    <%@include file="Links.jsp" %>
    <script src="../JS/jQuery.js"></script>
         <script>
         
            function getPlace(b){
                //alert(a);
                $.ajax(
                        {
                            url:"../AjaxPages/Ajaxplace.jsp?did="+b,
                    success:function(result){
                        //alert(result);
                        $("#place").html(result);
                        
                    }
                });
            }
        </script>
        
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        
  <%
        if(request.getParameter("btnsubmit")!=null){
            String ins="insert into tbl_location(location_name,place_id)values('"+request.getParameter("txtl")+"','"+request.getParameter("place")+"')";
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
                String del="delete from tbl_location where location_id='"+request.getParameter("deleteid")+"'";
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
                    <td>District</td>
                    <td><select name="district" id="district" onchange="getPlace(this.value)" required="">
                             <option>---select---</option>
                             <%
         String sel="select * from tbl_district";
         ResultSet rs=con.selectCommand(sel);
         while(rs.next()){
             %>
             <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
             <%
         }
                             %>
                        </select></td>
                </tr>
                 <tr>
                    <td>Place</td>
                    <td><select name="place" id="place" required="">
                    
                            <option>---select--</option>
            </select></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td><input type="text" name="txtl"></td>
                </tr>
                <tr>
                
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
                <th>location</th>
              
                <th>Action</th>
                </tr>
                <%
                                String seld="select * from tbl_location";
                                ResultSet rs1=con.selectCommand(seld);
                                int i=0;
                                while(rs1.next()){
                                    i++;
                                    %>
                                    <tr>
                                    <td><%=i%></td>
                                    <td><%=rs1.getString("location_name")%></td>
                                    
                                    <td><a href="Location.jsp?deleteid=<%=rs1.getString("location_id")%>">Delete</a></td>
                                    </tr>
                                    
                                    <%
                                }
                                    
                %>
               
                
           
            </table>
        </form>
    </body>
    <br><br><br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
