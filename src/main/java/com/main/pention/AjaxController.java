package com.main.pention;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.DataBean;
import com.model.Menu;

@Controller
@RequestMapping("ajax/{folder}/{service}")
public class AjaxController {

	
	@Resource
	SqlSessionTemplate sqlsessiontemplate;
	
	
	Object res;
	
	
	@Resource
	DataBean databean;
	
	
	Method method;
	
	@ModelAttribute("ajaxbean")
	public Object ajax(@PathVariable String folder, @PathVariable String service, DataBean databean){
		if(folder.equals("mainPage") && service.equals("afterBoard")){
			
			this.databean.setA_start((databean.getA_page()-1)*databean.getA_limit()+1);
			this.databean.setA_end(databean.getA_page()*databean.getA_limit());
			
			
			
			databean.setA_maxPage(((Integer)this.sqlsessiontemplate.selectOne("mm.aftercount")));
		
			databean.setAfterBoard(this.sqlsessiontemplate.selectList("mm.afterlist", this.databean));
			
			databean.setA_startPage(((databean.getA_page()-1)/databean.getA_limitPage())* databean.getA_limitPage()+1);	
			
			databean.setA_endPage(databean.getA_startPage()+databean.getA_limitPage()-1);
		}
		else if(folder.equals("area") && service.equals("mainPageRanking")){
			databean.setMainPageOne(this.sqlsessiontemplate.selectOne("mm.mainPageOne",databean));
			databean.setMainPageList(this.sqlsessiontemplate.selectList("mm.mainPageList",databean));
			
			if(databean.getMainPageOne()!=null){
				this.databean.setChuchunRank(((List)databean.getMainPageList()).size());
			}
			
		}
		else if(folder.equals("area") && service.equals("topSerch")){
			ArrayList list = new ArrayList();
			
			databean.setSuggestResult(this.sqlsessiontemplate.selectList("mm.suggestpension",databean));
			
			if(((List)databean.getSuggestResult()).size() !=0 || databean.getSuggestResult()!=null){
				
				for(int i=0; i<((List)databean.getSuggestResult()).size();i++ ){
					list.add(((DataBean)((List)databean.getSuggestResult()).get(i)).getPentionName());
				}
				
			}
			
			databean.setSuggestResult(this.sqlsessiontemplate.selectList("mm.suggestArea",databean));
			if(((List)databean.getSuggestResult()).size() !=0 || databean.getSuggestResult()!=null){
				for(int i=0; i<((List)databean.getSuggestResult()).size();i++ ){
					list.add(((DataBean)((List)databean.getSuggestResult()).get(i)).getAddress1());
				}
			}
			databean.setSuggestMsg((list.size()*18)+"");
			System.out.println(databean.getSuggestMsg());
			databean.setSuggestResult(list);
		}
		
		
		else if(folder.equals("area") && service.equals("detailBoardDelete")){
			this.databean.setPid(databean.getPid());
			this.databean.setNo(databean.getNo());
			
			this.sqlsessiontemplate.delete("mm.detailBoardDelete",this.databean);
			
			
			this.databean.setdPage(1);
			this.databean.setPid(databean.getPid());
			this.databean.setDstart((databean.getdPage()-1) * databean.getDlimit()+1);
			this.databean.setDend(this.databean.getdPage()*databean.getDlimit());
			
			
			databean.setDtotalPage(((Integer)this.sqlsessiontemplate.selectOne("mm.getTotalCount",this.databean)));
			databean.setdBoardResult(this.sqlsessiontemplate.selectList("mm.detailBoardList",this.databean));
			databean.setdStartPage(((databean.getdPage()-1)/databean.getDpageLimit())* databean.getDpageLimit()+1);	
			databean.setdEndPage(databean.getdStartPage()+databean.getDpageLimit()-1);
		
			
		}
		else if(folder.equals("area") && service.equals("detailBoardModifyWrite")){
			this.databean.setPid(databean.getPid());
			this.databean.setNo(databean.getNo()); //글의 번호
			this.databean.setDtitle(databean.getDtitle()); //글의 제목
			this.databean.setDcontent(databean.getDcontent()); //글의 내용 업데이트
			
			this.sqlsessiontemplate.update("mm.detailBoardModifyUpdate", this.databean);
			databean.setdBoardResult(this.sqlsessiontemplate.selectOne("mm.getDetailInfo", this.databean));
			
		}
		else if(folder.equals("area") && service.equals("detailBoardModifyGo")){
		
			this.databean.setPid(databean.getPid()); //펜션주인. 
			this.databean.setNo(databean.getNo());//클릭한 글번호
			databean.setdBoardResult(this.sqlsessiontemplate.selectOne("mm.getDetailInfo", this.databean));
			
		}
		else if(folder.equals("area") && service.equals("detailBoardReplyWrite")){
			
			this.databean.setPid(databean.getPid()); //펜션주인. 
			this.databean.setDuser(databean.getDuser()); //입력유저
			this.databean.setNo(databean.getNo());//클릭한 글번호
			this.databean.setDtitle(databean.getDtitle());//넘어온 글의 제목
			this.databean.setDcontent(databean.getDcontent());//넘어온 글의 내용
			
			databean.setdBoardResult(this.sqlsessiontemplate.selectOne("mm.getDetailInfo", this.databean));//해당글번호로 조회해서 디테일에담아두고.
			
			//글의 정보를 가져오고 ~ 
			this.databean.setDseq(((DataBean)databean.getdBoardResult()).getDseq());  
			this.databean.setDref(((DataBean)databean.getdBoardResult()).getDref()); 
			this.databean.setGno(((DataBean)databean.getdBoardResult()).getGno());//그룹넘버 입력.
			
			this.sqlsessiontemplate.update("mm.detailBoardUpdateSeq", this.databean);
			
			this.databean.setDseq(((DataBean)databean.getdBoardResult()).getDseq()+1); 
			this.databean.setDref(((DataBean)databean.getdBoardResult()).getDref()+1);  
			
			this.sqlsessiontemplate.insert("mm.detailWriteReply",this.databean);
			
			this.sqlsessiontemplate.update("mm.detailAddCount", this.databean);
			databean.setdBoardResult(this.sqlsessiontemplate.selectOne("mm.getDetailInfo", this.databean));
			
		}
		else if(folder.equals("area") && service.equals("detailBoardDetailView")){
			this.databean.setPid(databean.getPid());
			this.databean.setNo(databean.getNo());
			
			this.sqlsessiontemplate.update("mm.detailAddCount", this.databean);
			databean.setdBoardResult(this.sqlsessiontemplate.selectOne("mm.getDetailInfo", this.databean));
		}
		else if(folder.equals("area") && service.equals("detailBoardInPut")){
			
			this.databean.setPid(databean.getPid());
			
			
			
			this.databean.setdBoardResult(this.sqlsessiontemplate.selectOne("mm.getdeTailMaxNo",this.databean)); 
			
			if(this.databean.getdBoardResult()==null || this.databean.getdBoardResult().equals("null")){
				this.databean.setPid(databean.getPid());
				this.databean.setDuser(databean.getDuser());
				this.databean.setDcontent(databean.getDcontent());
				this.databean.setDtitle(databean.getDtitle());
				this.sqlsessiontemplate.insert("mm.detailBoardInsertNull", this.databean);
			}else{
				this.databean.setPid(databean.getPid());
				this.databean.setDuser(databean.getDuser());
				this.databean.setDcontent(databean.getDcontent());
				this.databean.setDtitle(databean.getDtitle());
				this.sqlsessiontemplate.insert("mm.detailBoardInsert", this.databean);
			}
			
			
			this.sqlsessiontemplate.update("mm.detailAddCount", this.databean);

			databean.setdBoardResult(this.sqlsessiontemplate.selectOne("mm.getDetailInfo", this.databean));
		
		}
		
		else if(folder.equals("area") && service.equals("detailBoard")){
			
			this.databean.setdPage(databean.getdPage());
			this.databean.setPid(databean.getPid());
			this.databean.setDstart((databean.getdPage()-1) * databean.getDlimit()+1);
			this.databean.setDend(this.databean.getdPage()*databean.getDlimit());
			
			
		
			databean.setDtotalPage(((Integer)this.sqlsessiontemplate.selectOne("mm.getTotalCount",this.databean)));
			databean.setdBoardResult(this.sqlsessiontemplate.selectList("mm.detailBoardList",this.databean));
			databean.setdStartPage(((databean.getdPage()-1)/databean.getDpageLimit())* databean.getDpageLimit()+1);	
			databean.setdEndPage(databean.getdStartPage()+databean.getDpageLimit()-1);
			
		}
		
		
		else if(folder.equals("area") && service.equals("allRoomList")){//여기에서 방의 값들을 룸인포에 셋팅 하는데, 그 전에 그 값을 가지고 db를 다녀와야한다. 
			
			this.databean.setPid(databean.getPid()); //펜션주인의 아이디
			this.databean.setMybatiseDate(databean.getChoiceYear(), databean.getChoiceMonth(), databean.getChoiceDay());
		
			this.res =null;
			this.res = this.sqlsessiontemplate.selectList("mm.selectAllRoom", this.databean); 
			
			for(int i=0; i<((List<DataBean>)res).size(); i++){
				DataBean check = new DataBean();
				Object checkres = null;
				
				this.databean.setRoomname(((List<DataBean>)res).get(i).getRoomname()); //방의 제목을 저장해준다.
				
				checkres = this.sqlsessiontemplate.selectOne("mm.serchYeyakRoom",this.databean);
				
				if(checkres==null){
					
				}else{
					((List<DataBean>)res).get(i).setRoomyeyak("예약완료");
				}
				
			}
			databean.setRoomInfo(this.res);
		}
		
		
		else if(folder.equals("area") && service.equals("yeyakList")){
			ArrayList<Menu> list = new ArrayList();
			int cnt = 6;
			this.databean.setPid(databean.getPid()); //펜션주인의 아이디
			this.databean.setRoomname(databean.getRoomname());//방의 이름
		
			Calendar car = Calendar.getInstance();
			
			for(int i=0; i<7; i++){
				int year=Integer.parseInt(databean.getChoiceYear());
				int month=Integer.parseInt(databean.getChoiceMonth());
				int day=Integer.parseInt(databean.getChoiceDay())+i;
				
				car.set(year, month, day);
				
				this.databean.setMybatiseDate(car.get(Calendar.YEAR)+"",car.get(Calendar.MONTH)+"",car.get(Calendar.DATE)+"");
				this.res=this.sqlsessiontemplate.selectOne("mm.yeyakSerchSeven",this.databean);
				
	
				
				if(res==null){
					list.add(new Menu(car.get(Calendar.MONTH)+"월 "+car.get(Calendar.DATE)+"일","예약가능"));
				}else{
					list.add(new Menu(car.get(Calendar.MONTH)+"월 "+car.get(Calendar.DATE)+"일","예약완료"));
				}
				
			}
			
			for(int i=7; i>=1; i--){
				if(((Menu)list.get(i-1)).getTopkey().equals("예약완료")){
					cnt=i-1;
				}
			}
			
			this.res=null;
			
			this.res = this.sqlsessiontemplate.selectOne("mm.selectRoomOne",this.databean);
			
			
		
			
			if(res!=null){
				databean.setMax(((DataBean)res).getMax());
				databean.setMin(((DataBean)res).getMin());
				databean.setAddmoney(((DataBean)res).getAddmoney());
				databean.setPentionName(((DataBean)res).getPentionName());
			}
			
			
			databean.setRoomChoice(cnt);
			
			databean.setYeyakInfo(list);
		}

		 
		
		return databean;
	}

	
	
	@RequestMapping()
	public String goUrl(@PathVariable String folder, @PathVariable String service){
		if(service.equals("detailBoardInPut")){
			service="detailBoardDetailView";
		}else if(service.equals("detailBoardReplyWrite")){
			service="detailBoardDetailView";
		}else if(service.equals("detailBoardModifyWrite")){
			service="detailBoardDetailView";
		}else if(service.equals("detailBoardDelete")){
			service="detailBoard";
		}
		
		
		return "view/"+folder+"/"+service;
	}
	
	
	
	
	
	
}
