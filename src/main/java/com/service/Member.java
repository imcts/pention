package com.service;

import java.lang.reflect.Method;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.di.Action;
import com.model.DataBean;
import com.model.Email;
import com.model.File_All; 
import com.model.LoginUser;


@Controller
public class Member implements Action {

	@Resource
	DataBean databean;

	@Resource
	SqlSessionTemplate sqlSessionTemplate;

	@Resource
	File_All file;

	@Resource
	Email email;

	@Resource
	HttpSession session;

	Method method;

	Object result=null;

	Object res=null;
	
	@Override
	public void execute() throws Throwable{
		this.databean.setTopList(this.sqlSessionTemplate.selectList("mm.topMenu",this.databean));
		this.method = getClass().getDeclaredMethod(this.databean.getService());
		this.method.invoke(this);	
		
	}
	
	
	private void myPage(){
		
		this.databean.setGrade(((LoginUser)session.getAttribute("logchk")).getGrade());
		this.databean.setMypageMenuList(this.sqlSessionTemplate.selectList("mm.myPageSub",this.databean));
		
		//System.out.println(this.databean.getGrade()+":그레이드값.");
		if(this.databean.getGrade()==1){
			this.adminPentionView();
		}
		else if(this.databean.getGrade()==2){
			this.yeyak();
		}
		else{
			this.yeyak();
		}

		//초기의 뷰페이지값. 
		
		//차후 뷰페이지에서 서브밋 실행시에는 ->
		
		
	}
	


	private void idMatchingCheck(){
		this. result = this.sqlSessionTemplate.selectOne("mm.idChk",this.databean);
		if(result==null){
			this.databean.setIdMsg("사용할 수 있는 아이디입니다.");
			this.databean.setColor("#41b431");
			this.databean.setIdCheckIndex("1");
		}else{
			this.databean.setIdMsg("사용중인 아이디 입니다.");
			this.databean.setColor("red");
			this.databean.setIdCheckIndex("0");
		}
	}
	
	//------------------------------------------------------------------------------------------------------------	
 	private void modifyEmailGo() throws Exception{
 			System.out.println("modifyemailgo================================================================시작======");
 			int random = (int)(Math.random()*999999)+1;
 			this.databean.setEmailNumber(random);
 			this.email.sendMail("POL  회원수정인증번호 입니다.", "인증번호 : "+random+" 을 입력해 주세요.", "imcts@nate.com", this.databean.getEmail());
 			this.databean.setUser("modify");
 			System.out.println("modifyemailgo================================================================끝======");
 	}
	
	private void yakgwan(){}
	
	private void idserchForm(){}
	
	private void pwserchForm(){}
	
	private void emailGo() throws Exception{
		int random = (int)(Math.random()*999999)+1;
		this.databean.setEmailNumber(random);
		this.email.sendMail("POL 회원가입 인증번호 입니다.", "인증번호 : "+random+" 을 입력해 주세요.", "imcts@nate.com", this.databean.getEmail());
	}
	
	private void idSerchemailGo() throws Exception{
		int random = (int)(Math.random()*999999)+1;
		this.databean.setEmailNumber(random);
		this.email.sendMail("POL 아이디 찾기 인증번호 입니다.", "인증번호 : "+random+" 을 입력해 주세요.", "imcts@nate.com", this.databean.getEmail());
		this.databean.setService("idserchForm");
	}
	
	private void pwSerchemailGo() throws Exception{
		int random = (int)(Math.random()*999999)+1;
		this.databean.setEmailNumber(random);
		this.email.sendMail("POL 비밀번호 찾기  인증번호 입니다.", "인증번호 : "+random+" 을 입력해 주세요.", "imcts@nate.com", this.databean.getEmail());
		this.databean.setService("pwserchForm");
	}
	
	
	private void logOut(){
		this.databean.setMenu("mainPage");//로그아웃시 여기로 들어오게 되어있으니, 메뉴값을 메인으로 변경.
		session.removeAttribute("logchk");
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getGoldGrade"));
		this.databean.setAreaSerchList(this.sqlSessionTemplate.selectList("mm.mainPageQna"));
		this.databean.setThemaSerchList(this.sqlSessionTemplate.selectList("mm.mainPageNotice"));
	}
	
