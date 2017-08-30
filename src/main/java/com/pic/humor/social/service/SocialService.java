package com.pic.humor.social.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface SocialService {
	public ModelAndView twSigninService(HttpServletRequest request);
	public ModelAndView twCallbackService(HttpServletRequest request);
	public boolean canUse(String paramData, HttpServletRequest request);
}
