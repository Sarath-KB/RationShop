package com.example.e_store;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.List;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class AdapterSlot extends  RecyclerView.Adapter<AdapterSlot.MyViewHolder> {

    Context context;
    beanSlot cbc;
    List<beanSlot> lcb;

    public AdapterSlot(List<beanSlot> lbc, Context applicationContext) {
        this.lcb=lbc;
        this.context=applicationContext;
    }
    @NonNull
    @Override
    public AdapterSlot.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView= LayoutInflater.from(parent.getContext()).inflate(R.layout.single_generateslot,parent,false);
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull AdapterSlot.MyViewHolder holder, int position) {

        cbc=lcb.get(position);
        holder.pname.setText(cbc.getShopname());
        String imgurl="http://192.168.1.4:8080/PDS/Shopkeeper/Images/"+cbc.getShopimage();

        Picasso.get().load(imgurl).into(holder.photo);

    }

    @Override
    public int getItemCount() {
        return lcb.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        TextView pname;
        ImageView photo;
        Button btngenerate,btnfeedback,btncomplaint;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            pname=(TextView)itemView.findViewById(R.id.sh_name);
            photo=(ImageView)itemView.findViewById(R.id.shopimage);
            btngenerate=(Button)itemView.findViewById(R.id.genrate);
            btnfeedback=(Button)itemView.findViewById(R.id.feedback);
            btncomplaint=(Button)itemView.findViewById(R.id.complaint);
            btngenerate.setOnClickListener(this);
            btnfeedback.setOnClickListener(this);
            btncomplaint.setOnClickListener(this);
        }

        @Override
        public void onClick(View view) {
            int a=getAdapterPosition();

            cbc=lcb.get(a);
            String shopid=cbc.getShopid();

            if(view == btngenerate){
                Intent i=new Intent(context,BookSlot.class);
                i.putExtra("shopid",shopid);
                view.getContext().startActivity(i);
            }
           else if(view == btnfeedback){
                Intent i=new Intent(context,Feedback.class);
                i.putExtra("shopid",shopid);
                view.getContext().startActivity(i);
            }
           else if(view == btncomplaint){
                Intent i=new Intent(context,Complaint.class);
                i.putExtra("shopid",shopid);
                view.getContext().startActivity(i);
            }
        }
    }
}
