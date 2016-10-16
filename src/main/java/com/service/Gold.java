package com.service;

import java.lang.reflect.Method;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.di.Action;
import com.model.DataBean;


@Controller
public class Gold implements Action {

	@Resource
	DataBean databean;

	@Resource
	SqlSessionTemplate sqlSessionTemplate;

	Method method;
	
	@Override
	public void execute() throws Throwable{
		this.databean.setTopList(this.sqlSessionTemplate.selectList("mm.topMenu",this.databean));
		this.method = getClass().getDeclaredMethod(this.databean.getService());
		this.method.invoke(this);
		
	}
	
	public void goldSerch(){
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getChuchunListGold"));
	}
	
	public void chuchunDetail(){
		System.out.println("추천 디테일");
		this.databean.setPentionResult(this.sqlSessionTemplate.selectOne("mm.areaPentionDetail",this.databean));
	}
	
	
}
