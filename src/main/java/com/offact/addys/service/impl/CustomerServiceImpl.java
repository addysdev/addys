package com.offact.addys.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offact.framework.db.SqlSessionCommonAdminDao;
import com.offact.framework.db.SqlSessionCommonDao;
import com.offact.framework.exception.BizException;
import com.offact.addys.service.CustomerService;
import com.offact.addys.vo.CustomerVO;

/**
 * @author 4530
 *
 */
@Service
public class CustomerServiceImpl implements CustomerService {

	private final Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SqlSessionCommonDao commonDao;

	@Autowired
	private SqlSessionCommonAdminDao commonSubDao;		//multi datasource test

	@Override
	public CustomerVO getCustomer(CustomerVO customer) throws BizException {
		return commonDao.selectOne("Customer.getCustomer", customer);
	}

}
