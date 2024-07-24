package com.todo.Main.TodoModel;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//Model Class for ToDo Add
public class Todo {
	private int id;
	private String todoname;
	private Date date;
	private String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTodoname() {
		return todoname;
	}
	public void setTodoname(String todoname) {
		this.todoname = todoname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setDate(String dateStr) {
	    if (dateStr != null && !dateStr.isEmpty()) {
	        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	        try {
	            this.date = formatter.parse(dateStr);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	    } else {
	        // Handle the case where dateStr is null or empty
	        System.out.println("Date string is null or empty");
	    }
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	
	}
}
