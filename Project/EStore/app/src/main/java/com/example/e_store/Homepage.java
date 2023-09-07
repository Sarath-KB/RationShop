package com.example.e_store;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

public class Homepage extends AppCompatActivity {


    public boolean onCreateOptionsMenu(Menu menu) {

        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.menu,menu);
        return super.onCreateOptionsMenu(menu);
    }
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id=item.getItemId();
        if(id==R.id.id_home)
        {
            Intent i=new Intent(Homepage.this,Homepage.class);
            startActivity(i);
        }

        if(id==R.id.id_logout)
        {
            finishAffinity();
            Intent i=new Intent(Homepage.this,Login.class);
            startActivity(i);

        }
        return super.onOptionsItemSelected(item);
    }

    CardView quota,updateCard,addMember,cardRequest,slot,mprofile;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_homepage);
        quota = findViewById(R.id.cardquota);
        updateCard = findViewById(R.id.cardupdate);
        addMember = findViewById(R.id.cardmember);
        cardRequest = findViewById(R.id.cardrequest);
        slot = findViewById(R.id.cardslot);
        mprofile = findViewById(R.id.cardmyproile);



        quota.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Homepage.this,QuotaDetails.class);
                startActivity(i);
            }
        });

        updateCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Homepage.this,UpdateCard.class);
                startActivity(i);
            }
        });


        slot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Homepage.this,ViewSlot.class);
                startActivity(i);
            }
        });

        addMember.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Homepage.this,AddMember.class);
                startActivity(i);
            }
        });

        cardRequest.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Homepage.this,CardRequest.class);
                startActivity(i);
            }
        });


        mprofile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Homepage.this,UserProfile.class);
                startActivity(i);
            }
        });


    }
}