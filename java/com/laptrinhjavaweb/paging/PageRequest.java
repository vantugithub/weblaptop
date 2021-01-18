package com.laptrinhjavaweb.paging;

public class PageRequest implements Pageble{
	
	private int page;
	private int maxPageItems;
	Sorter sorter;
	
	public PageRequest(int page, int maxPageItems) {
		super();
		this.page = page;
		this.maxPageItems = maxPageItems;
	}

	@Override
	public int getPage() {
		return this.page;
	}

	@SuppressWarnings("null")
	public int getOffset() {
		if ((Integer)this.page != null && (Integer)this.maxPageItems != null) 
		{
			return (this.page - 1) * this.maxPageItems;
		}
		return (Integer) null;
	}

	@Override
	public int getLimit() {
		return this.maxPageItems;
	}

	@Override
	public Sorter getSorter() {
		if (this.sorter != null) {
			return this.sorter;
		}
		return null;
	}

}
