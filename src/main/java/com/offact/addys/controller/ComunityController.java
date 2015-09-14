package com.offact.addys.controller;

import java.io.BufferedReader;
import java.io.File;
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
import com.offact.addys.service.common.MailService;
import com.offact.addys.service.comunity.ComunityService;
import com.offact.addys.vo.CustomerVO;
import com.offact.addys.vo.comunity.ComunityVO;
import com.offact.addys.vo.comunity.CounselVO;
import com.offact.addys.vo.common.EmailVO;
import com.offact.addys.vo.common.SmsVO;

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
    private String hostUrl;

	@Value("#{config['offact.mail.orderfromemail']}")
    private String orderfromemail;
    
    @Value("#{config['offact.mail.ordersubject']}")
    private String ordersubject;
    
    @Value("#{config['offact.dev.option']}")
    private String devOption;
    
    @Value("#{config['offact.dev.sms']}")
    private String devSms;
    
    @Value("#{config['offact.sms.smsid']}")
    private String smsId;
    
    @Value("#{config['offact.sms.smspw']}")
    private String smsPw;
    
    @Value("#{config['offact.sms.smstype']}")
    private String smsType;
    
	@Autowired
	private CustomerService customerSvc;
	
	@Autowired
	private ComunityService comunitySvc;
	
    @Autowired
    private MailService mailSvc;
    
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

	 	       	mv.setViewName("/common/customerLoginForm");
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

	 	       	mv.setViewName("/common/customerLoginForm");
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
			String emaillist="dev@addys.co.kr;kevin.jeon@offact.com";
			String cclist="";
			
			String [] getToMails=emaillist.split(";");
	    	String [] getToMail_Ccs=cclist.split(";");
			
			//email 전송
			EmailVO mail = new EmailVO();
			
			List<String> toEmails= new ArrayList();
			List<String> toEmail_Ccs= new ArrayList();
			List<String> attcheFileName= new ArrayList();
			List<File> files = new ArrayList();

			for(int m=0;m<getToMails.length;m++){	
				toEmails.add(getToMails[m]);	
			}
			
			for(int c=0;c<getToMail_Ccs.length;c++){	
				toEmail_Ccs.add(getToMail_Ccs[c]);	
			}

			//attcheFileName.add(orderCode+".html");
			//files.add(file);
			//메일발송
			mail.setToEmails(toEmails);
			mail.setToEmail_Ccs(toEmail_Ccs);
			mail.setAttcheFileName(attcheFileName);
			mail.setFile(files);

			mail.setFromEmail(orderfromemail);
			mail.setMsg(" 1:1 문의내역입니다.<br>"+counselVO.getCounsel()+"<br>고객핸드폰번호:"+counselVO.getCustomerKey()+"<br><br><br>*1:1문의 답변은 아래 시스템에서 답변 가능하십니다.<br><a href='"+hostUrl+"/addon/smart/counselmanage' >1:1답변하려가기</a>");
			
			
			mail.setSubject("[애디스]1:1상담문의");
			
			boolean counselResult=false;
	
			try{
				
				counselResult=mailSvc.sendMail(mail);
				
				logger.debug("mail result :"+counselResult);
				
				if(counselResult==false){
					
					//log Controller execute time end
			       	long t2 = System.currentTimeMillis();
			       	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");
	
			        return "-1";
					
				}
				
			}catch(BizException e){
		       	
		    	e.printStackTrace();
		        String errMsg = e.getMessage();
		        try{errMsg = errMsg.substring(errMsg.lastIndexOf("exception"));}catch(Exception ex){}
				
				//log Controller execute time end
		       	long t2 = System.currentTimeMillis();
		       	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds [errorMsg] : "+errMsg);

		       	return "-1";
		    	
		    }

			//log Controller execute time end
	       	long t2 = System.currentTimeMillis();
	       	logger.info("["+logid+"] Controller end execute time:[" + (t2-t1)/1000.0 + "] seconds");

	      return ""+retVal;
	    }
	    
	    /**
	     * 커뮤니티 목록조회
	     * 
	     * @param UserManageVO
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/comunity/comunitylist")
	    public ModelAndView comunityList(String customerKey, 
	    		                         HttpServletRequest request, 
	    		                         HttpServletResponse response) throws BizException 
	    {
	        
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start : customerKey" + customerKey);

			ModelAndView mv = new ModelAndView();
	   		
	        List<ComunityVO> comunityList = new ArrayList();
	        
	        ComunityVO comunityVO = new ComunityVO();
	        comunityVO.setCustomerKey(customerKey);

	        // 커뮤니티목록조회
	        comunityList = comunitySvc.getComunityList(comunityVO);

	   	    mv.addObject("comunityList", comunityList);
	   	 
	   		mv.setViewName("/comunity/comunityList");
	   		
	   		return mv;
	    }
	    
	    /**
	     * 1:1 목록조회
	     * 
	     * @param UserManageVO
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/comunity/counsellist")
	    public ModelAndView counselList(String customerKey, 
	    		                         HttpServletRequest request, 
	    		                         HttpServletResponse response) throws BizException 
	    {
	        
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start : customerKey" + customerKey);

			ModelAndView mv = new ModelAndView();
	   		
	        List<CounselVO> counselList = new ArrayList();
	        
	        CounselVO counselVO = new CounselVO();
	        counselVO.setCustomerKey(customerKey);

	        // 커뮤니티목록조회
	        counselList = comunitySvc.getCounselList(counselVO);

	   	    mv.addObject("counselList", counselList);
	   	 
	   		mv.setViewName("/comunity/counselList");
	   		
	   		return mv;
	    }
	    
	    /**
	     * 1:1 목록조회
	     * 
	     * @param UserManageVO
	     * @param request
	     * @param response
	     * @param model
	     * @param locale
	     * @return
	     * @throws BizException
	     */
	    @RequestMapping(value = "/comunity/replylist")
	    public ModelAndView replyList(String idx, 
	    		                         HttpServletRequest request, 
	    		                         HttpServletResponse response) throws BizException 
	    {
	        
	    	//log Controller execute time start
			String logid=logid();
			long t1 = System.currentTimeMillis();
			logger.info("["+logid+"] Controller start : idx" + idx);

			ModelAndView mv = new ModelAndView();
	   		
			List<ComunityVO> comunityReply = new ArrayList();
			
			 ComunityVO comunityVO = new ComunityVO();
		     comunityVO.setUpidx(idx);

	        //품목 비고 정보
	        comunityReply=comunitySvc.getComunityReply(comunityVO);

	   	    mv.addObject("comunityReply", comunityReply);
	   	 
	   		mv.setViewName("/comunity/replyList");
	   		
	   		return mv;
	    }
	    
}
