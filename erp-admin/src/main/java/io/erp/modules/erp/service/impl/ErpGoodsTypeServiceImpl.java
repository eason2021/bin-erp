package io.erp.modules.erp.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.erp.common.utils.PageUtils;
import io.erp.common.utils.Query;

import io.erp.modules.erp.dao.ErpGoodsTypeDao;
import io.erp.modules.erp.entity.ErpGoodsTypeEntity;
import io.erp.modules.erp.service.ErpGoodsTypeService;


@Service("erpGoodsTypeService")
public class ErpGoodsTypeServiceImpl extends ServiceImpl<ErpGoodsTypeDao, ErpGoodsTypeEntity> implements ErpGoodsTypeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ErpGoodsTypeEntity> page = this.page(
                new Query<ErpGoodsTypeEntity>().getPage(params),
                new QueryWrapper<ErpGoodsTypeEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void deleteByGoodsId(Integer goodsId) {
        baseMapper.deleteByGoodsId(goodsId);
    }

    @Override
    public String queryTypeByGoodsId(Integer goodsId) {
        List<Integer> typeIds = baseMapper.queryTypeByGoodsId(goodsId);
        return String.join(",",typeIds.stream().map(String::valueOf).collect(Collectors.toList()));
    }

}
