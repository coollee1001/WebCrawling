package com.mayeye;

import java.io.IOException;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	private static final String[][] WEEK_INDEX = {
			{"mon", "월요웹툰"},
			{"tue", "화요웹툰"},
			{"wed", "수요웹툰"},
			{"thu", "목요웹툰"},
			{"fri", "금요웹툰"},
			{"sat", "토요웹툰"},
			{"sun", "일요웹툰"},
			{"dailyplus", "매일+웹툰"}			
	};
	
	// 이동
	@GetMapping("/crawling")
	public String startCrawling(Model model) throws IOException, InterruptedException {
		log.info("crawling start");
		
		List<WebToonVO> list = new ArrayList<WebToonVO>();
		
		for(String[] week : WEEK_INDEX) {
			String address = "https://comic.naver.com/webtoon/weekdayList?week=" + week[0];
			Document rawData = Jsoup.connect(address).timeout(5000).get();
			Elements links = rawData.select("ul.img_list dl dt a");			
			
			for(Element link : links) {
				WebToonVO webVO = new WebToonVO();	
				log.info("link : {}", link.attr("href"));
				log.info("title : {}", link.attr("title"));
				webVO.setWeek(week[1]);
				webVO.setTitle(link.attr("title"));
				webVO.setLink("https://comic.naver.com"+link.attr("href"));
				list.add(webVO);
			}
		}
		
		ArrayList<String> map = new ArrayList<String>();
		for(String[] week : WEEK_INDEX) {
			map.add(week[1]);
		}
		// 제목순으로 정렬
		Collections.sort(list, new WebToonVO());
		
		model.addAttribute("map", list);
		model.addAttribute("week_index", map);
		
		return "crawling";
	}
	
	
}
