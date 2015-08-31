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
	
}
