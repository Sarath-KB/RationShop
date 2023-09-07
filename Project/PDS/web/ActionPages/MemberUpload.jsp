<%-- 
    Document   : UserUploadAction.jsp
    Created on : 29 Jan, 2020, 11:32:55 AM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
           
             FileItem f_item=null;
             File savedFile=null;
             
       String field_name="";
       String fn="",pf="",proof="";
       String file_name="";
        int count=0;


String field[] = new String[20];
String value[] = new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);//true/false

if(isMultipart)
{
   

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields.everything on form adding t itemlist
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);//requeat contains evrything on form this is parsed and stored to item_list
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator used to iterate through all positions in item_lists
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())//checking if there is any value in the position like rs.next()
    {
       
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();// value to which the iterator points  and is coverted to fileitem format

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc) or multipath
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();//field
            value[k]=f_item.getString();//user typing value
                
                k++;//
        }
       else//when it is an image or multipart
       {
		   
		   
            //f_item=(FileItem)itr.next();
            
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
          
           
           
           //to upload proof of doctor
           
            if(field_name.equals("proof"))//write the name of image here it is img_product
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\Web\\User\\Proof\\";//path for storing image
            Random r=new Random();//to generate random number
             int r_num=r.nextInt(1111)+999;//values between this are generated
             
            proof="proof_"+r_num+ext;//generating random number for images so this name and format of imagewil be stored inside the server
            //creating a file object
            savedFile=new File(file_path+proof);//fn contains name of file
             try
            {
                //writing the file object
                f_item.write(savedFile);  //writing to server means the folder             
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
            
            if(field_name.equals("photo"))//write the name of image here it is img_product
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\Web\\User\\Photo\\";//path for storing image
            Random r=new Random();//to generate random number
             int r_num=r.nextInt(1111)+999;//values between this are generated
             
            fn="photo_"+r_num+ext;//generating random number for images so this name and format of imagewil be stored inside the server
            //creating a file object
            savedFile=new File(file_path+fn);//fn contains name of file
             try
            {
                //writing the file object
                f_item.write(savedFile);  //writing to server means the folder             
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
  
       }
           
           }
   String sel="select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
   ResultSet rs=con.selectCommand(sel);
  if(rs.next()){
       count=Integer.parseInt(rs.getString("user_nomember"));
  }
  if(count!=0){
      
  
   String str1="insert into tbl_member(member_name,member_photo,member_proof,user_id)values('"+value[0]+"','"+fn+"','"+proof+"','"+session.getAttribute("uid")+"')";
   System.out.println(str1);
   out.println(str1);
   
    boolean status=con.executeCommand(str1);
    
    if(status==true)
    {
        count=count-1;
        String up="update tbl_user set user_nomember='"+count+"' where user_id='"+session.getAttribute("uid")+"'";
        con.executeCommand(up);
      %> 
       <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='../User/AddMember.jsp'},40);//40millisecend it go to next page
        </script>
     <%
    }
     }else{
      String selc="select count(member_id) as id from tbl_member where user_id='"+session.getAttribute("uid")+"'";
      ResultSet rsc=con.selectCommand(selc);
      if(rsc.next()){
          count=Integer.parseInt(rs.getString("id"));
          count=count+1;
          String upc="update tbl_user set user_nomember='"+count+"' where user_id='"+session.getAttribute("uid")+"'";
          con.executeCommand(upc);
          
      %> 
       <script type="text/javascript">
            alert("Your Limit Exceeded");
            setTimeout(function(){window.location.href='../User/AddMember.jsp'},40);//40millisecend it go to next page
        </script>
     <%
  }
  }
}

        %>
    </body>
</html>
