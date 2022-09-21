package com.design;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	@RequestMapping("/home")
	public String Home() {
		return "home";
	}
	
	@RequestMapping("/myMap")
	public String MyMap() {
		return "myMap";
	}
	
	@RequestMapping("/")
	public String MyMapPage() {
		return "myMapPage";
	}
	
	@RequestMapping("/pline")
	public String Polyline() {
		return "polyline";
	}
	
	@RequestMapping("/search")
	public String mapSearch() {
		return "mapSearch";
	}
}
