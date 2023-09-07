<%-- 
    Document   : Viewshop.jsp
    Created on : 14 Feb, 2020, 10:57:53 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Shop</title>
    <%@include file="Links.jsp" %>
<script src="../JS/jQuery.js"></script>
         <script>
            function getplace(d)
{
        //alert(d);
	
	$.ajax(
		{
			url:"../Admin/Ajaxplace.jsp?did="+d,
			success:function(result)
			{
				$("#selplace").html(result);
				
			}
		});
}
 function getlocation(p)
{
        //alert(p);
	
	$.ajax(
		{
			url:"../Admin/Ajaxlocation.jsp?pid="+p,
			success:function(result)
			{
				$("#sellocation").html(result);
				
			}
		});
}
</script>
    </head>
    <body>
        
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                 <tr>
                    <td>District</td>
                    <td>
                        <select name="seldistrict" onchange="getplace(this.value)">
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
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="selplace" id="selplace" onchange="getlocation(this.value)">
                            <option>------Select-------</option>
                            <%
                                String sel1="select *from tbl_place";
             ResultSet rs1=con.selectCommand(sel1);
            while(rs1.next())
            {
                             %>
                             <option value="<%=rs1.getString("place_id") %>"><%=rs1.getString("place_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>
                        <select name="sellocation" id="sellocation">
                            <option>------Select-------</option>
                            <%
                                String sel0="select *from tbl_location";
             ResultSet rs0=con.selectCommand(sel0);
            while(rs0.next())
            {
                             %>
                             <option value="<%=rs0.getString("location_id") %>"><%=rs0.getString("location_name") %></option>
                             <%
            }
            %>
                        </select>
                    </td>
                </tr>
                <td colspan="2" align="center">
            <input type="submit" value="Search" name="btnsubmit">
                </td>
            </table>
             </form>
       
                        <% 
            if(request.getParameter("spid")!=null)
            {
               session.setAttribute("spid",request.getParameter("spid"));
               response.sendRedirect("Tokenselect.jsp");
            }
            if(request.getParameter("btnsubmit")!=null)
            {
               %>
               <table align="center" border="0" cellpadding="10" cellspacing="15">
                   <%
                int i=0;
                 String sel3="select * from tbl_shop where location_id='"+request.getParameter("sellocation")+"'";
                // out.println(sel3);
                  ResultSet rs3=con.selectCommand(sel3);
            while(rs3.next())
            {
                i++;
                if(i==0){ %> <tr> <% }
              %>
              <td><p  align="center"><img src="../Shopkeeper/Images/<%=rs3.getString("shop_photo") %>" height="150" width="150"></p>
                  <p  align="center"><%=rs3.getString("shop_name") %></p>
                   
                  <p  align="center"><a href="Viewshop.jsp?spid=<%=rs3.getString("shop_id") %>"></a></p>
                  <p  align="center"> <a href="Viewshop.jsp?spid=<%=rs3.getString("shop_id") %>">Generate Slot</a></p>
               <p  align="center"> <a href="AddFeedback.jsp?spid=<%=rs3.getString("shop_id") %>">Add Feedback</a></p>
                <p  align="center"> <a href="AddComplaint.jsp?spid=<%=rs3.getString("shop_id") %>">Add Complaint</a></p>
              
              </td>
              <%
              if(i==3)
              {
                  %>
               </tr>
                  <%
                  i=0;
              }
            }
            %>
               </table>
            <%
            }
            %>
      
   
                         </body>
                         <br><br><br><br><br><br>
                         <%@include file="Footer.jsp" %>
</html>



