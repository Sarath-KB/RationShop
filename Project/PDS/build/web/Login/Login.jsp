<%-- 
    Document   : Login
    Created on : 21 Apr, 2021, 11:05:03 PM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!doctype html>
<html lang="en">
  <head>
  	<title>Kerala Ration Board</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(images/hero-bg.jpg);">
            <%
        String uuname="",upwd="",uid="",uname="",pwd="",sid="",sname="";
        if(request.getParameter("btnsubmit")!=null)
        {
            uuname=request.getParameter("txtusername");
            upwd=request.getParameter("txtpassword");
            String sel="select * from tbl_user where user_username='"+uuname+"' and user_password='"+upwd+"' and user_status=2";
            ResultSet rs=con.selectCommand(sel);
             String sel1="select * from tbl_shop where shop_username='"+uuname+"' and shop_password='"+upwd+"'";
            ResultSet rs1=con.selectCommand(sel1);
            String sela="select * from tbl_admin where admin_username='"+uuname+"' and admin_password='"+upwd+"'";
            ResultSet rs2=con.selectCommand(sela);
            String selo="select * from tbl_talukofficer where talukofficer_username='"+uuname+"' and talukofficer_password='"+upwd+"'";
           ResultSet rs3=con.selectCommand(selo);
           String seldo="select * from tbl_districtofficer where districtofficer_username='"+uuname+"' and districtofficer_password='"+upwd+"'";
           ResultSet rs4=con.selectCommand(seldo);
            
            if(rs.next())
            {
                uid=rs.getString("user_id");
                uname=rs.getString("user_name");
                session.setAttribute("uid",uid);
                session.setAttribute("uname",uname);
                session.setAttribute("no", rs.getString("user_nomember"));
                response.sendRedirect("../User/Homepage.jsp");
            }
            
           
            else if(rs1.next())
            {
                sid=rs1.getString("shop_id");
                sname=rs1.getString("shop_name");
                session.setAttribute("sid",sid);
                session.setAttribute("sname",sname);
                response.sendRedirect("../Shopkeeper/Homepage.jsp");
            } 
            else if(rs2.next()){
                response.sendRedirect("../Admin/Homepage.jsp");
            }
            else if(rs3.next()){
                String oid=rs3.getString("talukofficer_id");
                String oname=rs3.getString("talukofficer_name");
                session.setAttribute("userid", oid);
                session.setAttribute("username", oname);
                session.setAttribute("pid", rs3.getString("place_id"));
                response.sendRedirect("../Supplyofficer/Homepage.jsp");
            }
            else if(rs4.next()){
                session.setAttribute("userid", rs4.getString("districtofficer_id"));
                session.setAttribute("username", rs4.getString("districtofficer_name"));
                session.setAttribute("did", rs4.getString("district_id"));
                response.sendRedirect("../DistrictOfficer/Homepage.jsp");
            }
            else{
                %>
                <script>alert("Invalid User Login");</script>
                <%
            }
          
        }
        %>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Welcome</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Have an account?</h3>
		      	<form  class="signin-form">
		      		<div class="form-group">
		      			<input type="text" class="form-control" placeholder="Username"  name="txtusername" required autocomplete="off">
		      		</div>
	            <div class="form-group">
	              <input id="password-field" type="password" class="form-control" placeholder="Password" required name="txtpassword">
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
                        <button type="submit" class="form-control btn btn-primary submit px-3" name="btnsubmit">Sign In</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	<label class="checkbox-wrap checkbox-primary">Remember Me
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
	            </div>
	          </form>
	          <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
	          <div class="social d-flex text-center">
	          	<a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
	          	<a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>

