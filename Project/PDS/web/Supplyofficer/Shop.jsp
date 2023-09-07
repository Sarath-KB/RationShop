<%-- 
    Document   : Shop.jsp
    Created on : 24 Jan, 2020, 12:10:55 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
    <%@include file="Links.jsp" %>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br>
  <%
            String sname="",saddress="",scontact="",semail="",sshopno="",
            slicenseproof="",sphoto="",susername="",spassword="",
                    selname1="",selname2="",selname3="",name="",address="",contact="",email="",
                    shopno="",proof="",photo="",uname="",pwd="";
//            sname=request.getParameter("txtname");
//            saddress=request.getParameter("txtaddress");
//            scontact=request.getParameter("txtcontact");
//            semail=request.getParameter("txtemail");
//            sshopno=request.getParameter("txtshopno");
//            slicenseproof=request.getParameter("txtlicenseproof");
//            sphoto=request.getParameter("txtphoto");
//            susername=request.getParameter("txtusername");
//            spassword=request.getParameter("txtpassword");
//            selname1=request.getParameter("seldistrict");
//            selname2=request.getParameter("selplace");
//            selname3=request.getParameter("sellocation");
//            if(req0uest.getParameter("txtname")!=null)
//            {
//                if(request.getParameter("edid")!=null){
//                   
//                    String upd ="update tbl_shop set shop_name='"+sname+"',shop_address='"+saddress+"',shop_contact='"+scontact+",shop_email='"+semail+"'"
//                            + ",shop_shopno='"+sshopno+"',shop_licenseproof='"+slicenseproof+"',shop_photo='"+sphoto+"',shop_username='"+susername+"'"
//                            + ",shop_password='"+spassword+"'where shop_id='"+request.getParameter("edid")+"'";
//                     con.executeCommand(upd);
//                     
//                     
//                }
//                else{
//                String ins="insert into tbl_shop(shop_name,shop_address,shop_contact,shop_email,shop_shopno,shop_licenseproof,shop_photo,shop_username,shop_password,district_id,place_id,location_id) "
//       + "values('"+sname+ "','"+saddress+ "','"+scontact+ "','"+semail+ "','"+sshopno+ "','"+slicenseproof+ "','"+sphoto+ "','"+susername+ "','"+spassword+"','"+selname1+"''"+selname2+"''"+selname3+"')";
//                con.executeCommand(ins);
//            }
//                 
//                    response.sendRedirect("Shop.jsp");
//                    }
                if(request.getParameter("delid")!=null){
                boolean delCheck;
                String del="delete from tbl_shop where shop_id='"+request.getParameter("delid")+"'";
                delCheck=con.executeCommand(del);
                if(delCheck==true){
                  %>
                  <script>alert('Delete Successful')</script>
                  <%
                    response.sendRedirect("Shop.jsp");%>
                }
                else{
                   %>
                    <script>alert('Delete Unuccessful')</script>
                   <%
                }
            }
//            if(request.getParameter("edid")!=null){
//                String EditId = request.getParameter("edid");
//                String selQry = "select * from tbl_shop where shop_id='"+EditId+"'";
//                System.out.println(selQry);
//                ResultSet re=con.selectCommand(selQry);
//                while(re.next()){
//                    name= re.getString("shop_name");
//                    address= re.getString("shop_address");
//                    contact= re.getString("shop_contact");
//                    email= re.getString("shop_email");
//                    shopno= re.getString("shop_shopno");
//                    proof= re.getString("shop_licenseproof");
//                    photo= re.getString("shop_photo");
//                    uname= re.getString("shop_username");
//                    pwd= re.getString("shop_password");
//                }
//            }
            
            %>
           
            <form method="post" enctype="multipart/form-data" action="../ActionPages/ShopUploadAction.jsp">
                <table border="1" cellpadding="10" align="center" style="border-collapse: collapse;">
               
               
                
                <tr>
                    <td>Shop Name</td>
                    <td><input type="text" name="txtname" required="" pattern="([A-Za-z/s]{1,50})"> </td>
                </tr>
                 <tr>
                    <td>Shop Address</td>
                    <td><textarea name="txtaddress" required="" ></textarea> </td>
                </tr>
                 <tr>
                    <td>Shop Contact</td>
                    <td><input type="text" name="txtcontact" required="" pattern="([0-9]{10,10})" > </td>
                </tr>
                 <tr>
                    <td>Shop Email</td>
                    <td><input type="email" name="txtemail" required="" > </td>
                </tr>
                 <tr>
                    <td>Shop Number</td>
                    <td><input type="text" name="txtshopno"  required=""> </td>
                </tr>
                 <tr>
                    <td>Shop Licence Proof </td>
                    <td><input type="file" name="txtlicenseproof" required=""> </td>
                </tr>
                <tr>
                    <td>location</td>
                    <td>
                        <select name="sellocation" id="sellocation" required="">
                            <option>------Select-------</option>
                            <%
                                String sel0="select *from tbl_location where place_id='"+session.getAttribute("pid")+"'";
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
                 <tr>
                    <td>Shop Photo</td>
                    <td><input type="file" name="txtimage" required=""> </td>
                </tr>
                 <tr>
                    <td>Shop Username</td>
                    <td><input type="text" name="txtusername" required="" > </td>
                </tr>
                 <tr>
                    <td>Shop Password</td>
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
        
         <table border="1" align="center" cellpading="10">
            <tr>
                <th>Sl.no</th>
                <th>Name</th>
                <th>Address</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Shop No</th>
                <th>Proof</th>
                <th>Photo</th>
                <th>Delete</th>
                
            </tr>
            
            <%
            int i=1;
            String sel3="select *from tbl_shop";
             ResultSet rs3=con.selectCommand(sel3);
            while(rs3.next())
            {
            %>
            <tr>
                <td><%= i %> </td>
                <td><%= rs3.getString("shop_name") %> </td>
                <td><%= rs3.getString("shop_address") %> </td>
                <td><%= rs3.getString("shop_contact") %> </td>
                <td><%= rs3.getString("shop_email") %> </td>
                <td><%= rs3.getString("shop_shopno") %> </td>
                <td><a href="../Shopkeeper/Proof/<%= rs3.getString("shop_licenseproof") %>">Proof</a> </td>
                <td><img src="../Shopkeeper/Images/<%= rs3.getString("shop_photo") %>" height="100" width="100" > </td>
                <td><a href="Shop.jsp?delid=<%=rs3.getString("shop_id") %>">Delete</a></td>
                
            </tr>
            <%
            i++;
            }
            %>
         </table>
    </body>
    <br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>