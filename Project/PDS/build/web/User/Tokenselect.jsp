<%-- 
    Document   : Tokenselect
    Created on : 16 May, 2021, 11:00:33 AM
    Author     : White_Devil
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Token Select</title>
        <%@include file="Links.jsp" %>
       
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <br><br><br><br><br><br><br><br><br>
        <%
            int count=1;
            if(request.getParameter("btnsub")!=null){
                
                String selq="select * from tbl_assignslot where slot_date='"+request.getParameter("txtdate")+"' and shop_id='"+session.getAttribute("spid")+"' and slot_id='"+request.getParameter("sels")+"'";
                ResultSet rs1=con.selectCommand(selq);
               
                if(rs1.next()){
                    String selc="select count(slot_id) as id from tbl_assignslot where slot_date='"+request.getParameter("txtdate")+"' and shop_id='"+session.getAttribute("spid")+"' and slot_id='"+request.getParameter("sels")+"'";
                    ResultSet rs2=con.selectCommand(selc);
                    
                    if(rs2.next()){
                        count=Integer.parseInt(rs2.getString("id"));
                       
                        if(count<2){
                            String ins="insert into tbl_assignslot(slot_id,user_id,shop_id,slot_date)values('"+request.getParameter("sels")+"','"+session.getAttribute("uid")+"','"+session.getAttribute("spid")+"','"+request.getParameter("txtdate")+"')";
                            if(con.executeCommand(ins)){
                                %>
                                <script>alert(" Your Slot Booked");</script>
                                <%
                            }else{
                                out.println(ins);
                            }
                        }else{
                            %>
                            <script>alert("Slot Is Already Booked elect Free Slots");</script>
                            <%
                        }
                    }
                }else{
                    String insr="insert into tbl_assignslot(slot_id,user_id,shop_id,slot_date)values('"+request.getParameter("sels")+"','"+session.getAttribute("uid")+"','"+session.getAttribute("spid")+"','"+request.getParameter("txtdate")+"')";
                            if(con.executeCommand(insr)){
                                %>
                                <script>alert("Your Slot Booked");</script>
                                <%
                }else{
                                out.println(insr);
                            }
               
                
                
            }
            }
        %>
        <div id="tab">
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                <td>Choose Date</td>
                <td><input type="date" name="txtdate" ></td>
                </tr>
                <tr>
                <td>Slots</td>
                <td><select name="sels" id="sels">
                        <option>---SELECT---</option>
                        <%
            String sel="select * from tbl_slot";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next()){
                
                %>
                <option value="<%=rs.getString("slot_id")%>"><%=rs.getString("slot_from")%></option>
                <%
            }
                        %>
                    </select></td>
                </tr>
                <tr>
                <td colspan="2" align="center"><input type="submit" name="btnsub" value="Book Token"></td>
                </tr>
            </table>
        </form>
        </div>
    </body>
    <br><br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
