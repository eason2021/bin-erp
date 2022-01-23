package io.erp.modules.erp.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.erp.common.utils.PageUtils;
import io.erp.common.utils.Query;
import io.erp.modules.erp.dao.ErpTypeDao;
import io.erp.modules.erp.entity.ErpTypeEntity;
import io.erp.modules.erp.service.ErpTypeService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("erpTypeService")
public class ErpTypeServiceImpl extends ServiceImpl<ErpTypeDao, ErpTypeEntity> implements ErpTypeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String name = (String) params.get("name");
        String code = (String) params.get("code");

        IPage<ErpTypeEntity> page = baseMapper.queryPage(new Query<ErpTypeEntity>().getPage(params),name,code);

        return new PageUtils(page);
    }

    @Override
    public List<ErpTypeEntity> queryList() {
        return baseMapper.queryList();
    }

    @Override
    public List<ErpTypeEntity> queryListByShopId(Integer shopId) {
        return baseMapper.queryListByShopId(shopId);
    }

}