	private void login(){
		this.result = this.sqlSessionTemplate.selectOne("mm.idChk",this.databean);
			if(this.result!=null){ //아이디가 존재한다면. 
				if(((DataBean)result).getId().equals(this.databean.getId()) && ((DataBean)result).getPassword().equals(this.databean.getPassword())){
					this.session.setAttribute("logchk", new LoginUser(((DataBean)result).getId(),((DataBean)result).getName() ,((DataBean)result).getGrade(),((DataBean)result).getEmail(),((DataBean)result).getTell(),((DataBean)result).getSaupjaIndex())); 
				}
		}
	}
	
	private void gaip(){
		this.result = this.sqlSessionTemplate.insert("mm.newMemberInput", this.databean);
	
		this.databean.setMenu("member");
		this.databean.setMain("loginView");
		this.databean.setService("login");
	}
	
	private void idserch(){
		this.result=null;
		this.result = this.sqlSessionTemplate.selectList("mm.findId", this.databean);
		this.databean.setUserData(null);
		this.databean.setFindPassword(null);
		
		if(this.result!=null){
			this.databean.setUserData((List<DataBean>)this.result);
		}
		
		this.databean.setMain("findResult");
	}
	
	private void pwserch(){
		this.result=null;
		this.result = this.sqlSessionTemplate.selectOne("mm.findPassword",this.databean);
		this.databean.setUserData(null);
		this.databean.setFindPassword(null);
		
		if(this.result!=null){
			this.databean.setFindPassword(this.result);
		}
		
		this.databean.setMain("findResult");
		
	}
	
	private void yeyakGO(){
		this.yeyakcal();
	}
	
	
	
	private void yeyakInput(){
		this.databean.setGrade(((LoginUser)session.getAttribute("logchk")).getGrade());
		this.databean.setMypageMenuList(this.sqlSessionTemplate.selectList("mm.myPageSub",this.databean));
		this.databean.setBank(this.databean.getBank().substring(1));		
		
		
		String [] arr=this.databean.getYeyakDay().split("-");
		
		int yeyakday = Integer.parseInt(this.databean.getYeyakTerm());
		int year = Integer.parseInt(arr[0]);
		int month = Integer.parseInt(arr[1]);
		int day = Integer.parseInt(arr[2]);
		int money = Integer.parseInt(this.databean.getYeyakMoney());
		int nmoney = money/yeyakday;
		this.databean.setYeyakMoney(nmoney+"");
		
		this.databean.setMilige(money);
		System.out.println(this.databean.getMilige()+"마일리지의값.");
		
		this.sqlSessionTemplate.update("mm.addMilige",this.databean);
		
		
		
		this.databean.setdBoardResult(null);
		this.databean.setdBoardResult(this.sqlSessionTemplate.selectList("mm.getYeyakRoomIndex"));
		
		Calendar cal = Calendar.getInstance();
		
		for(int i=0; i<yeyakday; i++){
			cal.set(year, month, day+i); 
			
			String inputday=(cal.get(Calendar.YEAR)+"").substring(2)+"/";
			
			if((cal.get(Calendar.MONDAY)+"").length()<2){
				inputday+="0"+cal.get(Calendar.MONDAY)+"/";
			}else{
				inputday+=cal.get(Calendar.MONDAY)+"/";
			}
			
			if((cal.get(Calendar.DATE)+"").length()<2){
				inputday+="0"+cal.get(Calendar.DATE);
			}else{
				inputday+=cal.get(Calendar.DATE);
			}
			
			
			if(i==0){
				this.databean.setStartday(inputday);
			}
			//
			//System.out.println(inputday+"최종입력될 날자.");
			this.databean.setYeyakDay(inputday);
			
			
			if(((List)this.databean.getdBoardResult()).size()==0){//만약에 널이라면 여길 들어와서 1로 셋팅 되어야지.
				this.databean.setRoomindex(1);
				this.sqlSessionTemplate.insert("mm.yeyakInput", this.databean);
			}else{//1번글이 있다면 1번글로만 갈거구, 1번글이 없다면 이 아래로만 가기 때문에 
				if(i==0){
					this.databean.setRoomIndexResult(null);
					this.databean.setRoomIndexResult(this.sqlSessionTemplate.selectList("mm.getYeyakMaxRoomIndex"));
				}
				System.out.println(((Integer)((List)this.databean.getRoomIndexResult()).get(0))+" : 룸인덱스의값!!!");
				this.databean.setRoomindex( ((Integer)((List)this.databean.getRoomIndexResult()).get(0))  );
				this.sqlSessionTemplate.insert("mm.yeyakInput", this.databean);
			}
			   
			
		}
		
	
		
		
	
		
/*		System.out.println(this.databean.getStartday()+" : 예약시작일");
		System.out.println(this.databean.getPid()+" : 펜션주인.");
		System.out.println(this.databean.getYeyakid()+" : 예약아이디");
		System.out.println(this.databean.getYeyakTerm()+" : 박수");
		System.out.println(this.databean.getYeyakroomname()+" : 예약방");
		System.out.println(this.databean.getYeyakpentionName()+" : 예약펜션");
		System.out.println(this.databean.getYeyakMoney()+" : 예약금액");
		System.out.println(this.databean.getYeyakInwon()+" : 예약인원");
		System.out.println(this.databean.getRoomindex()+" : 룸 인덱스");*/
		
		this.databean.setYeyakMoney(money+"");
		
		this.sqlSessionTemplate.insert("mm.returningInsert",this.databean);
		
		
		
		/* 
		System.out.println(this.databean.getYeyakDay()+": DB에 입력할 날자값.");
		System.out.println(this.databean.getYeyakroomname()+"예약방");
		System.out.println(this.databean.getYeyakMoney()+"예약금액");
		System.out.println(this.databean.getYeyakInwon()+"예약인원");
		System.out.println(this.databean.getYeyakpentionName()+"예얏펜션");
		System.out.println(this.databean.getBank()+"변환후 은행의 값.");
		System.out.println(this.databean.getCard()+"카드번호");*/
		this.yeyak(); 
	}
	
	
	

