package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {

	
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookId(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBook();
	
	public List<BookDtls> getOldsBook();
	
	
	public List<BookDtls> getAllNewBook();
	
	public List<BookDtls> getAllRecentBook();
	
	public List<BookDtls> getAllOldsBook();
	
	
	public List<BookDtls> getBookByOld(String email,String cate);
	
	
	public boolean OldBookDelete(String cate,int id);
	
	public List<BookDtls> getBookBySearch(String ch);
	
	
	
	
	
}
