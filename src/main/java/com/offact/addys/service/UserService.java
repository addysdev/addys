/**
 * 
 */
package com.offact.addys.service;

import java.util.List;

import com.offact.framework.exception.BizException;
import com.offact.addys.vo.UserConditionVO;
import com.offact.addys.vo.UserMenuVO;
import com.offact.addys.vo.UserVO;

/**
 * @author 4530
 *
 */
public interface UserService {
	/**
	 * 사용자 조회
	 * @param user
	 * @return
	 * @throws BizException
	 */
	public UserVO getUser(UserVO user) throws BizException;
	
	/**
	 * 사용자 리스트 조회
	 * @param userConVo
	 * @return
	 * @throws BizException
	 */
	public List<UserVO> getUserList(UserVO user) throws BizException;

	
}
