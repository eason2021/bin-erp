package io.erp.modules.erp.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.erp.common.utils.PageUtils;
import io.erp.common.utils.Query;
import io.erp.modules.erp.dao.ErpShopDao;
import io.erp.modules.erp.entity.ErpShopEntity;
import io.erp.modules.erp.entity.ErpShopTypeEntity;
import io.erp.modules.erp.service.ErpGoodsService;
import io.erp.modules.erp.service.ErpShopService;
import io.erp.modules.erp.service.ErpShopTypeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Transactional
@Service("erpShopService")
public class ErpShopServiceImpl extends ServiceImpl<ErpShopDao, ErpShopEntity> implements ErpShopService {

    @Autowired
    private ErpShopTypeService erpShopTypeService;
    @Autowired
    private ErpGoodsService erpGoodsService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String title = (String) params.get("title");
        String code = (String) params.get("code");

        IPage<ErpShopEntity> page = baseMapper.queryPage(new Query<ErpShopEntity>().getPage(params),title,code);
        return new PageUtils(page);
    }

    @Override
    public void saveShop(ErpShopEntity erpShopEntity) {
        this.save(erpShopEntity);

        if(StringUtils.isNotBlank(erpShopEntity.getTypeIds())) {
            //插入店铺类别
            String[] ids = erpShopEntity.getTypeIds().split(",");
            List<ErpShopTypeEntity> erpShopTypes = new ArrayList<>();
            for(String id : ids){
                ErpShopTypeEntity entity = new ErpShopTypeEntity();
                entity.setShopid(erpShopEntity.getId());
                entity.setTypeid(Integer.parseInt(id));
                erpShopTypes.add(entity);
            }

            erpShopTypeService.saveBatch(erpShopTypes);
        }

    }

    @Override
    public void updateShop(ErpShopEntity erpShopEntity) {
        this.updateById(erpShopEntity);

        erpShopTypeService.deleteTypeIds(erpShopEntity.getId());

        if(StringUtils.isNotBlank(erpShopEntity.getTypeIds())) {
            //插入店铺类别
            String[] ids = erpShopEntity.getTypeIds().split(",");
            List<ErpShopTypeEntity> erpShopTypes = new ArrayList<>();
            for(String id : ids){
                ErpShopTypeEntity entity = new ErpShopTypeEntity();
                entity.setShopid(erpShopEntity.getId());
                entity.setTypeid(Integer.parseInt(id));
                erpShopTypes.add(entity);
            }

            erpShopTypeService.saveBatch(erpShopTypes);
        }
    }

    @Override
    public void deleteShop(Integer[] ids) {
        this.removeByIds(Arrays.asList(ids));

        for(Integer id : ids){
            erpShopTypeService.deleteTypeIds(id);
            erpGoodsService.deleteGoodsByShopId(id);
        }
    }

    @Override
    public String queryShopTypeId(Integer shopId) {
        List<Integer> typeIds = erpShopTypeService.queryTypeIds(shopId);
        return String.join(",",typeIds.stream().map(String::valueOf).collect(Collectors.toList()));
    }

    @Override
    public List<ErpShopEntity> queryAll() {
        return baseMapper.queryAll();
    }

}
