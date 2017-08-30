package com.pic.humor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pic.humor.social.service.SocialService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SocialService socialService;
	
	@RequestMapping({"/home.do", "/"})
	public ModelAndView home(HttpServletRequest request){
		// twitter login에 대한 url 받아서 home에 넘겨주기
		ModelAndView mView=socialService.twSigninService(request);
		
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