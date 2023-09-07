
package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Complaint extends AppCompatActivity implements View.OnClickListener {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id=item.getItemId();
        if(id==R.id.id_home)
        {
            Intent i=new Intent(Complaint.this,Homepage.class);
            startActivity(i);
        }

        if(id==R.id.id_logout)
        {
            finishAffinity();
            Intent i=new Intent(Complaint.this,Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }


    String shopid,cid,fcontent;
    String sh_name="MySh";
    EditText et_comp;
    Button btncomplaint;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_complaint);

        Intent i = getIntent();
        shopid = i.getStringExtra("shopid");

        SharedPreferences sh=getSharedPreferences(sh_name,MODE_PRIVATE);
        cid=sh.getString("userid","");

        et_comp = findViewById(R.id.et_complaint);
        btncomplaint = findViewById(R.id.btncomplaint);

        btncomplaint.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        fcontent = et_comp.getText().toString();
        complaintDetails d = new complaintDetails();
        d.execute(cid,shopid,fcontent);
    }


    class complaintDetails extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller=new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("complaint");
            caller.addProperty("userid",params[0]);
            caller.addProperty("shopid",params[1]);
            caller.addProperty("content",params[2]);

            caller.callWebService();
            String res= caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            if(result.equals("Success")){
                Toast.makeText(getApplicationContext(), "Success", Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),Homepage.class);
                startActivity(intent);
            }
            else{
                Toast.makeText(getApplicationContext(), "Failed", Toast.LENGTH_SHORT).show();
            }

        }

    }
}