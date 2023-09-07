package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SearchShop extends AppCompatActivity implements View.OnClickListener, AdapterView.OnItemSelectedListener {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id=item.getItemId();
        if(id==R.id.id_home)
        {
            Intent i=new Intent(SearchShop.this,Homepage.class);
            startActivity(i);
        }

        if(id==R.id.id_logout)
        {
            finishAffinity();
            Intent i=new Intent(SearchShop.this,Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }

    Spinner sp_district,sp_place,sp_location;
    Button search;

    ArrayAdapter<String> distlist;
    ArrayAdapter<String> placelist;
    ArrayAdapter<String> loclist;
    String distname[],placename[],locname[];
    String distid[] = new String[200];
    String placeid[] = new String[200];
    String locid[] = new String[200];

    String did,pid,lid;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search_shop);
        sp_district = findViewById(R.id.sp_district);
        sp_place = findViewById(R.id.sp_place);
        sp_location = findViewById(R.id.sp_location);

        search = findViewById(R.id.btn_search);

        search.setOnClickListener(this);

        getDistrict t=new getDistrict();
        t.execute();



        sp_district.setOnItemSelectedListener(this);
        sp_place.setOnItemSelectedListener(this);
        sp_location.setOnItemSelectedListener(this);


    }

    @Override
    public void onClick(View view) {
        lid = locid[sp_location.getSelectedItemPosition()];
        Intent i=new Intent(SearchShop.this,GenerateSlot.class);
        i.putExtra("locid",lid);
        startActivity(i);
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {

        switch (adapterView.getId()) {

            case R.id.sp_district:
                did = distid[sp_district.getSelectedItemPosition()];
                getPlace t = new getPlace();
                t.execute(did);
                break;
            case R.id.sp_place:
                pid = placeid[sp_place.getSelectedItemPosition()];
                getLoc ts = new getLoc();
                ts.execute(pid);
                break;



        }


        }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

        Toast.makeText(this, "You selected nothing", Toast.LENGTH_SHORT).show();


    }

    public class getDistrict extends AsyncTask<String,String,String>
    {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());

            wb.setSoapObject("districtdetails");
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("zz",s);

            try {
                JSONArray j =new JSONArray(s);
                distid=new String[j.length()];
                distname=new String[j.length()];
                distname[0] = "--select-";
                for(int i=0;i<j.length()+1;i++)
                {
                    JSONObject obj=j.getJSONObject(i);
                    distid[i]=obj.getString("distid");
                    distname[i]=obj.getString("distname");

                }


            } catch (JSONException e) {
                e.printStackTrace();
            }



            distlist=new ArrayAdapter<String>(SearchShop.this,android.R.layout.simple_spinner_item,distname);
            distlist.setDropDownViewResource(android.R.layout.simple_spinner_item);
            sp_district.setAdapter(distlist);



        }
    }

    public class getPlace extends AsyncTask<String,String,String>
    {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());

            wb.setSoapObject("placedetails");
            wb.addProperty("districtid",strings[0]);
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("zz",s);

            try {
                JSONArray j =new JSONArray(s);
                placeid=new String[j.length()];
                placename=new String[j.length()];
//                placename[0] = "--select-";
                for(int i=0;i<j.length();i++)
                {
                    JSONObject obj=j.getJSONObject(i);
                    placeid[i]=obj.getString("placeid");
                    placename[i]=obj.getString("placename");

                }


            } catch (JSONException e) {
                e.printStackTrace();
            }



            placelist=new ArrayAdapter<String>(SearchShop.this,android.R.layout.simple_spinner_item,placename);
            placelist.setDropDownViewResource(android.R.layout.simple_spinner_item);
            sp_place.setAdapter(placelist);



        }
    }

    public class getLoc extends AsyncTask<String,String,String>
    {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());

            wb.setSoapObject("locationdetails");
            wb.addProperty("placeid",strings[0]);
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("zz",s);

            try {
                JSONArray j =new JSONArray(s);
                locid=new String[j.length()];
                locname=new String[j.length()];
               // locname[0] = "--select-";
                for(int i=0;i<j.length();i++)
                {
                    JSONObject obj=j.getJSONObject(i);
                    locid[i]=obj.getString("locid");
                    locname[i]=obj.getString("locname");

                }


            } catch (JSONException e) {
                e.printStackTrace();
            }



            loclist=new ArrayAdapter<String>(SearchShop.this,android.R.layout.simple_spinner_item,locname);
            loclist.setDropDownViewResource(android.R.layout.simple_spinner_item);
            sp_location.setAdapter(loclist);


        }
    }
}