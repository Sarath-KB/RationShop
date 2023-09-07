package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class EditProfile extends AppCompatActivity {

    EditText name,contact,email,address;
    String cid,cname,caddress,ccontact,cemail;
    String ename,eaddress,eemail,econtact;
    Button editButton;

    String sh_name="MySh";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);

        name = findViewById(R.id.et_ename);
        contact = findViewById(R.id.et_econtact);
        email = findViewById(R.id.et_eemail);
        address = findViewById(R.id.et_eaddress);
        editButton = findViewById(R.id.editbutton);

        SharedPreferences sh=getSharedPreferences(sh_name,MODE_PRIVATE);
        cid=sh.getString("userid","");

        myprofile a=new myprofile();
        a.execute(cid);

        editButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ename = name.getText().toString();
                eaddress = address.getText().toString();
                eemail = email.getText().toString();
                econtact = contact.getText().toString();

                Editprofile e = new Editprofile();
                e.execute(cid,ename,eaddress,econtact,eemail);


            }
        });

    }

    public class myprofile extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb= new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("myprofile");
            wb.addProperty("userid",cid);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray job= null;
            try{
                job=new JSONArray(s);
                JSONObject jo=job.getJSONObject(0);
                cname=jo.getString("name");
                caddress=jo.getString("address");
                ccontact=jo.getString("contact");
                cemail=jo.getString("email");


                name.setText(cname);
                contact.setText(ccontact);
                email.setText(cemail);
                address.setText(caddress);


            }catch(JSONException e){
                e.printStackTrace();
            }

        }
    }

    class Editprofile extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller=new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("editprofile");
            caller.addProperty("userid",params[0]);
            caller.addProperty("username",params[1]);
            caller.addProperty("useraddress",params[2]);
            caller.addProperty("usercontact",params[3]);
            caller.addProperty("useremail",params[4]);


            caller.callWebService();
            String res= caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            if(result.equals("Success")){
                Toast.makeText(getApplicationContext(), "Profile Update Successful", Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),Homepage.class);
                startActivity(intent);
            }
            else{
                Toast.makeText(getApplicationContext(), "Profile Update FAILED", Toast.LENGTH_SHORT).show();
            }

        }

    }

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id=item.getItemId();
        if(id==R.id.id_home)
        {
            Intent i=new Intent(EditProfile.this,Homepage.class);
            startActivity(i);
        }

        if(id==R.id.id_logout)
        {
            finishAffinity();
            Intent i=new Intent(EditProfile.this,Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }
}