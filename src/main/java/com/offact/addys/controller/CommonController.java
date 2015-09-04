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
		
		// 사용자 세션정보
        HttpSession session = request.getSession();
        
        String customerKey = StringUtil.nvl((String) session.getAttribute("customerKey")); 
        
        logger.info("customerKey:"+customerKey);
        
        if(customerKey.equals("") || customerKey.equals("null") || customerKey.equals(null)){

 	       	mv.setViewName("/common/customerLoginForm");
       		return mv;
		}

		mv.setViewName("comunity/comunityManage");

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
		String customerPw = StringUtil.nvl(request.getParameter("customerPw"));
		
		logger.info(">>>> customerKey :"+customerKey);
		logger.info(">>>> customerPw :"+customerPw);
		
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
		customerVo.setInCustomerPw(customerPw);
		
		CustomerVO customerChk = customerSvc.getCustomer(customerVo);		

		String customerId = "";
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
		String staffYn = "N";
	
		if(customerChk != null)
		{

			//패스워드 체크
			if(!customerChk.getCustomerPw().equals(customerChk.getInCustomerPw())){
				
				logger.info(">>> 비밀번호 오류");
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
			staffYn=customerChk.getStaffYn();

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
				session.setAttribute("staffYn", staffYn);

				mv.addObject("customerKey", customerKey);
				mv.addObject("staffYn", staffYn);
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
		/**
		 * Logout 처리
		 * @param request
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping(value = "/common/logout")
		public ModelAndView logout(HttpServletRequest request) throws BizException
		{
			
			logger.info("Good bye addys! ");
	
			HttpSession session = request.getSession(false);
			
			String customerKey = StringUtil.nvl((String) session.getAttribute("customerKey"));
			
			logger.info("customerKey : "+customerKey);
			
		 	session.removeAttribute("customerKey");
		 	session.removeAttribute("customerId");
	        session.removeAttribute("customerName");
	        session.removeAttribute("customerKey1");
	        session.removeAttribute("customerKey2");
	        session.removeAttribute("customerKey3");
	        session.removeAttribute("customerKey4");
	        session.removeAttribute("customerKey5");
	        session.removeAttribute("customerKey6");
	        session.removeAttribute("customerKey7");
	        session.removeAttribute("customerKey8");
	        session.removeAttribute("customerKey9");
	        session.removeAttribute("customerKey10");
	        session.removeAttribute("staffYn");
	        
	        logger.info("logout ok!");
	        
	        ModelAndView mv = new ModelAndView();
	       	mv.setViewName("/common/customerLoginForm");
	
			return mv;
		}
		/**
	     * 고객정보 수정폼
	     *
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/common/customermodifyform")
	    public ModelAndView customerModifyForm(HttpServletRequest request, 
	    		                       HttpServletResponse response,
			                           String customerKey) throws BizException 
	    {
	        
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start customerKey:"+customerKey);
	
	        ModelAndView mv = new ModelAndView();
	        
			CustomerVO customerVo = new CustomerVO();
			customerVo.setCustomerKey(customerKey);
			
			CustomerVO customer = customerSvc.getCustomer(customerVo);	
	        
			mv.addObject("customer", customer);
	        mv.setViewName("/common/customerModifyForm");
	        
	       //log Controller execute time end
	      	long t2 = System.currentTimeMillis();
	      	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");
	      	
	        return mv;
	    }
	    /**
		 * 패스워드 체크
		 */
		@RequestMapping("/common/passwordcheck")
		public @ResponseBody
		String passwordCheck(@RequestParam(value = "curPwd") String curPwd) 
		{

			logger.info("[pwd]" + curPwd);
			
			CustomerVO customerVo = new CustomerVO();
			customerVo.setCurPwd(curPwd);

			try{
	        	
				customerVo = customerSvc.getEncPassword(customerVo);

		    }catch(BizException e){
		       	
		    	e.printStackTrace();
		    }

			return ""+customerVo.getEncPwd();

		 }
		/**
	     * 고객정보 수정처리
	     *
	     * @param UserManageVO
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/common/customermodify", method = RequestMethod.POST)
	    public @ResponseBody
	    String customerModify(@ModelAttribute("customerVO") CustomerVO customerVO, 
	    		          HttpServletRequest request, 
	    		          HttpServletResponse response) throws BizException
	    {
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start : customerVO" + customerVO);
			
			int retVal=this.customerSvc.customerUpdateProc(customerVO);

			//log Controller execute time end
	       	long t2 = System.currentTimeMillis();
	       	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");

	      return ""+retVal;
	    }
}