	private void yeyakcal() {
		DataBean bean = new DataBean();
		bean.setPid(this.databean.getPid()); //펜션주의 아이디.
		bean.setYeyakroomname(this.databean.getYeyakroomname()); //예약하려는 방의 이름
		bean.setYeyakpentionName(this.databean.getYeyakpentionName()); //예약하려는 펜션이름
		bean.setYeyakid(this.databean.getYeyakid()); //예약하려는 유저의 아이디.
		
		
		String [] arr = this.databean.getYeyakDay().split(",");
		
		
		int year = Integer.parseInt(arr[0]);
		int month = Integer.parseInt(arr[1]);
		int day = Integer.parseInt(arr[2]);
		int min = Integer.parseInt(this.databean.getYeyakmin());
		int money = Integer.parseInt(this.databean.getYeyakMoney());
		int addmoney = Integer.parseInt(this.databean.getYeyakAddMoney());
		int term = Integer.parseInt(this.databean.getYeyakTerm().substring(1));
		int inwon = Integer.parseInt(this.databean.getYeyakInwon().substring(1));
		
		/*요금을 구하는 방법
		 * 1: 만약 최소인원수만큼만 예약했다면 예약금액 x 예약일수 - > 예약금액. 
		 * 2: 만약에 인원수가 min보다 높다면- > 예약금액 + 추가금액 (인원수 x 추가금액) x 예약일수 -> 예약금액.
		 * */
		
		if(inwon > min){//만약 최소인원수보다 예약인원이 높다면 
			int res = (money + (addmoney*(inwon-min))) * term;
			this.databean.setYeyakMoney(res+""); //예약하려는 방의 예약금액.
			this.databean.setYeyakOverInwon((inwon-min)+"");
		}else{//높지 않다면. 
			int res = money * term;
			this.databean.setYeyakMoney(res+""); //예약하려는 방의 예약금액.
			this.databean.setYeyakOverInwon("0");
		}//예약금액까지 완료.
		
		this.databean.setYeyakDay(year+"-"+month+"-"+day);//이용일
		this.databean.setYeyakTerm(term+"");//몇박
		this.databean.setYeyakInwon(inwon+"");//에약인원
		/*
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		System.out.println(min);
		System.out.println(money);
		System.out.println(addmoney);
		System.out.println(term);
		System.out.println(inwon);
		*/
	}

