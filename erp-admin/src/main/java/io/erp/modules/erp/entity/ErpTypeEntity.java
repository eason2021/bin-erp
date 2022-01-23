package io.erp.modules.erp.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
@Data
@TableName("erp_type")
public class ErpTypeEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	@NotBlank(message = "名称不能为空")
	private String name;
	@NotBlank(message = "编码不能为空")
	private String code;
	/**
	 * 
	 */
	private String status;

	@TableField(exist = false)
	private String shopCount;

	@TableField(exist = false)
	private String goodsCount;

}
