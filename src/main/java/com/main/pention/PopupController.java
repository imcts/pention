package com.main.pention;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.DataBean;

@Controller
@RequestMapping("pention/{service}")
public class PopupController {

	
	@Resource
	SqlSessionTemplate sqlSessionTemplate;
	
	
	Object mainPhoto=null;

	
	Object roomPhotoList=null;
	
	
	@ModelAttribute("popup")
	public Object popUp(@PathVariable String service,DataBean databean){
		
		System.out.println(databean.getPid());
		
		if(!databean.getPid().equals("") && service.equals("areaPhotoPopup")){
			databean.setPentionResult(this.sqlSessionTemplate.selectOne("mm.getMainPhoto", databean));
			
		}else if(!databean.getPid().equals("") && service.equals("detainRoomPhoto") && !databean.getRoomname().equals("")){
			
			databean.setRoomResult(this.sqlSessionTemplate.selectOne("mm.roomDetailPhoto",databean));
			
		}
		
		 
		return databean;
	}
	
	@RequestMapping
	public String popup(@PathVariable String service){
		return "popup/"+service;
	}
	
}
