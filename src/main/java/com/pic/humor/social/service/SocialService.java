package com.pic.humor.social.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface SocialService {
	public ModelAndView twSigninService(HttpServletRequest request);
	public ModelAndView twCallbackService(HttpServletRequest request, HttpServletResponse reponse) throws IOException;
	public boolean canUse(String paramData, HttpServletRequest request);
	public boolean saveTwPath(String path, HttpServletRequest request);
}
