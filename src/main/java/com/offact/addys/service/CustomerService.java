/**
 * 
 */
package com.offact.addys.service;

import java.util.List;

import com.offact.framework.exception.BizException;
import com.offact.addys.vo.CustomerVO;

/**
 * @author 4530
 *
 */
public interface CustomerService {
	/**
	 * 고객 조회
	 * @param user
	 * @return
	 * @throws BizException
	 */
	public CustomerVO getCustomer(CustomerVO customer) throws BizException;
    /**
     * 고객패스워드 조회
     * @param TargetVO
     * @return
     * @throws BizException
     */
    public CustomerVO getEncPassword(CustomerVO customer)
    	    throws BizException;
    /**
     * 고객 상세정보 수정
     * 
     * @return
     * @throws BizException
     */
    public int customerUpdateProc(CustomerVO customer) throws BizException;
    
    /**
     * 고객 등록
     * 
     * @return
     * @throws BizException
     */
    public int customerRegist(CustomerVO customer) throws BizException;
}
