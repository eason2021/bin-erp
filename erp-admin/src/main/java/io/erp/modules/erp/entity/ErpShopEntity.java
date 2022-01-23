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
@TableName("erp_shop")
public class ErpShopEntity implements Serializable {
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
	private String title;
	@NotBlank(message = "编码不能为空")
	private String code;
	/**
	 * 
	 */
	@NotBlank(message = "URL不能为空")
	private String url;
	/**
	 * 
	 */
	private String remark;
	/**
	 * 
	 */
	private String status;
	/**
	 * 
	 */
	private Date createTime;
	/**
	 * 发货地
	 */
	private String fromAddr;

	@TableField(exist = false)
	private String typeIds;

	@TableField(exist = false)
	private String typenames;

	@TableField(exist = false)
	private String typecount;

	@TableField(exist = false)
	private String goodsCount;



}
