package org.apache.jsp.Login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("  \t<title>Kerala Ration Board</title>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("\t<link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("\t\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("\n");
      out.write("\t</head>\n");
      out.write("\t<body class=\"img js-fullheight\" style=\"background-image: url(images/hero-bg.jpg);\">\n");
      out.write("            ");

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
                
      out.write("\n");
      out.write("                <script>alert(\"Invalid User Login\");</script>\n");
      out.write("                ");

            }
          
        }
        
      out.write("\n");
      out.write("\t<section class=\"ftco-section\">\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<div class=\"row justify-content-center\">\n");
      out.write("\t\t\t\t<div class=\"col-md-6 text-center mb-5\">\n");
      out.write("\t\t\t\t\t<h2 class=\"heading-section\">Welcome</h2>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row justify-content-center\">\n");
      out.write("\t\t\t\t<div class=\"col-md-6 col-lg-4\">\n");
      out.write("\t\t\t\t\t<div class=\"login-wrap p-0\">\n");
      out.write("\t\t      \t<h3 class=\"mb-4 text-center\">Have an account?</h3>\n");
      out.write("\t\t      \t<form  class=\"signin-form\">\n");
      out.write("\t\t      \t\t<div class=\"form-group\">\n");
      out.write("\t\t      \t\t\t<input type=\"text\" class=\"form-control\" placeholder=\"Username\"  name=\"txtusername\" required autocomplete=\"off\">\n");
      out.write("\t\t      \t\t</div>\n");
      out.write("\t            <div class=\"form-group\">\n");
      out.write("\t              <input id=\"password-field\" type=\"password\" class=\"form-control\" placeholder=\"Password\" required name=\"txtpassword\">\n");
      out.write("\t              <span toggle=\"#password-field\" class=\"fa fa-fw fa-eye field-icon toggle-password\"></span>\n");
      out.write("\t            </div>\n");
      out.write("\t            <div class=\"form-group\">\n");
      out.write("                        <button type=\"submit\" class=\"form-control btn btn-primary submit px-3\" name=\"btnsubmit\">Sign In</button>\n");
      out.write("\t            </div>\n");
      out.write("\t            <div class=\"form-group d-md-flex\">\n");
      out.write("\t            \t<div class=\"w-50\">\n");
      out.write("\t\t            \t<label class=\"checkbox-wrap checkbox-primary\">Remember Me\n");
      out.write("\t\t\t\t\t\t\t\t\t  <input type=\"checkbox\" checked>\n");
      out.write("\t\t\t\t\t\t\t\t\t  <span class=\"checkmark\"></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"w-50 text-md-right\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"#\" style=\"color: #fff\">Forgot Password</a>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t            </div>\n");
      out.write("\t          </form>\n");
      out.write("\t          <p class=\"w-100 text-center\">&mdash; Or Sign In With &mdash;</p>\n");
      out.write("\t          <div class=\"social d-flex text-center\">\n");
      out.write("\t          \t<a href=\"#\" class=\"px-2 py-2 mr-md-1 rounded\"><span class=\"ion-logo-facebook mr-2\"></span> Facebook</a>\n");
      out.write("\t          \t<a href=\"#\" class=\"px-2 py-2 ml-md-1 rounded\"><span class=\"ion-logo-twitter mr-2\"></span> Twitter</a>\n");
      out.write("\t          </div>\n");
      out.write("\t\t      </div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</section>\n");
      out.write("\n");
      out.write("\t<script src=\"js/jquery.min.js\"></script>\n");
      out.write("  <script src=\"js/popper.js\"></script>\n");
      out.write("  <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("  <script src=\"js/main.js\"></script>\n");
      out.write("\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
