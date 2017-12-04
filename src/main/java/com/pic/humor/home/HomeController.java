package com.pic.humor.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response){
		// twitter login에 대한 url 받아서 home에 넘겨주기
		ModelAndView mView=socialService.twSigninService(request);
		/*System.out.println("alert Msg : " + alertMsg);*/
    	// callback page 이동 후 요청 url로 이동할때 msg를 띄우기 위함
    	
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