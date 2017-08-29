package com.pic.humor.social.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface SocialService {
	public ModelAndView twitterSignin(HttpServletRequest request);
}
