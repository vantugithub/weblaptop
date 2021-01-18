package com.laptrinhjavaweb.file;

import java.util.ArrayList;
import java.util.List;

public class ImageRequest implements FileAbs{
	
	@Override
	public List<String> getImage(String s) {
		List<String> strImage = new ArrayList<String>();
		String [] words = s.split(";"); 
		for(String w : words) {
			strImage.add(w);
		}
		return strImage;
	}

}
