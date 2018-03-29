package pojo;

/**
 *  公共的属性(佣金)
 */
public class Award {
	private Integer id;//id(主键)
	
	private double discount1=50.0;//一级分销比例
	private Integer minmoney;//最低提现金额
	private Integer fenxiao=0;//分销开启和关闭按钮 0-开启，，1-不开启
	
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public double getDiscount1() {
		return discount1;
	}
	public void setDiscount1(double discount1) {
		this.discount1 = discount1;
	}
	public void setDiscount1(Integer discount1) {
		this.discount1 = discount1;
	}
	public Integer getMinmoney() {
		return minmoney;
	}
	public void setMinmoney(Integer minmoney) {
		this.minmoney = minmoney;
	}
	public Integer getFenxiao() {
		return fenxiao;
	}
	public void setFenxiao(Integer fenxiao) {
		this.fenxiao = fenxiao;
	}
	
}
    