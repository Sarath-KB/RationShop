package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class QuotaDetails extends AppCompatActivity implements View.OnClickListener {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.id_home) {
            Intent i = new Intent(QuotaDetails.this, Homepage.class);
            startActivity(i);
        }

        if (id == R.id.id_logout) {
            finishAffinity();
            Intent i = new Intent(QuotaDetails.this, Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }


    RecyclerView rv;
    AdapterQuota cadpt;
    List<BeanQuota> lbc;
    String qty[], pname[], photo[];
    String cid;
    String sh_name = "MySh";
    Button btnclick;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quota_details);

        rv = (RecyclerView) findViewById(R.id.recyclerview);
        btnclick = findViewById(R.id.shopclick);

        btnclick.setOnClickListener(this);
        lbc = new ArrayList<>();


        SharedPreferences sh = getSharedPreferences(sh_name, MODE_PRIVATE);
        cid = sh.getString("cardtype", "");


        itemdetails d = new itemdetails();
        d.execute(cid);
    }

    @Override
    public void onClick(View view) {
        Intent i=new Intent(QuotaDetails.this,SearchShop.class);
        startActivity(i);
    }

    public class itemdetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("quotaDetails");
            wb.addProperty("cardtype",params[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            if(s!=("[]")){
                try {
                    JSONArray ja = new JSONArray(s);
                    JSONObject jb;

                    qty = new String[ja.length()];
                    pname = new String[ja.length()];
                    photo = new String[ja.length()];

                    for (int i = 0; i < ja.length(); i++) {
                        jb = ja.getJSONObject(i);
                        qty[i] = jb.getString("qty");
                        pname[i] = jb.getString("pname");
                        photo[i] = jb.getString("photo");


                        BeanQuota cbc = new BeanQuota();

                        cbc.setQty(qty[i]);
                        cbc.setPname(pname[i]);
                        cbc.setImage(photo[i]);


                        lbc.add(cbc);


                    }
                    cadpt = new AdapterQuota(lbc, getApplicationContext());
                    rv.setLayoutManager(new LinearLayoutManager(QuotaDetails.this));
                    rv.setAdapter(cadpt);
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
            else{
                Toast.makeText(getApplicationContext(), "No data found", Toast.LENGTH_SHORT).show();

            }
        }

    }
}