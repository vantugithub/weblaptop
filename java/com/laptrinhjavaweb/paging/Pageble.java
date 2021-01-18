package com.laptrinhjavaweb.paging;

public interface Pageble {
	int getPage();
	int getOffset();
	int getLimit();
	Sorter getSorter();
}
