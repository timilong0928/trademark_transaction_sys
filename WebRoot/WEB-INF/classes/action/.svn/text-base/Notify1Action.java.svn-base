package action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import moban.WeixinPushMassage;

import org.apache.struts2.ServletActionContext;

import pojo.Admin;
import pojo.Award;

import pojo.Course;

import pojo.Order1;
import pojo.Order2;
import pojo.PayRecord;
import pojo.Product;
import pojo.Sb;
import pojo.Yewu;

import pojo.Team;
import pojo.TeamAward;


import com.yx.util.MessageUtil;

import dao.DAO;
import dao.Order2DAO;
import dao.TeamDAO;

/**
 * 
 * @author Administrator
 * 
 */
public class Notify1Action {

	private Team team;
	private TeamDAO teamDao;
	
	private Order2 order2;
	private Order1 order1;
	private List<Order1> order1s;
	
	private Product product;
	
	
	/**
	 * 支付回调action
	 * @return
	 * @throws Exception
	 */
	public String notify1() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		Map<String, String> requestMap;
		PrintWriter out = response.getWriter();

		requestMap = MessageUtil.parseXml1(request);
		System.out.println("requestMap:"+requestMap);
		String result_code = requestMap.get("result_code");
		String out_trade_no = requestMap.get("out_trade_no");
		String transaction_id= requestMap.get("transaction_id");
		System.out.println("transaction_id:"+transaction_id);
		
