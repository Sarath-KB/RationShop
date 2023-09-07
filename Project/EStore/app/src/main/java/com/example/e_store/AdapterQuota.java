package com.example.e_store;

import android.content.Context;
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

public class AdapterQuota extends  RecyclerView.Adapter<AdapterQuota.MyViewHolder>{

    Context context;
    BeanQuota cbc;
    List<BeanQuota> lcb;

    public AdapterQuota(List<BeanQuota> lbc, Context applicationContext) {
        this.lcb=lbc;
        this.context=applicationContext;
    }

    @NonNull
    @Override
    public AdapterQuota.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView= LayoutInflater.from(parent.getContext()).inflate(R.layout.single_quota,parent,false);
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull AdapterQuota.MyViewHolder holder, int position) {

        cbc=lcb.get(position);
        holder.pname.setText(cbc.getPname());
        holder.qty.setText(cbc.getQty());
        String imgurl="http://192.168.1.6:8084/PDS/Admin/Photo/"+cbc.getImage();
        Picasso.get().load(imgurl).into(holder.photo);

    }

    @Override
    public int getItemCount() {
        return lcb.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView pname,qty;
        ImageView photo;

        public MyViewHolder(@NonNull View itemView) {

            super(itemView);
            pname=(TextView)itemView.findViewById(R.id.name);
            photo=(ImageView)itemView.findViewById(R.id.shopimage);
            qty=(TextView) itemView.findViewById(R.id.qty);

        }
    }
}
