package action;
import java.util.List;
import pojo.Address;
import pojo.Team;
import dao.AddressDAO;
import dao.DAO;

public class AddressAction extends BaseAction{
	private Address address;
	private List<Address> adds;
	private List<Address> datas;
	//前端部分
	
	public String findAllForIndex(){
		team=DAO.findbyid(Team.class,team.getId());
		if(team!=null){
			adds=AddressDAO.findByUid(team.getId());
		}
		return "allIndex";
	} 
	
	public String add(){
		team=(Team) session.get("team");
		if(team!=null){
			address.setUserId(team.getId());
			address.setIsMoren(1);
			AddressDAO.resetByUid(team.getId());
			DAO.save(address);
		}
		return findAllForIndex();
	}
	
	public String delete(){
		DAO.deletebyid(Address.class, address.getId());
		return findAllForIndex();
	}
	
	public String toUpdate(){
		address=DAO.findbyid(Address.class, address.getId());
		return "toupdate";
	}

	public String update(){
		Address temp=DAO.findbyid(Address.class,address.getId());
		temp.setProvince(address.getProvince());
		temp.setCity(address.getCity());
		temp.setQu(address.getQu());
		temp.setName(address.getName());
		temp.setTel(address.getTel());
		temp.setAddress(address.getAddress());
		DAO.update(temp);
		return findAllForIndex();
	}
	
	public String setMorenAdd(){
		team=(Team) session.get("team");
		if(team!=null){
			adds=AddressDAO.findByUid(team.getId());
			AddressDAO.resetByUid(team.getId());
			for(Address a:adds){
				if(a.getId().equals(address.getId())){
					a.setIsMoren(1);
					DAO.update(a);
				}
			}
			msg="ok";
		}
		
		return "json_msg";
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Address> getAdds() {
		return adds;
	}

	public void setAdds(List<Address> adds) {
		this.adds = adds;
	}

	public List<Address> getDatas() {
		return datas;
	}

	public void setDatas(List<Address> datas) {
		this.datas = datas;
	}

	
}