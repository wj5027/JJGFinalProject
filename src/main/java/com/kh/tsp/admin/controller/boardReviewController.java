package com.kh.tsp.admin.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class boardReviewController {

	@RequestMapping(value = "/boardReview.ad", method = RequestMethod.GET)
	public String boardReview() {
		
		return "admin/board/BoardReview";
	}
	
}
