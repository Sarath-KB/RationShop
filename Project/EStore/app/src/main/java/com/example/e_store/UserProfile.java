package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
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

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class UserProfile extends AppCompatActivity {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.id_home) {
            Intent i = new Intent(UserProfile.this, Homepage.class);
            startActivity(i);
        }

        if (id == R.id.id_logout) {
            finishAffinity();
            Intent i = new Intent(UserProfile.this, Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }

    EditText name, contact, email, address;
    Button btnedit, btnchange;
    ImageView image;
    String cid, cname, caddress, ccontact, cemail, cphoto;
    String ip;

    String sh_name = "MySh";
    Context context;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_profile);

        name = findViewById(R.id.et_fullname);
        contact = findViewById(R.id.et_mcontact);
        email = findViewById(R.id.et_memail);
        image = findViewById(R.id.photo);
        address = findViewById(R.id.et_maddress);
        btnchange = findViewById(R.id.password);
        btnedit = findViewById(R.id.edit);

        btnchange.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(UserProfile.this, Changepassword.class);
                startActivity(i);
            }
        });
        btnedit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(UserProfile.this, EditProfile.class);
                startActivity(i);
            }
        });
        SharedPreferences sh = getSharedPreferences(sh_name, MODE_PRIVATE);
        cid = sh.getString("userid", "");

        myprofile a = new myprofile();
        a.execute(cid);
    }


    public class myprofile extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("myprofile");
            wb.addProperty("userid", cid);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray job = null;
            try {
                job = new JSONArray(s);
                JSONObject jo = job.getJSONObject(0);
                cname = jo.getString("name");
                cphoto = jo.getString("photo");
                caddress = jo.getString("address");
                ccontact = jo.getString("contact");
                cemail = jo.getString("email");


                name.setText(cname);
                contact.setText(ccontact);
                email.setText(cemail);
                address.setText(caddress);

                Picasso.get().load("http://192.168.1.4:8080/PDS/User/Photo/" + cphoto).into(image);


            } catch (JSONException e) {
                e.printStackTrace();
            }

        }
    }
}