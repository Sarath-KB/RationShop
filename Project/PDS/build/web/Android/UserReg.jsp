<%-- 
    Document   : UserReg
    Created on : 02-Jun-2021, 23:27:15
    Author     : hp -pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Reg</title>
        <script src="../JS/jQuery.js"></script>
         <script>
            function getplace(d)
{
       // alert(b);
	
	$.ajax(
		{
			url:"../AjaxPages/Ajaxplace.jsp?did="+d,
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
			url:"../AjaxPages/Ajaxlocation.jsp?pid="+p,
			success:function(result)
			{
				$("#sellocation").html(result);
				
			}
		});
}
</script>
    </head>
    <body>
        
        
            
  <form method="post" enctype="multipart/form-data" action="UserRegUpload.jsp">
      <table border="1" cellpadding="10" align="center" style="border-collapse: collapse;">
                 
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" required="" pattern="([A-Za-z/s]{1,50})"> </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="" pattern="([0-9]{10,10})"> </td>
                </tr>
                 <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" required=""> </td>

                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" required=""> </textarea></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="rbgender" value="Male">Male
                    <input type="radio" name="rbgender" value="Female">Female 
 </td>
                       </tr>
                       <tr>
                    <td>District</td>
                    <td>
                        <select name="seldistrict" onchange="getplace(this.value)" required="">
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
                        
                        <select name="selplace" id="selplace" onchange="getlocation(this.value)" required="">
                            <option>------Select-------</option>
                           
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>location</td>
                    <td>
                        <select name="sellocation" id="sellocation" required="">
                            <option>------Select-------</option>
                           
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>NO.of Members</td>
                    <td><input type="text" name="txtmember" required=""> </td>
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
                    <td><input type="file" name="txtphoto" required=""> </td>

                </tr>
                 <tr>
                    <td>Proof</td>
                    <td><input type="file" name="txtcardproof" required=""> </td>
                        </tr>
                      
               
                
                   <tr>
                    <td>Username</td>
                    <td><input type="text" name="txtusername" required="" > </td>
                </tr>
                 <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" required="" > </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
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
         
           </body>
           </html>
