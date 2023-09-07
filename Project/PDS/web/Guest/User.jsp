<%-- 
    Document   : User.jsp
    Created on : 24 Jan, 2020, 5:56:52 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    <%@include file="Links.jsp" %>
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
        <%@include file="Header.jsp" %>
   &nbsp;
           &nbsp;
           &nbsp;
           &nbsp;
           <br>
           <br>
           <br>
           <br>
           <br>
           <br>
        
  <%
//            String uname="",uaddress="",ugender="",uusername="",ucontact="",uphoto="",uemail="",ucardno="",uproof="",upassword="",
//                    selname0="",selname1="",selname2="",selname3="",name="";
//             uname=request.getParameter("txtname");
//             uaddress=request.getParameter("txtaddress");
//             ugender=request.getParameter("rbgender");
//             ucontact=request.getParameter("txtcontact");
//             uphoto=request.getParameter("txtphoto");
//             uemail=request.getParameter("txtemail");
//             ucardno=request.getParameter("txtcardno");
//             uproof=request.getParameter("txtproof");
//             
//            selname0=request.getParameter("seldistrict");
//            selname1=request.getParameter("selplace");
//            selname2=request.getParameter("sellocation");
//            selname3=request.getParameter("selpovertytype");
//            if(request.getParameter("btnsubmit")!=null)
//            {
//          String ins="insert into tbl_user(user_name,user_address,user_gender,user_contact,user_photo,user_email,user_cardno,"
//                  + "user_cardproof,district_id,place_id,location_id,povertytype_id) values('"+uname+ "','"+uaddress+ "','"+ugender+ "',"
//                  + "'"+ucontact+ "','"+uphoto+ "','"+uemail+ "','"+ucardno+ "','"+uproof+ "','"+selname0+ "','"+selname1+ "','"+selname2+ "','"+selname3+ "',0)";
//                con.executeCommand(ins);
//                out.println(ins);
//                       
//                    //response.sendRedirect("User.jsp");
//                   }
  %>
               
  <form method="post" enctype="multipart/form-data" action="../ActionPages/UserUploadAction.jsp">
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
            <%@include file="Footer.jsp" %>
           </body>
           </html>
