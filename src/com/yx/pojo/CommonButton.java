package com.yx.pojo;

/** 
 * 普通按钮（子按钮） 
 *  
 */  
public class CommonButton extends Button {  
	private Integer id;
	private String name;
    private String type;  
    private String key;
    private String url;
    private Integer complexButtonId;//一级菜单的id
    
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getComplexButtonId() {
		return complexButtonId;
	}

	public void setComplexButtonId(Integer complexButtonId) {
		this.complexButtonId = complexButtonId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {  
        return type;  
    }  
  
    public void setType(String type) {  
        this.type = type;  
    }  
  
    public String getKey() {  
        return key;  
    }  
  
    public void setKey(String key) {  
        this.key = key;  
    }  
}  
