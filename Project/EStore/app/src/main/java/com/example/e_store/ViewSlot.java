package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ViewSlot extends AppCompatActivity implements View.OnClickListener {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id=item.getItemId();
        if(id==R.id.id_home)
        {
            Intent i=new Intent(ViewSlot.this,Homepage.class);
            startActivity(i);
        }

        if(id==R.id.id_logout)
        {
            finishAffinity();
            Intent i=new Intent(ViewSlot.this,Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }


    TextView slotno,shopname,slotdate;
    Button cancelbooking;

    String cid,slot_no,shop_name,slot_date,slot_id;
    String sh_name="MySh";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_slot);
        slotno = findViewById(R.id.slotno);
        shopname = findViewById(R.id.shopname);
        slotdate = findViewById(R.id.slotdate);
        cancelbooking = findViewById(R.id.cancelbooking);

        SharedPreferences sh=getSharedPreferences(sh_name,MODE_PRIVATE);
        cid=sh.getString("userid","");

        viewSlot a=new viewSlot();
        a.execute(cid);

        cancelbooking.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {
        cancelBooking e = new cancelBooking();
        e.execute(slot_id);
    }

    class cancelBooking extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller=new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("cancelbooking");
            caller.addProperty("slotid",params[0]);
            caller.callWebService();
            String res= caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            if(result.equals("Your Booking Canceled")){
                Toast.makeText(getApplicationContext(), "Your Booking Cancelled", Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),Homepage.class);
                startActivity(intent);
            }
            else{
                Toast.makeText(getApplicationContext(), "Failed", Toast.LENGTH_SHORT).show();
            }

        }

    }


    public class viewSlot extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb= new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("viewslot");
            wb.addProperty("userid",cid);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
             if(s!=("[]")){
                 JSONArray job= null;
                 try{
                     job=new JSONArray(s);
                     JSONObject jo=job.getJSONObject(0);
                     slot_no=jo.getString("time");
                     shop_name=jo.getString("shop");
                     slot_date=jo.getString("date");
                     slot_id=jo.getString("slotid");
                     slotno.setText(slot_no);
                     shopname.setText(sh_name);
                     slotdate.setText(slot_date);

                 }catch(JSONException e){
                     e.printStackTrace();
                 }
             }
             else{
                 Toast.makeText(getApplicationContext(), "No data found", Toast.LENGTH_SHORT).show();

             }

        }
    }
}