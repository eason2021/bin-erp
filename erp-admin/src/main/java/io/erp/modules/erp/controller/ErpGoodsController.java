package io.erp.modules.erp.controller;

import io.erp.common.utils.PageUtils;
import io.erp.common.utils.R;
import io.erp.common.validator.ValidatorUtils;
import io.erp.modules.erp.entity.ErpGoodsEntity;
import io.erp.modules.erp.entity.ErpShopEntity;
import io.erp.modules.erp.entity.ErpTypeEntity;
import io.erp.modules.erp.service.ErpGoodsService;
import io.erp.modules.erp.service.ErpGoodsTypeService;
import io.erp.modules.erp.service.ErpShopService;
import io.erp.modules.erp.service.ErpTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.jsoup.helper.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


/**
 * 
 *
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
@RestController
@RequestMapping("erp/erpgoods")
public class ErpGoodsController {
    @Autowired
    private ErpGoodsService erpGoodsService;

    @Autowired
    private ErpGoodsTypeService erpGoodsTypeService;

    @Autowired
    private ErpShopService erpShopService;

    @Autowired
    private ErpTypeService erpTypeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("erp:erpgoods:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = erpGoodsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("erp:erpgoods:info")
    public R info(@PathVariable("id") Integer id){
        ErpGoodsEntity erpGoods = erpGoodsService.getById(id);
        String typeIds = erpGoodsTypeService.queryTypeByGoodsId(id);
        erpGoods.setGoodTypes(typeIds);
        return R.ok().put("erpGoods", erpGoods);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("erp:erpgoods:save")
    public R save(@RequestBody ErpGoodsEntity erpGoods){
        ValidatorUtils.validateEntity(erpGoods);
        erpGoodsService.saveGoods(erpGoods);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("erp:erpgoods:update")
    public R update(@RequestBody ErpGoodsEntity erpGoods){
        ValidatorUtils.validateEntity(erpGoods);
        erpGoodsService.updateGoods(erpGoods);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("erp:erpgoods:delete")
    public R delete(@RequestBody Integer[] ids){
        erpGoodsService.deleteGoods(ids);

        return R.ok();
    }

    @RequestMapping("/generateCode")
    public R generateCode(@RequestBody ErpGoodsEntity erpGoods){
        Integer typeId = Integer.parseInt(erpGoods.getGoodTypes().split(",")[0]);
        Integer count = erpGoodsService.queryCountByshopTypeId(erpGoods.getShopid(), typeId);

        ErpShopEntity shop = erpShopService.getById(erpGoods.getShopid());
        ErpTypeEntity type = erpTypeService.getById(typeId);

        String result = shop.getCode() + "-" + type.getCode() + "-" + String.format("%04d", count+1);

        return R.ok().put("goodsCode",result);
    }

}
