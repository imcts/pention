package com.service;

import java.lang.reflect.Method;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.di.Action;
import com.model.DataBean;


@Service
public class MainPage implements Action {
	

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

	public void mainPage(){
		System.out.println("여기는 메인 페이지 입니다.");	
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getGoldGrade"));
		
		this.databean.setAreaSerchList(this.sqlSessionTemplate.selectList("mm.mainPageQna"));
		this.databean.setThemaSerchList(this.sqlSessionTemplate.selectList("mm.mainPageNotice"));
		
		
	}
	
	public void topSerch(){
		System.out.println("여기는 탑 서치 입니다.");
		System.out.println(this.databean.getTopSerch()+" : 의 명령어로 검색.");
		
		if(this.databean.getTopSerch().equals("allSerch")){
			this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.AllPentionListGet"));
		}
		else{
			this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.choicePentionListGet",this.databean));
		}
		 this.databean.setAfterBoard(sqlSessionTemplate.selectList("mm.afterlist",this.databean));
         this.databean.setA_start((this.databean.getA_page()-1)*this.databean.getA_limit()+1);
         this.databean.setA_end(this.databean.getA_start()+this.databean.getA_limit()-1);
	}
	
	public void chuchunDetail(){
		this.databean.setPentionResult(this.sqlSessionTemplate.selectOne("mm.areaPentionDetail",this.databean));
	}
}
