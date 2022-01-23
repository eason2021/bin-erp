package io.erp.modules.erp.service.impl;

import io.erp.modules.erp.entity.ErpGoodsTypeEntity;
import io.erp.modules.erp.service.ErpGoodsTypeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.erp.common.utils.PageUtils;
import io.erp.common.utils.Query;

import io.erp.modules.erp.dao.ErpGoodsDao;
import io.erp.modules.erp.entity.ErpGoodsEntity;
import io.erp.modules.erp.service.ErpGoodsService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("erpGoodsService")
public class ErpGoodsServiceImpl extends ServiceImpl<ErpGoodsDao, ErpGoodsEntity> implements ErpGoodsService {

    @Autowired
    private ErpGoodsTypeService erpGoodsTypeService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String title = (String) params.get("title");
        String code = (String) params.get("code");
        Integer shopid = (params.get("shopid") != null && params.get("shopid").toString() != "" && params.get("shopid").toString().length() > 0) ? Integer.parseInt(String.valueOf(params.get("shopid"))) : null;
        Integer typeid = (params.get("typeid") != null && params.get("typeid").toString() != "" && params.get("typeid").toString().length() > 0) ? Integer.parseInt(String.valueOf(params.get("typeid"))) : null;

        IPage<ErpGoodsEntity> page = baseMapper.queryPage(new Query<ErpGoodsEntity>().getPage(params),title,code,shopid,typeid);

        return new PageUtils(page);
    }

    @Override
    public void saveGoods(ErpGoodsEntity erpGoodsEntity) {
        this.save(erpGoodsEntity);

        List<ErpGoodsTypeEntity> goodsTypes = new ArrayList<>();
        if(StringUtils.isNotBlank(erpGoodsEntity.getGoodTypes())){
            String[] types = erpGoodsEntity.getGoodTypes().split(",");
            for(String typeId : types){
                ErpGoodsTypeEntity entity = new ErpGoodsTypeEntity();
                entity.setTypeid(Integer.parseInt(typeId));
                entity.setGoodsid(erpGoodsEntity.getId());
                goodsTypes.add(entity);
            }
            erpGoodsTypeService.saveBatch(goodsTypes);
        }
    }

    @Override
    public void updateGoods(ErpGoodsEntity erpGoodsEntity) {
        this.updateById(erpGoodsEntity);

        erpGoodsTypeService.deleteByGoodsId(erpGoodsEntity.getId());

        if(StringUtils.isNotBlank(erpGoodsEntity.getGoodTypes())){
            List<ErpGoodsTypeEntity> goodsTypes = new ArrayList<>();
            String[] types = erpGoodsEntity.getGoodTypes().split(",");
            for(String typeId : types){
                ErpGoodsTypeEntity entity = new ErpGoodsTypeEntity();
                entity.setTypeid(Integer.parseInt(typeId));
                entity.setGoodsid(erpGoodsEntity.getId());
                goodsTypes.add(entity);
            }
            erpGoodsTypeService.saveBatch(goodsTypes);
        }
    }

    @Override
    public void deleteGoods(Integer[] ids) {
        this.removeByIds(Arrays.asList(ids));

        for(Integer id : ids){
            erpGoodsTypeService.deleteByGoodsId(id);
        }
    }

    @Override
    public void deleteGoodsByShopId(Integer id) {
        baseMapper.deleteGoodsByShopId(id);
    }

    @Override
    public Integer queryCountByshopTypeId(Integer shopId, Integer typeId) {
        return baseMapper.queryCountByshopTypeId(shopId,typeId);
    }

}