		//获取当前时间字符串time2
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time2 = df1.format(new Date());
		Order2 order2 = new Order2();
		try {
			
			order2 = DAO.findbykey("oid", out_trade_no, Order2.class);
			System.out.println("order2====="+order2+"out_trade_no==="+out_trade_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// order
		if (order2 != null) {
			if (result_code.equals("SUCCESS")) {
				System.out.println("已经支付了，进来"); 
				Integer status = order2.getStatus();
				if (status==1) {
					
					//此处减掉库存，（淘宝也是付款成功才减掉库存）
					String huifu = "<xml> <return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg> </xml>";
					out.println(huifu);
					out.close();
				}  else {
					
					Award award = DAO.findbyid(Award.class,1);
					Team team=DAO.findbyid(Team.class,order2.getTeamid());
					//修改订单支付状态
					order2.setTime(time2);
					order2.setStatus(1);
					
					//查询上级用户
					//Team shangji1=DAO.findbyid(Team.class,team.getYijiId());
					
					
					//开启了分销功能
					//if(award.getFenxiao()==0){}
					
						//如果有上级，则给佣金
						/*if(shangji1!=null){
							//添加佣金记录
							System.out.println("有上级，进来"); 
							TeamAward teamaward2 = new TeamAward();
							teamaward2.setType(4);
							teamaward2.setTeamId(shangji1.getId());
							//teamaward2.setYjcontent("下级用户："+team.getNickName()+"的购买");
							
							teamaward2.setFanyongname(shangji1.getNickName());
							teamaward2.setYongjinaward(Math.round(order2.getPrice()*award.getDiscount1())/100.0);
							System.out.println("反佣金钱："+Math.round(order2.getPrice()*award.getDiscount1())/100.0);
							teamaward2.setTeamId1(team.getId());
							DAO.save(teamaward2);
							shangji1.setAllyongjin(Math.round(shangji1.getAllyongjin()*100+teamaward2.getYongjinaward()*100)/100.0);
							shangji1.setYongjin(Math.round(shangji1.getYongjin()*100+teamaward2.getYongjinaward()*100)/100.0);
							DAO.update(shangji1);
							
							
							try {
								WeixinPushMassage.fanyong(shangji1.getOpenId(),team.getNickName()+"用户（您发展的下级用户）成功购买商品:"+order2.getCoursetitle(),order2.getPrice()+"元",teamaward2.getYongjinaward()+"元", null);
							} catch (Exception e) {
								// TODO: handle exception
							}
							
						}*/
						
					
						if (order2.getType()==0) {
							int num;
							Yewu yewu=DAO.findbyid(Yewu.class, order2.getCourseid());
							if (yewu!=null) {
								num=yewu.getXiaoshounum();
								yewu.setXiaoshounum(num+order2.getNum());
								DAO.update(yewu);
								
							}
							
						}else if (order2.getType()==1) {
							Sb shangbiao=DAO.findbyid(Sb.class, order2.getCourseid());
							if (shangbiao!=null) {
								shangbiao.setState(1);
								DAO.update(shangbiao);
								
							}
							
						}
					
					/*try {
						WeixinPushMassage.goumai(team.getOpenId(), order2.getCoursetitle(), "http://shangbiao18.xmyunxin.com/order!myorder.action");
					} catch (Exception e) {
						// TODO: handle exception
					}*/
						String huifu = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg> </xml>";
						out.println(huifu);
						out.close();
					
					
					DAO.update(team);
					DAO.update(order2);
					
							
					}
			} else {
				String huifu = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg> </xml>";
				out.println(huifu);
				out.close();
			}
		}
		return null;
	}
	//普通购买回掉(以前的)
	public void notify12() throws Exception {
		//获取request与response的输出输入流
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		//声明用于存放request解析结果的Map
		Map<String, String> requestMap;
		PrintWriter out = response.getWriter();
		BufferedReader br = new BufferedReader(new InputStreamReader(
				(ServletInputStream) request.getInputStream()));
		
		//获取当前时间字符串time2
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time2 = df1.format(new Date());
		//解析request存入map
		requestMap = MessageUtil.parseXml1(request);
		//获取结果状态码和,什么订单编号
		String result_code = requestMap.get("result_code");
		String out_trade_no = requestMap.get("out_trade_no");
		String openid = requestMap.get("openid");
		//通过订单编号查询订单
		Order2 order2 = new Order2();
		order2 = Order2DAO.find(out_trade_no);
		
		if (order2 != null) {
			if (result_code.equals("SUCCESS")) {
				Integer status = order2.getStatus();
				
				if (status==1) {
					String huifu = "<xml> <return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg> </xml>";
					out.println(huifu);
					out.close();
				} else {
					Award award = DAO.findbyid(Award.class,1);
					Team team=DAO.findbyid(Team.class,order2.getTeamid());
					//改大订单
					order2.setTime(time2);
					order2.setStatus(1);
					
					//修改小订单
					Course course;
					order1s =DAO.findbystring(Order1.class,"oid",order2.getOid());
					for(Order1 o1:order1s){
						o1.setStatus(1);
						o1.setTime(time2);
						DAO.update(o1);
						try {
							course = DAO.findbyid(Course.class,o1.getCourseid());
							if(course!=null){
								course.setPayNum(course.getPayNum()+1);
								DAO.update(course);
							}
						} catch (Exception e) {
							// TODO: handle exception
						}
						
					}
					
					
					
					
					
					//查询上级用户
					Team shangji1=DAO.findbyid(Team.class,team.getYijiId());
					
					
					//开启了分销功能
					if(award.getFenxiao()==0){
						//如果有上级，则给佣金
						if(shangji1!=null){
							//添加积分记录
							TeamAward teamaward2 = new TeamAward();
							teamaward2.setType(4);
							teamaward2.setTeamId(shangji1.getId());
							teamaward2.setYjcontent("下级用户："+team.getNickName()+"的购买");
							
							teamaward2.setFanyongname(shangji1.getNickName());
							teamaward2.setYongjinaward(Math.round(order2.getPrice()*award.getDiscount1())/100.0);
							teamaward2.setTeamId1(team.getId());
							DAO.save(teamaward2);
							shangji1.setAllyongjin(Math.round(shangji1.getAllyongjin()*100+teamaward2.getYongjinaward()*100)/100.0);
							shangji1.setYongjin(Math.round(shangji1.getYongjin()*100+teamaward2.getYongjinaward()*100)/100.0);
							DAO.update(shangji1);
							try {
								WeixinPushMassage.fanyong(shangji1.getOpenId(),team.getNickName()+"用户（您发展的下级用户）成功购买课程:"+order2.getCoursetitle(),order2.getPrice()+"元",teamaward2.getYongjinaward()+"元", null);
							} catch (Exception e) {
								// TODO: handle exception
							}
							
						}
						
					}
					
					
					try {
						WeixinPushMassage.goumai(team.getOpenId(), order2.getCoursetitle(), "http://shangbiao18.xmyunxin.com/order!myorder.action");
					} catch (Exception e) {
						// TODO: handle exception
					}
					
					
					DAO.update(team);
					DAO.update(order2);
					
							
					}
					
					String huifu = "<xml> <return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg> </xml>";
					out.println(huifu);
					out.close();
				}
			} else {
				String huifu = "<xml> <return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg> </xml>";
				out.println(huifu);
				out.close();
			}

		}

	



	
	
	public Order2 getOrder2() {
		return order2;
	}

	public void setOrder2(Order2 order2) {
		this.order2 = order2;
	}

	public Order1 getOrder1() {
		return order1;
	}

	public void setOrder1(Order1 order1) {
		this.order1 = order1;
	}

	public List<Order1> getOrder1s() {
		return order1s;
	}

	public void setOrder1s(List<Order1> order1s) {
		this.order1s = order1s;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public TeamDAO getTeamDao() {
		return teamDao;
	}

	public void setTeamDao(TeamDAO teamDao) {
		this.teamDao = teamDao;
	}

	
}
