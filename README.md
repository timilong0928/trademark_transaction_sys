### 需求一

在【后台管理系统】->【商标管理】->【添加商标】页面: <br />
  1. 新增内部价格栏, 字段统一使用cost_price，管理员可以新添商标成本(内部)价格，默认值为0.00<br />
  2. 新增持有人栏, 字段统一使用sb_owner, 管理员可以新添商标持有人，默认值为空<br />
![新增cost_price, sb_owner字段](http://7xorah.com1.z0.glb.clouddn.com/WechatIMG141.jpeg)
      

在【后台管理系统】->【商标管理】->【查看商标列表】页面，支持管理员查看cost_price, sb_owner:<br />
  1. 新建内部价格列<br />
  2. 新建商标持有人列<br />
![新增cost_price, sb_owner字段](http://7xorah.com1.z0.glb.clouddn.com/WechatIMG142.jpeg)


### 需求二
在【后台管理系统】->【商标管理】->【添加商标】页面: <br />
  1. 提供一键上传Excel的按钮
  2. 管理员点击这个按钮，选择需要上传的Excel文件
  3. java后端自动读取Excel文件，将商标数据写入到数据库product表格。


### 注意
Excel列表的数据表头的顺序、文字内容统一。<br />
如果Excel数据格式不正确，请给出err_msg给用户:具体某个地方报错
