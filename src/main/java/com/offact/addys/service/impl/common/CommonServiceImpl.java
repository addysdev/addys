package com.offact.addys.service.impl.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offact.framework.util.StringUtil;
import com.offact.framework.db.SqlSessionCommonDao;
import com.offact.framework.exception.BizException;
import com.offact.addys.service.common.CommonService;
import com.offact.addys.vo.common.GroupVO;

/**
 * @author 4530
 */
@Service
public class CommonServiceImpl implements CommonService {

    private final Logger        logger = Logger.getLogger(getClass());

    @Autowired
    private SqlSessionCommonDao commonDao;

    
   @Override
    public List<GroupVO> getGroupComboList(GroupVO group) throws BizException {
        List<GroupVO> grolupList = commonDao.selectList("Group.getGroupComboList", group);

        return grolupList;
    }

}
