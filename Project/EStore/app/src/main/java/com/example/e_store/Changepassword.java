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
import android.widget.Toast;

public class Changepassword extends AppCompatActivity {

    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id=item.getItemId();
        if(id==R.id.id_home)
        {
            Intent i=new Intent(Changepassword.this,Homepage.class);
            startActivity(i);
        }

        if(id==R.id.id_logout)
        {
            finishAffinity();
            Intent i=new Intent(Changepassword.this,Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }

    Button changeButton;
    EditText oldpwd,newpwd,cpwd;
    String oldpwd1,newpwd1,cpwd1,cid;
    String sh_name="MySh";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_changepassword);

        oldpwd = findViewById(R.id.currentpwd);
        newpwd = findViewById(R.id.newpwd);
        cpwd = findViewById(R.id.confirmpwd);
        changeButton = findViewById(R.id.change);
        SharedPreferences sh=getSharedPreferences(sh_name,MODE_PRIVATE);
        cid=sh.getString("userid","");

        changeButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                oldpwd1 = oldpwd.getText().toString();
                newpwd1 = newpwd.getText().toString();
                cpwd1 = cpwd.getText().toString();

                if(newpwd1.equals(cpwd1)) {
                    Changepwd s = new Changepwd();
                    s.execute(oldpwd1,newpwd1,cpwd1,cid);
                }
                else{
                    Toast.makeText(getApplicationContext(), "please confirm your password!", Toast.LENGTH_SHORT).show();
                }


            }
        });


    }


    class Changepwd extends AsyncTask<String,String,String> {
        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller caller = new WebServiceCaller(getApplicationContext());
            caller.setSoapObject("changepassword");
            caller.addProperty("currentpassword", params[0]);
            caller.addProperty("newpassword", params[1]);
            caller.addProperty("confirmpassword", params[2]);
            caller.addProperty("userid", params[3]);


            caller.callWebService();
            String res = caller.getResponse();
            return res;
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);

            if(result.equals("Fail"))
            {
                Toast.makeText(getApplicationContext(), "Incorrect Password", Toast.LENGTH_SHORT).show();
            }
            else
            {
                Toast.makeText(getApplicationContext(), "Password Changed Successfully", Toast.LENGTH_SHORT).show();
                Intent intent=new Intent(getApplicationContext(),Homepage.class);
                startActivity(intent);
            }

            //Toast.makeText(getApplicationContext(), result, Toast.LENGTH_LONG).show();
        }

    }



}