	private void yeyak(){
		//System.out.println("마이페이지 예약및 결제보기 입장");
		// 뿌려지는 구간이잖아. 접속자의 아이디와 동일한놈이어야 한다. 
		this.databean.setYeyakid(((LoginUser)this.session.getAttribute("logchk")).getId());
		this.databean.setHwanbulInfo(this.sqlSessionTemplate.selectList("mm.hwanbulListGet",this.databean));
		
		//예약기간, 
		
		Calendar car = Calendar.getInstance();
		
		
		if(((List)this.databean.getHwanbulInfo()).size()!=0 || this.databean.getHwanbulInfo()!=null){ //조회한 값이 있다면
			for(int i=0; i<((List)this.databean.getHwanbulInfo()).size(); i++){
				String [] arr = ((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).getStartday().split("/");
				String yeyakday = "20"+arr[0]+"년"+arr[1]+"월"+arr[2]+"일 ~";
				int year = Integer.parseInt("20"+arr[0]);
				int month = Integer.parseInt(arr[1]);
				int date = Integer.parseInt(arr[2]);
				int bak = Integer.parseInt(((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).getYeyakTerm());
				
				Calendar yeyak = Calendar.getInstance();
				yeyak.set(year, month, date+bak-1);
				
				yeyakday+=yeyak.get(Calendar.YEAR) +"년"+ yeyak.get(Calendar.MONTH)+"월"+yeyak.get(Calendar.DATE)+"일";
				((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).setYeyakDay(yeyakday);
				
				
				yeyak.set(year, month-1, date);
				
				
				
				 int time = (int)((car.getTimeInMillis()-yeyak.getTimeInMillis())/(1000*60*60*24));
				// System.out.println(time+"두 날자간의 차이값.");
				
				if(((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).getHwanbulMsg().equals("환불완료")){
					((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).setYeyakMsg("<font color=\"#ffc000\" face=\"dothum\" style=\"font-weight:bold; font-size:11pt;\">환불완료</font>");
				}else{
					if(time < 0){ //환불가능
					//	System.out.println(((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).getYeyakroomname());
						((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).setYeyakMsg("<a href=\"javascript:;\" onclick=\"hwanbulForm('"+((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).getRoomindex()+"')\"><img src=\"../../../resources/menuimage/HwanBuluttonCl.jpg\"></a>");
					}else{//환불불가
						((DataBean)((List)this.databean.getHwanbulInfo()).get(i)).setYeyakMsg("<font color=\"red\" face=\"dothum\" style=\"font-weight:bold; font-size:11pt;\">환불불가</font>");
					}
				}
				 
				
				
				
			}
		}
		
		
	this.databean.setSaupjaViewPage("yeyak");
	this.databean.setUserViewPage("yeyak");
		
	}
	
	
	public void hwanbulUpdate(){//환불 완료시 펜션주 마일리지 제거, 예약테이블 예약 제거, 결제테이블 환불완료로 변경.
		System.out.println(this.databean.getRoomindex()+"룸인덱스");
		//여기에서 해야 하는 것들 : 
		System.out.println(this.databean.getMilige()+" : 환불금액");
		
		System.out.println(this.databean.getPid()+" : 펜션주아이디");
		
		
		this.sqlSessionTemplate.update("mm.deleteYeyak",this.databean);
		
		System.out.println("딜리트 실행완료");
		this.sqlSessionTemplate.update("mm.hwanbulOk",this.databean);
		System.out.println("환불완료변경");
		this.sqlSessionTemplate.update("mm.miligeUpdate",this.databean);
		System.out.println("마일리지 업데이트 완료 ");
		
		yeyak();
	}

	private void hwanbulView(){
	//	System.out.println(this.databean.getRoomindex()+"룸인덱스");
		
		this.databean.setHwanbulInfo(this.sqlSessionTemplate.selectOne("mm.hwanBulOneGet",this.databean));
		this.databean.setSaupjaViewPage("hwanbulView");
		
		String [] arr = ((DataBean)this.databean.getHwanbulInfo()).getStartday().split("/");
		
		Calendar car = Calendar.getInstance();
		Calendar yeyak = Calendar.getInstance();
		
		int year = Integer.parseInt("20"+arr[0]);
		int month = Integer.parseInt(arr[1]);
		int date = Integer.parseInt(arr[2]);
		
		yeyak.set(year, month-1, date);
		
		
		int day = (int) ((car.getTimeInMillis()-yeyak.getTimeInMillis())/(1000*60*60*24));
		
		
	//	System.out.println(day+"일자 차이값.");
		
		
		if(day==-1){//50%
			((DataBean)this.databean.getHwanbulInfo()).setHwanbulSusu(50);
		}else if(day==-2){//70%
			((DataBean)this.databean.getHwanbulInfo()).setHwanbulSusu(70);
		}else if(day <= -3 && day >= -6 ){ //80%
			((DataBean)this.databean.getHwanbulInfo()).setHwanbulSusu(80);
		}else if(day==-7){//90%
			((DataBean)this.databean.getHwanbulInfo()).setHwanbulSusu(90);
		}else{//100%
			((DataBean)this.databean.getHwanbulInfo()).setHwanbulSusu(100);
		}
		
		//System.out.println(((DataBean)this.databean.getHwanbulInfo()).getHwanbulSusu()+"환불 퍼센트");

		double cal = (      (double)(((DataBean)this.databean.getHwanbulInfo()).getHwanbulSusu())/100) * Integer.parseInt(((DataBean)this.databean.getHwanbulInfo()).getYeyakMoney()     );
			
		int money = (int)cal;
		
		((DataBean)this.databean.getHwanbulInfo()).setHwanbulMoney( money );
		
		this.databean.setMilige(money);
		
	
		//System.out.println(((DataBean)this.databean.getHwanbulInfo()).getHwanbulMoney()+"환불액");
	}
	
	private void money() {
		LoginUser e = null;
		e = (LoginUser) this.session.getAttribute("logchk");
		this.databean.setId(e.getId());
		this.databean.setPoint((Integer) this.sqlSessionTemplate.selectOne(
				"mm.getmile", this.databean));
	}
	
	private void userModify(){
 		this.databean.setUser("modify");
 	}
	
	private void modifycom(){
 		this.sqlSessionTemplate.update("mm.memberModify",this.databean);
 		this.result = this.sqlSessionTemplate.selectOne("mm.idChk",this.databean);
 		this.session.setAttribute("logchk", new LoginUser(((DataBean)result).getId(),((DataBean)result).getName() ,((DataBean)result).getGrade(),((DataBean)result).getEmail(),((DataBean)result).getTell(),((DataBean)result).getSaupjaIndex()));
 		this.databean.setUser("modify");
 	}
	
	private void memberExit(){}
	

	private void memberExitCom() {
		this.sqlSessionTemplate.update("mm.memberExit", this.databean);
		this.databean.setMenu("mainPage");
		this.databean.setMain("mainView");
		this.databean.setService("mainPage");

		session.removeAttribute("logchk");

	}
	
	
	
	private void userGamang(){
		
		int saupjaIndex = ((LoginUser)this.session.getAttribute("logchk")).getSaupjaIndex();
	
		if(saupjaIndex == 1 && this.databean.getMsgIndex().equals("go") && !this.databean.getSaupjaGamangId().equals("")){
			this.databean.setId(this.databean.getSaupjaGamangId());
			this.sqlSessionTemplate.update("mm.saupjaGamangGo",this.databean);
			this.result=null;
			this.result = this.sqlSessionTemplate.selectOne("mm.idChk",this.databean);
			
			this.session.setAttribute("logchk", new LoginUser(((DataBean)result).getId(),((DataBean)result).getName(),((DataBean)result).getGrade(),((DataBean)result).getEmail(),((DataBean)result).getTell(),((DataBean)result).getSaupjaIndex()));
		}
	}
	
	private void pentionForm(){
		this.databean.setSaupja("mypention");
	}
	
	private void pentionInsert(){
	
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
		this.databean.setTell(((LoginUser)this.session.getAttribute("logchk")).getTell());
		this.databean.setThema(this.file.commaPlus(this.databean.getThemaChoice()));
		this.databean.setThemaOptionGet(this.file.commaPlus(this.databean.getOptionChoice()));
		
		this.file.PentionfileInput(this.databean.getPentionPhoto(),"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\pentionimage\\");
		
		this.sqlSessionTemplate.insert("mm.pentionInsertNow",this.databean);
		
	
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
		
		this.databean.setSaupja("mypention"); //메뉴키값을 설정해서 초이스 상태로 만든다.
	}
	
	private void pentionUpdate(){
		
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
	
		
		this.databean.setdBoardResult((this.sqlSessionTemplate.selectOne("mm.getPentionOne",this.databean)));
		this.file.deleteFile(((DataBean)this.databean.getdBoardResult()).getMainphoto(),((DataBean)this.databean.getdBoardResult()).getAreaphoto(),"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\pentionimage\\");
		
		
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
		this.databean.setThema(this.file.commaPlus(this.databean.getThemaChoice()));
		this.databean.setThemaOptionGet(this.file.commaPlus(this.databean.getOptionChoice()));
		
		
		this.file.PentionfileInput(this.databean.getPentionPhoto(),"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\pentionimage\\");
		
		
		this.sqlSessionTemplate.update("mm.pentionUpdateNow",this.databean);
		
		
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
		this.databean.setRoomResult(this.sqlSessionTemplate.selectList("mm.getPentionRoomList",this.databean));
		this.databean.setSaupja("mypention"); //메뉴키값을 설정해서 초이스 상태로 만든다.
		
	}
	
	private void roomnameChecking(){
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
		this.result=this.sqlSessionTemplate.selectOne("mm.roomnameChecking",this.databean);
		
		if(this.result==null){
			this.databean.setIdMsg("사용중인 방이름이 아닙니다.");
			this.databean.setColor("#41b431");
			this.databean.setRoomnameCheck("1");
		}else{
			this.databean.setIdMsg("사용중인 방이름입니다.");
			this.databean.setColor("red");
			this.databean.setRoomnameCheck("0");
		}
	}
	
	private void updatePentionRoom(){/*
		System.out.println(((LoginUser)this.session.getAttribute("logchk")).getId()+" : 펜션주 아이디");
		System.out.println(this.databean.getRoomname()+" : 방이름");
		System.out.println(this.databean.getMax()+" : 최대 인원");
		System.out.println(this.databean.getMin()+" : 최소 인원");
		System.out.println(this.databean.getMoney()+" : 요금");
		System.out.println(this.databean.getAddmoney()+" : 추가요금");
		System.out.println(this.databean.getRoomsize()+" : 룸사이즈");
		System.out.println(this.databean.getRoomindex()+" : 룸인덱스");*/
		//야이씨 ㅡㅡ 파일을 안지우잖아 지금. 
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
		this.databean.setRoomResult(this.sqlSessionTemplate.selectOne("mm.getPentionRoomOne",this.databean));
		
		this.file.roomDeleteFile(this.file.commaDelete(((DataBean)this.databean.getRoomResult()).getRoomphoto()),"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\pentionimage\\");
		 
		
		this.file.pentionRoomPhotoInput(this.databean.getPentionPhoto(),"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\pentionimage\\");
		
		
		this.sqlSessionTemplate.update("mm.pentionRoomUpdate",this.databean);
		
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
		this.databean.setRoomResult(this.sqlSessionTemplate.selectList("mm.getPentionRoomList",this.databean));
		
		this.databean.setSaupja("mypention"); //메뉴키값을 설정해서 초이스 상태로 만든다.
	}
	
	private void pentionRoomUpdateForm(){
		//System.out.println(this.databean.getRoomindex()+"룸인덱스 펜션룸업데이트" );
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
		this.databean.setRoomResult(this.sqlSessionTemplate.selectOne("mm.getPentionRoomOne",this.databean));
		this.databean.setSaupja("mypention"); //메뉴키값을 설정해서 초이스 상태로 만든다.
	}
	
	
	private void myPentionRoomDelete(){
		//System.out.println(this.databean.getRoomindex()+" : 룸 인덱스");
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());

		this.databean.setRoomResult(this.sqlSessionTemplate.selectOne("mm.getPentionRoomOne",this.databean));
		
		this.file.roomDeleteFile(this.file.commaDelete(((DataBean)this.databean.getRoomResult()).getRoomphoto()),"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\pentionimage\\");
		 
		
		
		this.sqlSessionTemplate.delete("mm.deleteMyRoom",this.databean);
		
		
		//System.out.println("성고옹!!!!!");
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
		this.databean.setRoomResult(this.sqlSessionTemplate.selectList("mm.getPentionRoomList",this.databean)); 
		this.databean.setSaupja("mypention");
	}
	
	private void makeRoomInput(){
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
		
		//System.out.println(this.databean.getPentionName()+" : 펜션이름.");
		
		this.file.pentionRoomPhotoInput(this.databean.getPentionPhoto(),"C:\\work\\stsSave\\pention\\src\\main\\webapp\\resources\\menuimage\\pentionimage\\");
		
		this.databean.setRoomResult(this.sqlSessionTemplate.selectOne("mm.getRoomIndexMax",this.databean));
		
		
		if(this.databean.getRoomResult()==null || this.databean.getRoomResult().equals("null")){
			this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
			this.sqlSessionTemplate.insert("mm.makeRoomInputNull",this.databean);
		}else{
			this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
			this.sqlSessionTemplate.insert("mm.makeRoomInput",this.databean);
		}
		
		
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
		this.databean.setRoomResult(this.sqlSessionTemplate.selectList("mm.getPentionRoomList",this.databean)); 
		this.databean.setSaupja("mypention");
	}
	
	private void makeRoomForm(){
		this.databean.setSaupja("mypention"); //메뉴키값을 설정해서 초이스 상태로 만든다.
		//System.out.println(this.databean.getPentionName()+"멤버의 펜션이름 : ");
	}
	
	private void saupPention(){
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId()); //펜션주 아이디 입력. 
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
		this.databean.setRoomResult(this.sqlSessionTemplate.selectList("mm.getPentionRoomList",this.databean));
		this.databean.setYeyakInfo(this.sqlSessionTemplate.selectList("mm.getyeyakListMyPention",this.databean));
	
	}
	
	private void pentionModify(){
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId()); //펜션주 아이디 입력. 
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
		this.databean.setSaupja("mypention"); //메뉴키값을 설정해서 초이스 상태로 만든다.
	}

	private void adminMemberSuchView() {

		this.databean.setAdmin("member");
		this.databean.setK(null);
		this.databean.setK(this.databean.getSuchId());
		this.databean.setMemSuchList(this.sqlSessionTemplate.selectList("mm.memberList", this.databean));

	}

	private void memChangegGrade() {

		String id = this.databean.getUpId();

		Integer res = null;
		res = this.sqlSessionTemplate.selectOne("mm.mems", this.databean);// 해당아이디로
																			// 그레이드
																			// 값을
																			// 가져와ㅉ

		Object ress = null;

		if (res == 2 && this.databean.getChgrade() != 2) {// 해당아이디가 사업자라면 이프문에
															// 진입

			ress = this.sqlSessionTemplate.selectList("mm.selecpgrade",
					this.databean);

			this.databean.setUpId(id);
			if (ress == null || ress.equals("null")) {

				this.sqlSessionTemplate.update("mm.upgladeAndsaup",
						this.databean);// 멤버테이블의 그래이드를 바꿔준다

			} else {
				this.sqlSessionTemplate.update("mm.upPgrade", this.databean);// 팬션테이블의
																				// pgrade를
																				// 바꿔주고
				this.sqlSessionTemplate.update("mm.upgladeAndsaup",
						this.databean);// 멤버테이블의 그래이드를 바꿔준다
			}
		} else {
			this.sqlSessionTemplate.update("mm.upglade", this.databean);
		}

		this.databean.setMemSuchList(this.sqlSessionTemplate.selectList(
				"mm.upid", this.databean));

		this.databean.setAdmin("member");

	}

	
	
	private void chuchunIpChal(){
		System.out.println(this.databean.getSerchMsg()+"입력 받은 금액.");
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId());
		this.sqlSessionTemplate.update("mm.updateMyPoint",this.databean);
		
		//입찰 후 리스트로 보내는것이 있어야 하고 그냥 리스트를 보내는 것이 있어야 하므로.
		this.chuchunIpChalList();
	}
	
	 
	private void chuchunIpChalList() {
		//여기에서는 리스트를 뿌려야 한다. 
		this.databean.setChuchunResult(this.sqlSessionTemplate.selectList("mm.chuchunPentionGetList"));
		
		this.databean.setSaupjaViewPage("chuchunIpChalList");
	}


	private void gaipChuchun(){
		System.out.println("사업자 추천펜션 신청하기 입장.");
		this.databean.setPid(((LoginUser)this.session.getAttribute("logchk")).getId()); //펜션주 아이디 입력. 
		this.databean.setPentionResult(this.sqlSessionTemplate.selectList("mm.getPentionList",this.databean));//현재 등록된 아이디의 펜션 정보값을 가져온다.
	}
	
	private void okAdmin() {
		this.databean.setMemSuchList(null);
		Object res = null;
		res = this.sqlSessionTemplate.selectList("mm.selecpgraded",
				this.databean);
		if (res == null || res.equals("null")) {

			this.sqlSessionTemplate.update("mm.idUpgrade", this.databean);// 등업을  시켜준다

		} else {

			this.sqlSessionTemplate.update("mm.upPgraded", this.databean);// 팬션테이블의  pgrade를 바꿔주고

			this.sqlSessionTemplate.update("mm.idUpgrade", this.databean);// 등업을  시켜준다

		}

		this.databean.setMemSuchList(this.sqlSessionTemplate.selectList(
				"mm.selectsaupjaindex", this.databean));

		this.databean.setAdmin("pention");
	}

	// //////////////////////////////////////////////////////

	private void adminPentionView() {
		System.out.println("관리자 펜션 관리 페이지 입장.");
		///데이터 베이스에 사업자 인덱스가 2인놈들 을 긁어서뿌려준다
		this.databean.setMemSuchList(null);
		
		this.databean.setMemSuchList(this.sqlSessionTemplate.selectList("mm.selectsaupjaindex",this.databean));
		
	}
	
	private void refreshChuChunPention(){
		
		this.databean.setChuchunResult(this.sqlSessionTemplate.selectList("mm.chuchunPentionGetList")); //경매에 참가한 펜션의 목록.
		
			
		this.sqlSessionTemplate.update("mm.updatePentionReset",this.databean);
		
		if(((List)this.databean.getChuchunResult()).size()!=0 || this.databean.getChuchunResult()!=null){
			for(int i=0; i<((List)this.databean.getChuchunResult()).size(); i++){//일단, 결제 테이블에 인서트.
				this.databean.setSaupid(((DataBean)((List)this.databean.getChuchunResult()).get(i)).getPid());//사업자의 아이디.
				this.databean.setMymoney(((DataBean)((List)this.databean.getChuchunResult()).get(i)).getChuchunPoint());//사업자의 포인트값.
				this.sqlSessionTemplate.insert("mm.insertKyunMae",this.databean);
				if(i==23){
					break;
				}
			}
			
			for(int i=0; i<((List)this.databean.getChuchunResult()).size(); i++){//펜션 테이블에서, 
				this.databean.setPid(((DataBean)((List)this.databean.getChuchunResult()).get(i)).getPid());//사업자의 아이디.
				this.databean.setChuchunRank(i+1);
				this.sqlSessionTemplate.update("mm.updatePentionRanking",this.databean);
				if(i==23){
					break;
				}
			}
			this.sqlSessionTemplate.update("mm.updatePentionPoint");
		}
		this.databean.setChuchunResult(this.sqlSessionTemplate.selectList("mm.chuchunPentionGetList"));
		this.databean.setAdminViewPage("adminChuchunView");
		this.databean.setAdmin("chuchun");
	}
	
	
	
	private void adminChuchunView(){
		System.out.println("관리자 추천 펜션 관리 입장.");
		this.databean.setChuchunResult(this.sqlSessionTemplate.selectList("mm.chuchunPentionGetList"));
		
		this.databean.setAdminViewPage("adminChuchunView");
		
		
	}
	
	private void adminMemberView(){
		this.databean.setMemSuchList(null);
	}
	
	// //////////////////////////////////////////////////////
	private void adminTotalMoneyView() {
		System.out.println("관리자 매출관리 입장.");
		this.databean.setMemSuchList(null);
		this.databean.setMemSuchList(this.sqlSessionTemplate.selectList("mm.dunhill", this.databean));
		this.databean.setAdmin("totalmoney");
	}

	// //////////////////////////////////////////////////////
	private void admingiveMoney() {

		String id = this.databean.getUpId();

		Object mem = null;
		mem = (this.sqlSessionTemplate
				.selectOne("mm.milemember", this.databean));// 정산하는놈으 정보를 받아오자

		this.databean.setSaupid(((DataBean) mem).getId());// /입금할 사업자의 아이디

		Integer i = null;

		i = (((Integer) ((DataBean) mem).getPoint() / 100) * 10);// /십프로 금액

		this.databean.setMymoney(i);// 십프로내꺼

		Integer ib = null;

		ib = ((DataBean) mem).getPoint() - i;

		this.databean.setIbgmMoney(ib);// 입금해줄돈입니다

		this.sqlSessionTemplate.insert("mm.insertmoney", this.databean);

		this.sqlSessionTemplate.update("mm.resetmile", this.databean);

		this.databean.setUpId(id);

		this.databean.setMemSuchList(null);

		this.databean.setMemSuchList(this.sqlSessionTemplate.selectList(
				"mm.dunhill", this.databean));
		this.databean.setAdmin("totalmoney");

	}
	
	private void viewMoney() {

		String res = "";
		res = this.databean.getPayYear() + "/";

		if (this.databean.getPayMonth().length() < 2) {

			res += "0" + this.databean.getPayMonth();
		} else {
			res += this.databean.getPayMonth();
		}

		System.out.println(res + "                            res");
		this.databean.setMonthplYear(res);
		this.databean.setMemSuchList(null);
		this.databean.setMemSuchList(this.sqlSessionTemplate.selectList(
				"mm.getpaytable", this.databean));

		this.databean.setChongmyMoney((Integer) this.sqlSessionTemplate
				.selectOne("mm.summoney", this.databean));
		this.databean.setAdmin("totalmoney");

	}
	
	
}
