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

import io.erp.modules.erp.entity.ErpTypeEntity;
import io.erp.modules.erp.service.ErpTypeService;
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
@RequestMapping("erp/erptype")
public class ErpTypeController {
    @Autowired
    private ErpTypeService erpTypeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("erp:erptype:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = erpTypeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("erp:erptype:info")
    public R info(@PathVariable("id") Integer id){
        ErpTypeEntity erpType = erpTypeService.getById(id);

        return R.ok().put("erpType", erpType);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("erp:erptype:save")
    public R save(@RequestBody ErpTypeEntity erpType){
        ValidatorUtils.validateEntity(erpType);
        erpTypeService.save(erpType);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("erp:erptype:update")
    public R update(@RequestBody ErpTypeEntity erpType){
        ValidatorUtils.validateEntity(erpType);
        erpTypeService.updateById(erpType);
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("erp:erptype:delete")
    public R delete(@RequestBody Integer[] ids){
        erpTypeService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    @RequestMapping("/queryAll")
    public R queryAll(){
        List<ErpTypeEntity> erpTypes = erpTypeService.queryList();
        return R.ok().put("erpTypes", erpTypes);
    }

    @RequestMapping("/queryById/{id}")
    public R queryById(@PathVariable("id") Integer id){
        List<ErpTypeEntity> erpTypes = erpTypeService.queryListByShopId(id);
        return R.ok().put("erpTypes", erpTypes);
    }
}
