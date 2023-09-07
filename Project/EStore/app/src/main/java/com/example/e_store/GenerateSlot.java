package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class GenerateSlot extends AppCompatActivity {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.id_home) {
            Intent i = new Intent(GenerateSlot.this, Homepage.class);
            startActivity(i);
        }

        if (id == R.id.id_logout) {
            finishAffinity();
            Intent i = new Intent(GenerateSlot.this, Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }


    RecyclerView rv;
    AdapterSlot cadpt;
    List<beanSlot> lbc;
    String pid[], pname[], photo[];
    String locid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_generate_slot);

        rv = (RecyclerView) findViewById(R.id.recyclerview);
        lbc = new ArrayList<>();

        Intent i = getIntent();
        locid = i.getStringExtra("locid");

        itemdetails d = new itemdetails();
        d.execute(locid);

    }

    public class itemdetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("shopdetails");
            wb.addProperty("locationid",params[0]);
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

                    pid = new String[ja.length()];
                    pname = new String[ja.length()];
                    photo = new String[ja.length()];

                    for (int i = 0; i < ja.length(); i++) {
                        jb = ja.getJSONObject(i);
                        pid[i] = jb.getString("shopid");
                        pname[i] = jb.getString("shopname");
                        photo[i] = jb.getString("shopimage");


                        beanSlot cbc = new beanSlot();

                        cbc.setShopid(pid[i]);
                        cbc.setShopname(pname[i]);
                        cbc.setShopimage(photo[i]);


                        lbc.add(cbc);


                    }
                    cadpt = new AdapterSlot(lbc, getApplicationContext());
                    rv.setLayoutManager(new LinearLayoutManager(GenerateSlot.this));
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