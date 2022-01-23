package io.erp.modules.erp.controller;

import java.util.Arrays;
import java.util.Map;

import io.erp.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.erp.modules.erp.entity.ErpShopTypeEntity;
import io.erp.modules.erp.service.ErpShopTypeService;
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
@RequestMapping("erp/erpshoptype")
public class ErpShopTypeController {
    @Autowired
    private ErpShopTypeService erpShopTypeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("erp:erpshoptype:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = erpShopTypeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("erp:erpshoptype:info")
    public R info(@PathVariable("id") Integer id){
        ErpShopTypeEntity erpShopType = erpShopTypeService.getById(id);

        return R.ok().put("erpShopType", erpShopType);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("erp:erpshoptype:save")
    public R save(@RequestBody ErpShopTypeEntity erpShopType){
        erpShopTypeService.save(erpShopType);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("erp:erpshoptype:update")
    public R update(@RequestBody ErpShopTypeEntity erpShopType){
        ValidatorUtils.validateEntity(erpShopType);
        erpShopTypeService.updateById(erpShopType);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("erp:erpshoptype:delete")
    public R delete(@RequestBody Integer[] ids){
        erpShopTypeService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
