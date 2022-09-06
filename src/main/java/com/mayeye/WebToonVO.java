package com.mayeye;

import java.util.Comparator;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WebToonVO implements Comparator<WebToonVO>{
	private String week;
	private String title;
	private String link;
	private String imagesrc;
	
	@Override
	public int compare(WebToonVO o1, WebToonVO o2) {
		// TODO Auto-generated method stub
		String tempData1 = (String)o1.getTitle();
		String tempData2 = (String)o2.getTitle();
		return tempData1.compareTo(tempData2);
	}

	@Override
	public String toString() {
		return "WebToonVO [week=" + week + ", title=" + title + ", link=" + link + ", imagesrc=" + imagesrc + "]";
	}
	
}
