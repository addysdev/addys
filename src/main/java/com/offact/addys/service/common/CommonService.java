/**
 *
 */
package com.offact.addys.service.common;

import java.util.List;
import java.util.Map;

import com.offact.framework.exception.BizException;
import com.offact.addys.vo.common.GroupVO;

/**
 * @author 4530
 */
public interface CommonService {
    
    /**
     * 그룹 목록
     *
     * @return
     * @throws BizException
     */
    public List<GroupVO> getGroupComboList(GroupVO group) throws BizException;

}
