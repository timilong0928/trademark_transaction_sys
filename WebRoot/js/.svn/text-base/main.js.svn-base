function addcart(pid){
	$.ajax({
           url:'cart!add.action',
           type:'post',
           data:{"pid":pid},
           dataType:'json',
           error:function(){alert("请重试！")},
           success:function(data){
              if(data=="yes"){
                 alert("已帮您添加到购物车");
              }else if(data=="login"){
            	 window.open("team!toCenter.action");
            	 return false;
              }else{
                 alert("添加出错");
              }
           }
   });
}

function addNum(pid,num){
	$.ajax({
           url:'cart!addNum.action',
           type:'post',
           data:{"pid":pid,"num":num},
           dataType:'json',
           error:function(){alert("请重试！")},
           success:function(data){
              if(data=="yes"){
              }else if(data=="login"){
            	 window.open("team!toCenter.action");
            	 return false;
              }else{
                 //alert("增减出错");
              }
           }
   });
}