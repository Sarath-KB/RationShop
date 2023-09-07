/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Webservice;

import DB.ConnectionClass;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author hp -pc
 */
@WebService(serviceName = "RationWebservice")
public class RationWebservice {

     ConnectionClass con=new ConnectionClass();
    

    /**
     * Web service operation
     */
    @WebMethod(operationName = "LoginDetails")
    public String LoginDetails(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:
        String s="Success";
        String selQry="select * from tbl_user where user_username='"+username+"' and user_password='"+password+"'";
        System.out.println(selQry);
        ResultSet r=con.selectCommand(selQry);
        JSONArray J=new JSONArray();
        try {
            if(r.next()){
                JSONObject a=new JSONObject();
                try {
                    a.put("Sucess", s);
                    a.put("user_id", r.getString("user_id"));
                    a.put("povertytype_id", r.getString("povertytype_id"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(J);
        return J.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "myprofile")
    public String myprofile(@WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
         String sel="select * from tbl_user where user_id='"+userid+"'";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            if(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("name", rs.getString("user_name"));
                    a.put("address", rs.getString("user_address"));
                    a.put("contact",rs.getString("user_contact"));
                    a.put("email",rs.getString("user_email"));
                    a.put("photo",rs.getString("user_photo"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "editprofile")
    public String editprofile(@WebParam(name = "userid") String userid, @WebParam(name = "username") String username, @WebParam(name = "useraddress") String useraddress, @WebParam(name = "usercontact") String usercontact, @WebParam(name = "useremail") String useremail) {
        //TODO write your implementation code here:
       
          String s="";
        String upQry="update tbl_user set user_name='"+username+"',user_contact='"+usercontact+"',user_email='"+useremail+"',user_address='"+useraddress+"' where user_id='"+userid+"' ";
         System.out.println(upQry);
        boolean b=con.executeCommand(upQry);
        if(b==true)
        {
            s="Success";
        }
        else
        {
            s="Fail";
        }
        return s;

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "changepassword")
    public String changepassword(@WebParam(name = "currentpassword") String currentpassword, @WebParam(name = "newpassword") String newpassword, @WebParam(name = "confirmpassword") String confirmpassword, @WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
       
        String Custid = null,a="";
        String sel="select * from tbl_user where user_id='"+userid+"' ";
        ResultSet rs=con.selectCommand(sel);
        try {
            if(rs.next()){
                System.out.println(sel);
                try {
                    if(currentpassword.equals(rs.getString("user_password")))
                    {
                        System.out.println("Hai");
                         System.out.println("ne"+newpassword);
                          System.out.println("conf"+confirmpassword);
                        if(newpassword.equals(confirmpassword))
                        {
                            
                            String upQry="update tbl_user set user_password='"+confirmpassword+"' where user_id='"+userid+"'";
                            boolean b=con.executeCommand(upQry);
                            System.out.println(upQry);
                            a="Success";
                        }
                        else
                        {
                            a="Fail";
                        }
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;


    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "updatecard")
    public String updatecard(@WebParam(name = "userid") String userid, @WebParam(name = "cardnumber") String cardnumber, @WebParam(name = "cardtype") String cardtype) {
        //TODO write your implementation code here:
        String s="";
        String upQry="update tbl_user set user_cardno='"+cardnumber+"',povertytype_id='"+cardtype+"' where user_id='"+userid+"' ";
         System.out.println(upQry);
        boolean b=con.executeCommand(upQry);
        if(b==true)
        {
            s="Success";
        }
        else
        {
            s="Fail";
        }
        return s;

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "feedback")
    public String feedback(@WebParam(name = "userid") String userid, @WebParam(name = "shopid") String shopid, @WebParam(name = "content") String content) {
        //TODO write your implementation code here:
        String s="";
        String upQry="insert into tbl_feedback(user_id,shop_id,feedback_date,feedback_content) value('"+userid+"','"+shopid+"',curdate(),'"+content+"')";
         System.out.println(upQry);
        boolean b=con.executeCommand(upQry);
        if(b==true)
        {
            s="Success";
        }
        else
        {
            s="Fail";
        }
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "complaint")
    public String complaint(@WebParam(name = "userid") String userid, @WebParam(name = "shopid") String shopid, @WebParam(name = "content") String content) {
        //TODO write your implementation code here:
       String s="";
        String upQry="insert into tbl_complaint(user_id,shop_id,complaint_date,complaint_content) values('"+userid+"','"+shopid+"',curdate(),'"+content+"')' ";
         System.out.println(upQry);
        boolean b=con.executeCommand(upQry);
        if(b==true)
        {
            s="Success";
        }
        else
        {
            s="Fail";
        }
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "viewslot")
    public String viewslot(@WebParam(name = "userid") String userid) {
        //TODO write your implementation code here:
        String sel="select * from tbl_assignslot a inner join tbl_slot s on s.slot_id=a.slot_id inner join tbl_shop sp on sp.shop_id=a.shop_id where a.user_id='"+userid+"'and MONTH(slot_date) = MONTH(CURRENT_DATE()) AND YEAR(slot_date) = YEAR(CURRENT_DATE())";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            if(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("slotid", rs.getString("assignslot_id"));
                    a.put("time", rs.getString("slot_from"));
                    a.put("shop",rs.getString("shop_name"));
                    a.put("date",rs.getString("slot_date"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(J);
        return J.toString();

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "cancelbooking")
    public String cancelbooking(@WebParam(name = "slotid") String slotid) {
        //TODO write your implementation code here:
          String s="";
        String delQry="delete from tbl_assignslot where assignslot_id='"+slotid+"'";
         System.out.println(delQry);
        boolean b=con.executeCommand(delQry);
        if(b==true)
        {
            s="Your Booking Canceled";
        }
        else
        {
            s="Fail";
        }
        return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "districtdetails")
    public String districtdetails() {
        //TODO write your implementation code here:
         String sel="select * from tbl_district";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            while(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("distid", rs.getString("district_id"));
                    a.put("distname", rs.getString("district_name"));
                   
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "placedetails")
    public String placedetails(@WebParam(name = "districtid") String districtid) {
        //TODO write your implementation code here:
        String sel="select * from tbl_place where district_id='"+districtid+"'";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            while(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("placeid", rs.getString("place_id"));
                    a.put("placename", rs.getString("place_name"));
                   
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "locationdetails")
    public String locationdetails(@WebParam(name = "placeid") String placeid) {
        //TODO write your implementation code here:
        String sel="select * from tbl_location where place_id='"+placeid+"'";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            while(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("locid", rs.getString("location_id"));
                    a.put("locname", rs.getString("location_name"));
                   
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "shopdetails")
    public String shopdetails(@WebParam(name = "locationid") String locationid) {
        //TODO write your implementation code here:
          String sel="select * from tbl_shop where location_id='"+locationid+"'";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            while(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("shopid", rs.getString("shop_id"));
                    a.put("shopname", rs.getString("shop_name"));
                    a.put("shopimage", rs.getString("shop_photo"));
                   
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "selectToken")
    public String selectToken(@WebParam(name = "shopid") String shopid, @WebParam(name = "userid") String userid, @WebParam(name = "selectdate") String selectdate, @WebParam(name = "slotid") String slotid) {
        //TODO write your implementation code here:
        int count = 0;
        String s = "";
        String sel="select count(slot_id) as count from tbl_assignslot where slot_date='"+selectdate+"' and shop_id='"+shopid+"' and slot_id='"+slotid+"' ";
        ResultSet rs = con.selectCommand(sel);
         try {
             if(rs.next()){
                 count=Integer.parseInt(rs.getString("count"));
                 
                 if(count<2){
                       
                    String insQry="insert into tbl_assignslot(slot_id,user_id,shop_id,slot_date)values('"+slotid+"','"+userid+"','"+shopid+"','"+selectdate+"')";
                    System.out.println(insQry);
                    boolean b=con.executeCommand(insQry);
                    if(b==true)
                    {
                        s="Success";
                       }
                    else
                    {
                        s="Fail";
                    }
                 }
                 else{
                     s = "Slot Is Already Booked";
                 }
             }
         } catch (SQLException ex) {
             Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
         }
         return s;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "cardtype")
    public String cardtype(@WebParam(name = "parameter") String parameter) {
        //TODO write your implementation code here:
         String sel="select * from tbl_povertytype";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            while(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("typeid", rs.getString("povertytype_id"));
                    a.put("typename", rs.getString("povertytype_name"));
                   
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "slotdetails")
    public String slotdetails() {
        //TODO write your implementation code here:
         String sel="select * from tbl_slot";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            while(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("slotid", rs.getString("slot_id"));
                    a.put("slotfrom", rs.getString("slot_from"));
                   
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }
                    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return J.toString();

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "quotaDetails")
    public String quotaDetails(@WebParam(name = "cardtype") String cardtype) {
        //TODO write your implementation code here:
         String sel="select * from tbl_quota q inner join tbl_product p on p.product_id=q.product_id  where q.povertytype_id='"+cardtype+"'";
        System.out.println(sel);
        ResultSet rs=con.selectCommand(sel);
        JSONArray J=new JSONArray();
        try {
            while(rs.next())
            {
                 JSONObject a=new JSONObject();
                try {
                    a.put("pname", rs.getString("product_name"));
                    a.put("qty", rs.getString("product_qty"));
                    a.put("photo",rs.getString("product_photo"));
                    J.put(a);
                } catch (JSONException ex) {
                    Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
                }    
            }
        } catch (SQLException ex) {
            Logger.getLogger(RationWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(J);
        return J.toString();

    }
    
    
}
