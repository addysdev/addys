package com.offact.addys.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.offact.framework.constants.CodeConstant;
import com.offact.framework.exception.BizException;
import com.offact.framework.jsonrpc.JSONRpcService;
import com.offact.framework.util.StringUtil;
import com.offact.addys.service.CustomerService;
import com.offact.addys.service.comunity.ComunityService;
import com.offact.addys.vo.CustomerVO;
import com.offact.addys.vo.comunity.ComunityVO;
import com.offact.addys.vo.comunity.CounselVO;

/**
 * Handles requests for the application home page.
 */
@Controller

public class ComunityController {

	private final Logger logger = Logger.getLogger(getClass());
	/*
    * log id 생성 
    */
	public String logid(){
		
		double id=Math.random();
		long t1 = System.currentTimeMillis ( ); 
		
		String logid=""+t1+id;
		
		return logid;
	}
	
	@Value("#{config['offact.host.url']}")
	private String host_url;

	@Autowired
	private CustomerService customerSvc;
	
	@Autowired
	private ComunityService comunitySvc;
	
	
		/**
	     * 글올리기
	     *
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/comunity/commentregistform")
	    public ModelAndView commentRegistForm(HttpServletRequest request, 
	    		                       HttpServletResponse response,
			                           String customerKey) throws BizException 
	    {
	        
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start customerKey:"+customerKey);
	
	        ModelAndView mv = new ModelAndView();
	        
	      	// 사용자 세션정보
	        HttpSession session = request.getSession();
	        
	        String customerName = StringUtil.nvl((String) session.getAttribute("customerName")); 
	        String customerId = StringUtil.nvl((String) session.getAttribute("customerId"));
	        String staffYn = StringUtil.nvl((String) session.getAttribute("staffYn"));
	        
	        if(customerKey.equals("") || customerKey.equals("null") || customerKey.equals(null)){

	 	       	mv.setViewName("/common/customerloginForm");
	       		return mv;
			}

	        mv.setViewName("/comunity/commentRegistForm");
	        
	       //log Controller execute time end
	      	long t2 = System.currentTimeMillis();
	      	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");
	      	
	        return mv;
	    }
    
	    /**
	     * 글올리기
	     * @param UserManageVO
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/comunity/commentregist", method = RequestMethod.POST)
	    public @ResponseBody
	    String commentRegist(@ModelAttribute("comunityVO") ComunityVO comunityVO, 
	    		          HttpServletRequest request, 
	    		          HttpServletResponse response) throws BizException
	    {
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start : ComunityVO" + comunityVO);
			
			int retVal=this.comunitySvc.commentInsert(comunityVO);
			
			//log Controller execute time end
	       	long t2 = System.currentTimeMillis();
	       	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");

	      return ""+retVal;
	    }
	  

	    /**
	     * 상담등록
	     *
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/comunity/counselregistform")
	    public ModelAndView counselRegistForm(HttpServletRequest request, 
	    		                       HttpServletResponse response,
			                           String customerKey) throws BizException 
	    {
	        
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start customerKey:"+customerKey);
	
	        ModelAndView mv = new ModelAndView();
	        
	      	// 사용자 세션정보
	        HttpSession session = request.getSession();
	        
	        String customerName = StringUtil.nvl((String) session.getAttribute("customerName")); 
	        String customerId = StringUtil.nvl((String) session.getAttribute("customerId"));
	        
	        if(customerKey.equals("") || customerKey.equals("null") || customerKey.equals(null)){

	 	       	mv.setViewName("/common/customerloginForm");
	       		return mv;
			}
	
	        mv.setViewName("/comunity/counselRegistForm");
	        
	       //log Controller execute time end
	      	long t2 = System.currentTimeMillis();
	      	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");
	      	
	        return mv;
	    }
    
	    /**
	     * 상담하기
	     * @param UserManageVO
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/comunity/counselregist", method = RequestMethod.POST)
	    public @ResponseBody
	    String counselRegist(@ModelAttribute("counselVO") CounselVO counselVO, 
	    		          HttpServletRequest request, 
	    		          HttpServletResponse response) throws BizException
	    {
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start : counselVO" + counselVO);
			
			int retVal=this.comunitySvc.counselInsert(counselVO);
			
			//이메일 리스틑 조회 user
			
			//email 전송
			
			
			//log Controller execute time end
	       	long t2 = System.currentTimeMillis();
	       	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");

	      return ""+retVal;
	    }
	    
}
