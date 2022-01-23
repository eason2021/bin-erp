package io.erp.modules.erp.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.erp.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.erp.modules.erp.entity.ErpShopEntity;
import io.erp.modules.erp.service.ErpShopService;
import io.erp.common.utils.PageUtils;
import io.erp.common.utils.R;



/**
 * 
 *
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
@RestController
@RequestMapping("erp/erpshop")
public class ErpShopController {
    @Autowired
    private ErpShopService erpShopService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("erp:erpshop:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = erpShopService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("erp:erpshop:info")
    public R info(@PathVariable("id") Integer id){
        ErpShopEntity erpShop = erpShopService.getById(id);
        String typeIds = erpShopService.queryShopTypeId(id);
        erpShop.setTypeIds(typeIds);

        return R.ok().put("erpShop", erpShop);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("erp:erpshop:save")
    public R save(@RequestBody ErpShopEntity erpShop){
        ValidatorUtils.validateEntity(erpShop);
        erpShopService.saveShop(erpShop);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("erp:erpshop:update")
    public R update(@RequestBody ErpShopEntity erpShop){
        ValidatorUtils.validateEntity(erpShop);
        erpShopService.updateShop(erpShop);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("erp:erpshop:delete")
    public R delete(@RequestBody Integer[] ids){
        erpShopService.deleteShop(ids);

        return R.ok();
    }

    @RequestMapping("/queryAll")
    public R queryAll(){
        List<ErpShopEntity> shops = erpShopService.queryAll();
        return R.ok().put("shops", shops);
    }

}
