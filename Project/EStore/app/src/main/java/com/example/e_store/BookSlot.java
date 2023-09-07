
package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Calendar;

public class BookSlot extends AppCompatActivity implements View.OnClickListener {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id=item.getItemId();
        if(id==R.id.id_home)
        {
            Intent i=new Intent(BookSlot.this,Homepage.class);
            startActivity(i);
        }

        if(id==R.id.id_logout)
        {
            finishAffinity();
            Intent i=new Intent(BookSlot.this,Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }


    Spinner sp_slot;
    Button submit;
    EditText et_date;

    ArrayAdapter<String> slotlist;

    String slotname[];
    String slotid[] = new String[200];
    String sid,shopid,cid,sdate;
    private int mYear, mMonth, mDay;
    String sh_name="MySh";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_book_slot);

        et_date = findViewById(R.id.et_date);
        sp_slot = findViewById(R.id.sp_slot);
        submit = findViewById(R.id.bookslot);

        Intent i = getIntent();
        shopid = i.getStringExtra("shopid");

        SharedPreferences sh=getSharedPreferences(sh_name,MODE_PRIVATE);
        cid=sh.getString("userid","");

        submit.setOnClickListener(this);

        getSlot t=new getSlot();
        t.execute();



        et_date.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (view == et_date) {
                    final Calendar c = Calendar.getInstance();
                    mYear = c.get(Calendar.YEAR);
                    mMonth = c.get(Calendar.MONTH);
                    mDay = c.get(Calendar.DAY_OF_MONTH);


                    DatePickerDialog datePickerDialog = new DatePickerDialog(BookSlot.this, new DatePickerDialog.OnDateSetListener() {

                        @Override
                        public void onDateSet(DatePicker view, int year,
                                              int monthOfYear, int dayOfMonth) {

                            et_date.setText(year + "-" + (monthOfYear + 1) + "-" +dayOfMonth );
                            //tv_date.setText(dayOfMonth + "-" + (monthOfYear + 1) + "-" + year);

                        }
                    }, mYear, mMonth, mDay);

                    datePickerDialog.show();

                }
            }
        });

    }

    @Override
    public void onClick(View view) {

        sid = slotid[sp_slot.getSelectedItemPosition()];
        sdate = et_date.getText().toString();

        slotbook e = new slotbook();
        e.execute(shopid,cid,sdate,sid);


    }

    public class getSlot extends AsyncTask<String,String,String>
    {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());

            wb.setSoapObject("slotdetails");
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("zz",s);

            try {
                JSONArray j =new JSONArray(s);
                slotid=new String[j.length()];
                slotname=new String[j.length()];
                slotname[0] = "--select-";
                for(int i=0;i<j.length()+1;i++)
                {
                    JSONObject obj=j.getJSONObject(i);
                    slotid[i]=obj.getString("slotid");
                    slotname[i]=obj.getString("slotfrom");

                }


            } catch (JSONException e) {
                e.printStackTrace();
            }



            slotlist=new ArrayAdapter<String>(BookSlot.this,android.R.layout.simple_spinner_item,slotname);
            slotlist.setDropDownViewResource(android.R.layout.simple_spinner_item);
            sp_slot.setAdapter(slotlist);



        }
    }

    class slotbook extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller=new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("selectToken");
            caller.addProperty("shopid",params[0]);
            caller.addProperty("userid",params[1]);
            caller.addProperty("selectdate",params[2]);
            caller.addProperty("slotid",params[3]);
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
            else if(result.equals("Slot Is Already Booked")){
                Toast.makeText(getApplicationContext(), "Slot Is Already Booked", Toast.LENGTH_SHORT).show();

            }
            else{
                Toast.makeText(getApplicationContext(), "Profile Update FAILED", Toast.LENGTH_SHORT).show();
            }

        }

    }



}