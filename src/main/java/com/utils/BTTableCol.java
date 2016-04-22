package com.utils;

public class BTTableCol {

	public BTTableCol(String field, String title) {
		super();
		this.field = field;
		this.title = title;
	}

	public BTTableCol() {
		super();
	}

	private String field;
	private String title;

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
