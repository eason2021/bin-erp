package io.erp.modules.erp.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
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
@TableName("erp_goods")
public class ErpGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	@NotNull(message = "店铺不能为空")
	private Integer shopid;
	/**
	 * 标题
	 */
	@NotBlank(message = "标题不能为空")
	private String title;
	/**
	 * 链接
	 */
	@NotBlank(message = "URL不能为空")
	private String url;
	/**
	 * 产品编号
	 */
	@NotBlank(message = "产品编码不能为空")
	private String code;
	/**
	 * 图片
	 */
	private String imgs;
	/**
	 * 起批量
	 */
	private String minBuy;
	/**
	 * 进货价
	 */
	private String price;
	/**
	 * 快递费
	 */
	private BigDecimal courierFee;
	/**
	 * 发货时间
	 */
	private Integer deliveryTime;
	/**
	 * 状态
	 */
	private String status;
	/**
	 * 0未采集 1采集已上线 2已上线
	 */
	private String collectionStatus;
	/**
	 * 
	 */
	private Date createTime;

	@TableField(exist = false)
	private String goodTypes;

	@TableField(exist = false)
	private String shopName;

	@TableField(exist = false)
	private String shopUrl;

	@TableField(exist = false)
	private String fromAddr;

}
