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

import io.erp.modules.erp.entity.ErpGoodsTypeEntity;
import io.erp.modules.erp.service.ErpGoodsTypeService;
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
@RequestMapping("erp/erpgoodstype")
public class ErpGoodsTypeController {
    @Autowired
    private ErpGoodsTypeService erpGoodsTypeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("erp:erpgoodstype:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = erpGoodsTypeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("erp:erpgoodstype:info")
    public R info(@PathVariable("id") Integer id){
        ErpGoodsTypeEntity erpGoodsType = erpGoodsTypeService.getById(id);

        return R.ok().put("erpGoodsType", erpGoodsType);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("erp:erpgoodstype:save")
    public R save(@RequestBody ErpGoodsTypeEntity erpGoodsType){
        erpGoodsTypeService.save(erpGoodsType);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("erp:erpgoodstype:update")
    public R update(@RequestBody ErpGoodsTypeEntity erpGoodsType){
        ValidatorUtils.validateEntity(erpGoodsType);
        erpGoodsTypeService.updateById(erpGoodsType);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("erp:erpgoodstype:delete")
    public R delete(@RequestBody Integer[] ids){
        erpGoodsTypeService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
