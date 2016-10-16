package com.service;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.di.Action;
import com.model.DataBean;


@Controller
public class Area implements Action {
	

	@Resource
	DataBean databean;

	@Resource
	SqlSessionTemplate sqlSessionTemplate;

	Method method;

	@Resource
	HttpSession session;

	Object res=null;
	
	
	@Override
	public void execute() throws Throwable{
		this.databean.setTopList(this.sqlSessionTemplate.selectList("mm.topMenu",this.databean));
		this.databean.setMenuList(this.sqlSessionTemplate.selectList("mm.subMenu",this.databean));
		this.databean.setAreaMenuList(this.sqlSessionTemplate.selectList("mm.areaMenu",this.databean));
	
		this.method = getClass().getDeclaredMethod(this.databean.getService()); //서비스키에 실행시킬 값을 정해서 보낸다?
		this.method.invoke(this);
	}
	
	
	public void areaSerch(){
		this.databean.setAreaSerchList(this.sqlSessionTemplate.selectList("mm.areaGetList",this.databean));
	}
	
	public void areaDetail(){
		this.databean.setPentionResult(this.sqlSessionTemplate.selectOne("mm.areaPentionDetail",this.databean));
	}
	
	
}
