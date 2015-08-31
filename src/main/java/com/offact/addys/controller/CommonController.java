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

/**
 * Handles requests for the application home page.
 */
@Controller

public class CommonController {

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
	 * Simply selects the home view to render by returning its name.
	 * @throws BizException
	 */
	@RequestMapping(value = "/customerloginform", method = RequestMethod.GET)
	public ModelAndView customerLoginForm(HttpServletRequest request,
			                   HttpServletResponse response,  
			                   Model model, 
			                   Locale locale) throws BizException 
	{

		logger.info("Welcome customer");
		
		ModelAndView  mv = new ModelAndView();

		mv.setViewName("common/customerLoginForm");

		return mv;
	}
	
	/**
	 * Login 처리
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("null")
	@RequestMapping(value = "/customer/login", method = RequestMethod.POST)
	public ModelAndView addyslogin(HttpServletRequest request,
			                       HttpServletResponse response) throws Exception
	{
		
		//log Controller execute time start
		String logid=logid();
		long t1 = System.currentTimeMillis();
		logger.info("["+logid+"] Controller start");
		
		ModelAndView  mv = new ModelAndView();
		
		String customerKey = StringUtil.nvl(request.getParameter("customerKey"));
		String customerId = StringUtil.nvl(request.getParameter("customerId"));
		
		logger.info(">>>> customerKey :"+customerKey);
		logger.info(">>>> customerId :"+customerId);
		
		String ip = request.getHeader("X-Forwarded-For");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 

		    ip = request.getHeader("Proxy-Client-IP"); 
		    logger.info(">>>> Proxy-Client-IP :"+ip);

		} 

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 

		    ip = request.getHeader("WL-Proxy-Client-IP"); 
		    logger.info(">>>> WL-Proxy-Client-IP :"+ip);

		} 

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 

		    ip = request.getHeader("HTTP_CLIENT_IP"); 
		    logger.info(">>>> HTTP_CLIENT_IP :"+ip);

		} 

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 

		    ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
		    logger.info(">>>> HTTP_X_FORWARDED_FOR :"+ip);

		} 

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 

		    ip = request.getRemoteAddr(); 
		    logger.info(">>>> RemoteAddr :"+ip);

		}

		String strMainUrl = "";
		
		// # 2. 넘겨받은 아이디로 데이터베이스를 조회하여 사용자가 있는지를 체크한다.
		CustomerVO customerVo = new CustomerVO();
		customerVo.setCustomerKey(customerKey);
		customerVo.setCustomerId(customerId);
		
		CustomerVO customerChk = customerSvc.getCustomer(customerVo);		

		String customerName = "";
		String customerKey1 = "";
		String customerKey2 = "";
		String customerKey3 = "";
		String customerKey4 = "";
		String customerKey5 = "";
		String customerKey6 = "";
		String customerKey7 = "";
		String customerKey8 = "";
		String customerKey9 = "";
		String customerKey10 = "";
	
		if(customerChk != null)
		{
			//패스워드 체크
			if(!customerId.equals(customerChk.getCustomerId())){
				
				logger.info(">>> 고객번호 오류");
				strMainUrl = "common/loginFail";
				
				mv.addObject("customerKey", customerKey);
				
				mv.setViewName(strMainUrl);
				
				//log Controller execute time end
		      	long t2 = System.currentTimeMillis();
		      	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");
		      	
				return mv;
				
			}

			customerName = customerChk.getCustomerName();
			customerKey1 = customerChk.getCustomerKey1();
			customerKey2 = customerChk.getCustomerKey2();
			customerKey3 = customerChk.getCustomerKey3();
			customerKey4 = customerChk.getCustomerKey4();
			customerKey5 = customerChk.getCustomerKey5();
			customerKey6 = customerChk.getCustomerKey6();
			customerKey7 = customerChk.getCustomerKey7();
			customerKey8 = customerChk.getCustomerKey8();
			customerKey9 = customerChk.getCustomerKey9();
			customerKey10 = customerChk.getCustomerKey10();

			// # 3. Session 객체에 셋팅
			
			HttpSession session = request.getSession(false);
			
			if(session != null)
			{
				session.invalidate();
			}
				
				session = request.getSession(true);
				session.setAttribute("customerKey", customerKey);
				session.setAttribute("customerId", customerId);
				session.setAttribute("customerName", customerName);
				session.setAttribute("customerKey1", customerKey1);
				session.setAttribute("customerKey2", customerKey2);
				session.setAttribute("customerKey3", customerKey3);
				session.setAttribute("customerKey4", customerKey4);
				session.setAttribute("customerKey5", customerKey5);
				session.setAttribute("customerKey6", customerKey6);
				session.setAttribute("customerKey7", customerKey7);
				session.setAttribute("customerKey8", customerKey8);
				session.setAttribute("customerKey9", customerKey9);
				session.setAttribute("customerKey10", customerKey10);

				mv.addObject("customerKey", customerKey);
				strMainUrl = "comunity/comunityManage";
					
			} else {//고객 정보가 없는경우
	
				logger.info(">>> 고객 정보 없음");
				strMainUrl = "common/loginFail";

			}
			
		  
			mv.addObject("customerKey", customerKey);
			
			mv.setViewName(strMainUrl);
			
			//log Controller execute time end
	      	long t2 = System.currentTimeMillis();
	      	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");
	      	
			return mv;
		}
	
}
