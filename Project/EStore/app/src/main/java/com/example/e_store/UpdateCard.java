package com.example.e_store;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class UpdateCard extends AppCompatActivity implements View.OnClickListener {

    EditText cardNo;
    Spinner sp_type;
    Button submit;

    ArrayAdapter<String> typelist;
    String typename[];
    String seltypeid[] = new String[200];

    String typeid,tname,cid;

    String sh_name="MySh";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update_card);
        cardNo = findViewById(R.id.et_cardno);
        sp_type = findViewById(R.id.sp_type);

        submit = findViewById(R.id.updateCard);
        submit.setOnClickListener(this);

        SharedPreferences sh=getSharedPreferences(sh_name,MODE_PRIVATE);
        cid=sh.getString("userid","");

        getType t=new getType();
        t.execute();
    }

    @Override
    public void onClick(View view) {

        String cardn = cardNo.getText().toString();
        typeid = seltypeid[sp_type.getSelectedItemPosition()];

        updateCarddetails s=new updateCarddetails();
        s.execute(cid,cardn,typeid);
    }


    public class getType extends AsyncTask<String,String,String>
    {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());

            wb.setSoapObject("cardtype");
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Log.d("zz",s);

            try {
                JSONArray j =new JSONArray(s);
                seltypeid=new String[j.length()];
                typename=new String[j.length()];
                typename[0] = "--select-";
                for(int i=0;i<j.length();i++)
                {
                    JSONObject obj=j.getJSONObject(i);
                    seltypeid[i]=obj.getString("typeid");
                    typename[i]=obj.getString("typename");

                }


            } catch (JSONException e) {
                e.printStackTrace();
            }

            typelist=new ArrayAdapter<String>(UpdateCard.this,android.R.layout.simple_spinner_item,typename);
            typelist.setDropDownViewResource(android.R.layout.simple_spinner_item);
            sp_type.setAdapter(typelist);


        }
    }

    class updateCarddetails extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller=new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("updatecard");
            caller.addProperty("userid",params[0]);
            caller.addProperty("cardnumber",params[1]);
            caller.addProperty("cardtype",params[2]);

            caller.callWebService();
            String res= caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);
            if(result.equals("Success")){
                Toast.makeText(getApplicationContext(), "Update Successful", Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),Homepage.class);
                startActivity(intent);
            }
            else{
                Toast.makeText(getApplicationContext(), "Update FAILED", Toast.LENGTH_SHORT).show();
            }

        }

    }


}