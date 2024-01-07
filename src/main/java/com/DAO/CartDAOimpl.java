package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public class CartDAOimpl implements CartDAO{

	private Connection conn;
	
	public CartDAOimpl(Connection conn)
	{
		this.conn=conn;
	}
	
	
	public boolean addCart(Cart c) {
		
		boolean f=false;
		try {
			String sql="insert into cart(bid,uid,bookName,author,price,totalPrice) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,c.getBid());
			ps.setInt(2,c.getUserId());
			ps.setString(3,c.getBookName());
			ps.setString(4,c.getAuthor());
			ps.setDouble(5,c.getPrice());
		ps.setDouble(6, c.getTotalPrice());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}



	public List<Cart> getBookById(int userId) {
	List<Cart> list=new ArrayList<Cart>();
		Cart b=null;
		Double TotalPrice=0.0;
		
		try {
			String sql="select *  from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,userId);
			
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new Cart();
			    b.setCid(rs.getInt(1));
				b.setBid(rs.getInt(2));
				b.setUserId(rs.getInt(3));
				b.setBookName(rs.getString(4));
				b.setAuthor(rs.getString(5));
				b.setPrice(rs.getDouble(6));
				TotalPrice=TotalPrice+(rs.getDouble(7));
				b.setTotalPrice(TotalPrice);
				list.add(b);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}


	
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean f=false;

		
		try {
			String sql="delete  from cart where bid=? and uid=? and cid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,bid); 
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
			
			
		
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return f;
	}

	

}
