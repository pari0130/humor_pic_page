package com.pic.humor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping("/home.do")
	public ModelAndView home(){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("home");
		
		return mView;
	}
	
	
	
	
}


/*private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

*//**
 * Simply selects the home view to render by returning its name.
 *//*
@RequestMapping(value = "/", method = RequestMethod.GET)
public String home(Locale locale, Model model) {
	logger.info("Welcome home! The client locale is {}.", locale);
	
	Date date = new Date();
	DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	String formattedDate = dateFormat.format(date);
	
	model.addAttribute("serverTime", formattedDate );
	
	return "home";
}*/