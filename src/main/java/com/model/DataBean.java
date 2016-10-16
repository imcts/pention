package com.model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Component
@Alias("databean")
@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
public class DataBean implements Serializable{
   //메뉴 구성 및 값들 저장.
   //----------------------------------------------------
      
   private String menu, main="", service, menutype; //얘네는 컨트롤러 상에서 컨버팅.

   private Object topList=null, menuList=null, areaMenuList=null,themaMenuList=null,mypageMenuList=null;

   private String menukey, topkey, topservice;

   private String serviceKey="kangwon",topSerch="",noticekey;
	   
	   
   private String resource="resources/menuimage/";

   
   //유저 정보 저장.
   //----------------------------------------------------
   
   private String id="", password="",password1="", name="", email="", tell="";
	   
   private Integer grade, point, emailNumber=0;
	   
   private String idIndex="0", idCheckIndex="0", passwordIndex="0", 
         tellIndex="0", nameIndex="0", emailIndex="0", emailNumberIndex="0";
	   
   private List<DataBean> userData=null;
	   
   private Object findPassword=null;
	   
   
   
   //게시판 테이블용.
   //----------------------------------------------------
   
	   
   private Integer head=1;

   private Integer ids=0,gid=0,seq=0,ref=0,cnt=0;
	   
   private Date reg_date;
	   
   private String pname="",title="",content="",boardKey="",userid="";
	   
   private String idMsg="",emailMsg="", color="red";
	   
   private List<DataBean> insertboard;
	   
   private Object afterBoard=null;
	   
	   

   //////////////////페이징
   private Integer a_page=1, a_start=0, a_end=0, a_limit=5, a_maxPage=0, a_startPage, a_endPage, a_limitPage=5;
   ////////////////=========================
   
   private Integer noticePage=1 ,qnaPage=1,start=0,freePage=1,afterPage=1,
                  end=0,limit=10,totalPage=0,
                  pageLimit=10,startPage=0,endPage=0,noplus=0;
   
   /////////////////////////////////////////////
   
   //펜션검색용 변수들
   //-----------------------------------------------------
   
   private String areaSerchKey="kangwon", themaSerchKey="skie", thameAreaKey="kangwon";
   
   private String nowyear, nowmonth, nowday, choiceYear="", choiceMonth="", choiceDay="";
   
   private String [] themaChoice=null, optionChoice=null;
   
   private List pentionPhoto=null;
   
   //펜션의 값을 저장하는 녀석들.
   //-----------------------------------------------------
   
   private String pid="", pentionName="", address1="", address2="", ptell, thema=null, themaoption=null, pcontent, mainphoto="", areaphoto=null;
   
   private String roomname="", max="", min="", roomsize="", money="", addmoney="", roomphoto, roomyeyak="예약가능";
   
   private Integer pgrade, chuchun, cgrade, cmoney,chuchunPoint=0, chuchunRank=0, rankindex=1;
   
   private Object areaSerchList=null, themaSerchList=null,roomIndexResult=null;
   
   private Object pentionResult=null,roomResult=null,roomInfo=null,yeyakInfo=null,hwanbulInfo=null,mainPageOne=null,mainPageList=null;
  
   private String mybatiseDate;
   
   private String inwon, areaPhotoGet, themaOptionGet;
   
   private Integer roomChoice,roomindex=1;
   
   private String yeyakInwon="", yeyakTerm="", yeyakMoney="", yeyakDay="",yeyakmin="",yeyakAddMoney="",yeyakid="",yeyakroomname="",yeyakpentionName="",yeyakOverInwon=""; 
  
   private String card="", bank="",yeyakMsg="";
   
   private Integer milige=0,hwanbulMoney=0, hwanbulSusu=0;
   
   private String startday, roomnameCheck="0",hwanbulMsg="",suggestMsg;
  
  
   //----관리자 맴버 검색----------------------
   private Object memSuchList=null,suggestResult=null;

   private Integer chgrade=null;
 	   
   private String suchId=null,upId=null,k=null,titles="삭제된게시물입니다";
   
   
   //디테일 게시판용.
   //-----------------------------------------------------

   private Integer no=1, gno, dref, dseq, dcount, dlimit=10, dpageLimit=10, dPage=1, dtotalPage=0, dstart, dend, dStartPage, dEndPage;
   
   private String duser="", dtitle="", dcontent="";
   
   private Date dtoday;
   
   private Object dBoardResult=null;
   
   
   
   //마이페이지용.
   //-----------------------------------------------------
   
    private String admin="pention",saupja="yeyak",user="yeyak";
   
    private String adminViewPage="adminPentionView",saupjaViewPage="yeyak",userViewPage="yeyak";
   
    private Integer saupjaIndex,serchMsg=0;
   
    private String msgIndex="",saupjaGamangId="";
    
    private Object chuchunResult=null;
     
   

	//////////////커뮤니티 변수들///////////////
	
	 private String fhead="1";
	
	 private Integer fids=0,fgid=0,fseq=0,fref=0,fcnt=0;
	
	
	 private Date freg_date;
	
	 private String fpname="",ftitle="",fcontent="",fuserid="";
	
	 private Object freeboard=null;
	 
	 private List fupfileResult=null;
	
	 private String fupfile="";

	///////////추가//////////////
	 private Integer flimit=10, fpagelimit=10, fpage=1, ftotalpage=0, fend, fstart, fstartpage, fendpage;
	
	////////////커뮤니티 변수들///////////////
	 private String idup="";
	 
	 private Integer moneymile=null;
	   
	 private String saupid="",payday="";
	
	 private Integer ibgmMoney=null,mymoney=null;
	 
	 private Integer chongmyMoney=null;
	 //////////////////////////////////////////////
	 private String payMonth="",payYear="", monthplYear="";
  
	 //컨버팅 필수 
   //-----------------------------------------------------
   
	 
	 

   public void converting(DataBean databean){ 
	  this.rankindex=databean.getRankindex();
	  this.serchMsg=databean.getSerchMsg();
	  this.milige=databean.getMilige();
	  this.roomnameCheck=databean.getRoomnameCheck();
	  this.roomindex=databean.getRoomindex();
	  this.roomsize=databean.getRoomsize();
	  this.roomname=databean.getRoomname();
	  this.max=databean.getMax();
	  this.min=databean.getMin();
	  this.money=databean.getMoney();
	  this.addmoney=databean.getAddmoney();
	  this.no=databean.getNo();
	  this.duser=databean.getDuser();
	  this.dtitle=databean.getDtitle();
	  this.dcontent=databean.getDcontent();
	  this.saupjaGamangId=databean.getSaupjaGamangId();
	  this.msgIndex=databean.getMsgIndex();
	  this.themaChoice=databean.getThemaChoice();
	  this.optionChoice=databean.getOptionChoice();
	  this.pentionPhoto=databean.getPentionPhoto();
	  this.address1=databean.getAddress1();
	  this.address2=databean.getAddress2();
	  this.pentionName=databean.getPentionName();
	 /////////////////////////////////////////////  
      this.serviceKey = databean.getServiceKey();
      this.topSerch = databean.getTopSerch();
      this.boardKey=databean.getBoardKey();
      this.id=databean.getId();
      this.password=databean.getPassword();
      this.password1=databean.getPassword1();
      this.name=databean.getName();
      this.email=databean.getEmail();
      this.tell=databean.getTell();
      this.idMsg=databean.getIdMsg();
      this.emailMsg=databean.getEmailMsg();
      this.color=databean.getColor();
      this.idIndex=databean.getIdIndex();
      this.idCheckIndex=databean.getIdCheckIndex();
      this.passwordIndex=databean.getPasswordIndex();
      this.tellIndex=databean.getTellIndex();
      this.nameIndex=databean.getNameIndex();
      this.emailIndex=databean.getEmailIndex();
      this.emailNumberIndex=databean.getEmailNumberIndex();
      this.ids=databean.getIds();
      this.areaSerchKey=databean.getAreaSerchKey();
      this.themaSerchKey=databean.getThemaSerchKey();
      this.thameAreaKey=databean.getThameAreaKey();
      this.pid=databean.getPid();
      this.admin=databean.getAdmin();
      this.user=databean.getUser();
      this.saupja=databean.getSaupja();
      this.adminViewPage=databean.getAdminViewPage();
      this.userViewPage=databean.getUserViewPage();
      this.saupjaViewPage=databean.getSaupjaViewPage();
      ///////////////////////////////////
      this.title=databean.getTitle();
      this.content=databean.getContent();
      this.gid=databean.getGid();
      this.seq=databean.getSeq();              
      this.ref=databean.getRef();                 
      this.cnt=databean.getCnt();                
      //////////////////                         
      this.yeyakInwon=databean.getYeyakInwon();
      this.yeyakDay=databean.getYeyakDay();
      this.yeyakTerm=databean.getYeyakTerm();
      this.yeyakMoney=databean.getYeyakMoney();
      this.yeyakmin=databean.getYeyakmin();
      this.yeyakAddMoney=databean.getYeyakAddMoney();
      this.yeyakid=databean.getYeyakid();
      this.yeyakroomname=databean.getYeyakroomname();
      this.yeyakpentionName=databean.getYeyakpentionName();

      /////////////////  page=1,start=0,end=0,limit=5,totalPage=0,pageLimit=4,startPage=0,endPage=0;
      this.noticePage=databean.getNoticePage();
      this.qnaPage=databean.getQnaPage();
      this.start=databean.getStart();
      this.end=databean.getEnd();
      this.limit=databean.getLimit();
      this.totalPage=databean.getTotalPage();
      this.pageLimit=databean.getPageLimit();
      this.startPage=databean.getStartPage();
      this.endPage=databean.getEndPage();
      this.noplus=databean.getNoplus();
      this.userid=databean.getUserid();
      this.freePage=databean.getFreePage();
      this.card=databean.getCard();
      this.bank=databean.getBank();
      ///////////커뮤니티 컨버팅///////////// 
      this.fcontent=databean.getFcontent();
      this.fhead=databean.getFhead();     
      this.fpname=databean.getFpname();
      this.ftitle=databean.getFtitle();
      this.fuserid=databean.getFuserid();
      this.fpage=databean.getFpage();
      this.fids=databean.getFids();   
      
      this.fupfileResult=databean.getFupfileResult();
	  ///////////커뮤니티 컨버팅/////////////
	  
	  this.idup=databean.getIdup();


	  // //////////////////////////////////////////
	  this.chgrade = databean.getChgrade();
	  this.suchId = databean.getSuchId();
	  this.upId = databean.getUpId();
	  // ////////////////////////////////////////
	  
	  /*
	   */
	  this.payYear = databean.getPayYear();
	  this.payMonth = databean.getPayMonth();
	  // //////////////////////////////////////////////
	  this.chongmyMoney = databean.getChongmyMoney();

	 
   }
   
   
   //getter , setter 정리.
   //-----------------------------------------------------


   public List getUpfileList(){
     		ArrayList list = new ArrayList();
     		String [] arr = this.fupfile.split(",");
     		for(int i =0; i<arr.length;i++){
     			if(!arr[i].equals("")){
     				list.add(arr[i]);
     			}
     		}
     		
     		return list;
     	}
     	

  	
  	public Object getMainPageOne() {
	return mainPageOne;
}


public void setMainPageOne(Object mainPageOne) {
	this.mainPageOne = mainPageOne;
}


public Object getMainPageList() {
	return mainPageList;
}


public void setMainPageList(Object mainPageList) {
	this.mainPageList = mainPageList;
}


	public Integer getRankindex() {
	return rankindex;
}


public void setRankindex(Integer rankindex) {
	this.rankindex = rankindex;
}


	public List getFupfileResult() {
  		return fupfileResult;
  	}


  	public void setFupfileResult(List fupfileResult) {
  		this.fupfileResult = fupfileResult;
  	}


  	public String getFupfile() {
  		return fupfile;
  	}


  	public void setFupfile(String fupfile) {
  		this.fupfile = fupfile;
  	}
  	  
   
	public String getPayMonth() {
		return payMonth;
	}

	public String getSuggestMsg() {
		return suggestMsg;
	}


	public void setSuggestMsg(String suggestMsg) {
		this.suggestMsg = suggestMsg;
	}


	public Object getSuggestResult() {
		return suggestResult;
	}


	public void setSuggestResult(Object suggestResult) {
		this.suggestResult = suggestResult;
	}


	public Integer getChuchunRank() {
		return chuchunRank;
	}


	public void setChuchunRank(Integer chuchunRank) {
		this.chuchunRank = chuchunRank;
	}


	public void setPayMonth(String payMonth) {
		this.payMonth = payMonth;
	}

	public String getPayYear() {
		return payYear;
	}

	public void setPayYear(String payYear) {
		this.payYear = payYear;
	}

	public String getMonthplYear() {
		return monthplYear;
	}

	public void setMonthplYear(String monthplYear) {
		this.monthplYear = monthplYear;
	}

	public Integer getChongmyMoney() {
		return chongmyMoney;
	}

	public void setChongmyMoney(Integer chongmyMoney) {
		this.chongmyMoney = chongmyMoney;
	}

	public String ibglmoneyformat() {
		DecimalFormat df = new DecimalFormat("#,##0");

		String res = df.format(this.ibgmMoney);

		return res;
	}

	public String mymoneyformat() {
		DecimalFormat df = new DecimalFormat("#,##0");

		String res = df.format(this.mymoney);

		return res;
	}

	public String summoney() {
		DecimalFormat df = new DecimalFormat("#,##0");

		String res = df.format(this.mymoney + this.ibgmMoney);

		return res;
	}

	public String summymoney() {
		if (this.chongmyMoney == null || this.chongmyMoney.equals("null")) {
			return "";
		} else {
			DecimalFormat df = new DecimalFormat("#,##0");

			return df.format(this.chongmyMoney);
		}

	}
   
   
   public String getchuchunPointFormat(){
		String res="";
		
		DecimalFormat df = new DecimalFormat("#,##0");
		
		res=df.format(this.chuchunPoint);
		
		return res;
		
	}
   
	public String getIdup() {
		return idup;
	}

	public Integer getChuchunPoint() {
		return chuchunPoint;
	}


	public void setChuchunPoint(Integer chuchunPoint) {
		this.chuchunPoint = chuchunPoint;
	}


	public Object getChuchunResult() {
		return chuchunResult;
	}


	public void setChuchunResult(Object chuchunResult) {
		this.chuchunResult = chuchunResult;
	}


	public Integer getSerchMsg() {
		return serchMsg;
	}


	public void setSerchMsg(Integer serchMsg) {
		this.serchMsg = serchMsg;
	}


	public void setIdup(String idup) {
		this.idup = idup;
	}


	public Integer getMoneymile() {
		return moneymile;
	}


	public void setMoneymile(Integer moneymile) {
		this.moneymile = moneymile;
	}


	public String getSaupid() {
		return saupid;
	}


	public void setSaupid(String saupid) {
		this.saupid = saupid;
	}

	public String getPayDayFormat(){
		String res="";
	
		String[] arr = this.payday.split("/");

		res += "20" + arr[0] + "-" + arr[1] + "-" + arr[2];
		
		return res;
	}
	
	
	public String getPayday() {
		return payday;
	}


	public void setPayday(String payday) {
		this.payday = payday;
	}


	public Integer getMymoney() {
		return mymoney;
	}


	public void setMymoney(Integer mymoney) {
		this.mymoney = mymoney;
	}


	public Integer getIbgmMoney() {
		return ibgmMoney;
	}


	public void setIbgmMoney(Integer ibgmMoney) {
		this.ibgmMoney = ibgmMoney;
	}

   
	public String getStartdayFormat() {
		String res = "";
		String[] arr = this.startday.split("/");

		res += "20" + arr[0] + "-" + arr[1] + "-" + arr[2];

		return res;
	}

	public String getHwanbulMoneyFormat(){
		String res="";
		
		DecimalFormat df = new DecimalFormat("#,##0");
		
		res=df.format(this.hwanbulMoney);
		
		return res;
		
	}
	
	public Integer getHwanbulMoney() {
		return hwanbulMoney;
	}

	public void setHwanbulMoney(Integer hwanbulMoney) {
		this.hwanbulMoney = hwanbulMoney;
	}

	public Integer getHwanbulSusu() {
		return hwanbulSusu;
	}

	public void setHwanbulSusu(Integer hwanbulSusu) {
		this.hwanbulSusu = hwanbulSusu;
	}

	public Object getMemSuchList() {
		return memSuchList;
	}

	public String getHwanbulMsg() {
		return hwanbulMsg;
	}

	public void setHwanbulMsg(String hwanbulMsg) {
		this.hwanbulMsg = hwanbulMsg;
	}

	public void setMemSuchList(Object memSuchList) {
		this.memSuchList = memSuchList;
	}

	public Integer getChgrade() {
		return chgrade;
	}

	public void setChgrade(Integer chgrade) {
		this.chgrade = chgrade;
	}

	// =============================================
	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}

	public String getSuchId() {
		return suchId;
	}

	public void setSuchId(String suchId) {
		this.suchId = suchId;
	}

	public String getUpId() {
		return upId;
	}

	public void setUpId(String upId) {
		this.upId = upId;
	}

	public String getK() {
		return k;
	}

	public void setK(String k) {
		this.k = k;
	}

	// ////////////////////////////////////////////////////////////////////////
	public String getPointformat() {
		DecimalFormat df = new DecimalFormat("#,##0");

		String res = df.format(this.point);

		return res;
	}

	// ////////////////////////////////////////////////////////////////////////

	public String getYeyakMsg() {
		return yeyakMsg;
	}

	public void setYeyakMsg(String yeyakMsg) {
		this.yeyakMsg = yeyakMsg;
	}

	public Object getHwanbulInfo() {
		return hwanbulInfo;
	}

	public void setHwanbulInfo(Object hwanbulInfo) {
		this.hwanbulInfo = hwanbulInfo;
	}

	public Object getRoomIndexResult() {
		return roomIndexResult;
	}

	public void setRoomIndexResult(Object roomIndexResult) {
		this.roomIndexResult = roomIndexResult;
	}

	public String getRoomnameCheck() {
		return roomnameCheck;
	}

	public void setRoomnameCheck(String roomnameCheck) {
		this.roomnameCheck = roomnameCheck;
	}

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public Integer getFlimit() {
		return flimit;
	}

	public void setFlimit(Integer flimit) {
		this.flimit = flimit;
	}

	public Integer getFpagelimit() {
		return fpagelimit;
	}

	public void setFpagelimit(Integer fpagelimit) {
		this.fpagelimit = fpagelimit;
	}

	public Integer getFpage() {
		return fpage;
	}

	public void setFpage(Integer fpage) {
		this.fpage = fpage;
	}

	public Integer getFtotalpage() {
		return ftotalpage;
	}

	public void setFtotalpage(Integer ftotalpage) {
		this.ftotalpage = ftotalpage;
	}

	public Integer getFend() {
		return fend;
	}

	public void setFend(Integer fend) {
		this.fend = fend;
	}

	public Integer getFstart() {
		return fstart;
	}

	public void setFstart(Integer fstart) {
		this.fstart = fstart;
	}

	public Integer getFstartpage() {
		return fstartpage;
	}

	public void setFstartpage(Integer fstartpage) {
		this.fstartpage = fstartpage;
	}

	public Integer getFendpage() {
		return fendpage;
	}

	public void setFendpage(Integer fendpage) {
		this.fendpage = fendpage;
	}

	public String getThemaOptionGet() {
		return themaOptionGet;
	}

	public void setThemaOptionGet(String themaOptionGet) {
		this.themaOptionGet = themaOptionGet;
	}

	public String getAreaPhotoGet() {
		return areaPhotoGet;
	}

	public void setAreaPhotoGet(String areaPhotoGet) {
		this.areaPhotoGet = areaPhotoGet;
	}

	public List getPentionPhoto() {
		return pentionPhoto;
	}

	public void setPentionPhoto(List pentionPhoto) {
		this.pentionPhoto = pentionPhoto;
	}

	public String[] getThemaChoice() {
		return themaChoice;
	}

	public void setThemaChoice(String[] themaChoice) {
		this.themaChoice = themaChoice;
	}

	public String[] getOptionChoice() {
		return optionChoice;
	}

	public void setOptionChoice(String[] optionChoice) {
		this.optionChoice = optionChoice;
	}

	public Integer getA_page() {
		return a_page;
	}

	public void setA_page(Integer a_page) {
		this.a_page = a_page;
	}

	public Integer getA_start() {
		return a_start;
	}

	public void setA_start(Integer a_start) {
		this.a_start = a_start;
	}

	public Integer getA_end() {
		return a_end;
	}

	public void setA_end(Integer a_end) {
		this.a_end = a_end;
	}

	public Integer getA_limit() {
		return a_limit;
	}

	public void setA_limit(Integer a_limit) {
		this.a_limit = a_limit;
	}

	public Integer getA_maxPage() {
		return a_maxPage;
	}

	public void setA_maxPage(Integer a_maxPage) {
		int max = a_maxPage / this.a_limit;

		if (a_maxPage % this.a_limit > 0) {
			max++;
		}

		this.a_maxPage = max;

	}

	public Integer getA_startPage() {
		return a_startPage;
	}

	public void setA_startPage(Integer a_startPage) {
		this.a_startPage = a_startPage;
	}

	public Integer getA_endPage() {
		return a_endPage;
	}

	public void setA_endPage(Integer a_endPage) {
		this.a_endPage = a_endPage;
	}

	public Integer getA_limitPage() {
		return a_limitPage;
	}

	public void setA_limitPage(Integer a_limitPage) {
		this.a_limitPage = a_limitPage;
	}

	public String getSaupjaGamangId() {
		return saupjaGamangId;
	}

	public void setSaupjaGamangId(String saupjaGamangId) {
		this.saupjaGamangId = saupjaGamangId;
	}

	public String getMsgIndex() {
		return msgIndex;
	}

	public void setMsgIndex(String msgIndex) {
		this.msgIndex = msgIndex;
	}

	public Integer getSaupjaIndex() {
		return saupjaIndex;
	}

	public void setSaupjaIndex(Integer saupjaIndex) {
		this.saupjaIndex = saupjaIndex;
	}

	public Integer getAfterPage() {
		return afterPage;
	}

	public void setAfterPage(Integer afterPage) {
		this.afterPage = afterPage;
	}

	public Object getFreeboard() {
		return freeboard;
	}

	public void setFreeboard(Object freeboard) {
		this.freeboard = freeboard;
	}

	public Integer getDlimit() {
		return dlimit;
	}

	public void setDlimit(Integer dlimit) {
		this.dlimit = dlimit;
	}

	public Integer getDpageLimit() {
		return dpageLimit;
	}

	public void setDpageLimit(Integer dpageLimit) {
		this.dpageLimit = dpageLimit;
	}

	public Integer getdPage() {
		return dPage;
	}

	public void setdPage(Integer dPage) {
		this.dPage = dPage;
	}

	public Integer getDtotalPage() {
		return dtotalPage;
	}

	public void setDtotalPage(Integer dtotalPage) {

		int total = dtotalPage / this.dlimit;

		if (dtotalPage % this.dlimit > 0) {
			total++;
		}

		this.dtotalPage = total;
	}

	public Integer getDstart() {
		return dstart;
	}

	public void setDstart(Integer dstart) {
		this.dstart = dstart;
	}

	public Integer getDend() {
		return dend;
	}

	public void setDend(Integer dend) {
		this.dend = dend;
	}

	public Integer getdStartPage() {
		return dStartPage;
	}

	public void setdStartPage(Integer dStartPage) {
		this.dStartPage = dStartPage;
	}

	public Integer getdEndPage() {
		return dEndPage;
	}

	public void setdEndPage(Integer dEndPage) {
		this.dEndPage = dEndPage;
	}

	public Object getdBoardResult() {
		return dBoardResult;
	}

	public void setdBoardResult(Object dBoardResult) {
		this.dBoardResult = dBoardResult;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getGno() {
		return gno;
	}

	public void setGno(Integer gno) {
		this.gno = gno;
	}

	public Integer getDref() {
		return dref;
	}

	public void setDref(Integer dref) {
		this.dref = dref;
	}

	public Integer getDseq() {
		return dseq;
	}

	public void setDseq(Integer dseq) {
		this.dseq = dseq;
	}

	public Integer getDcount() {
		return dcount;
	}

	public void setDcount(Integer dcount) {
		this.dcount = dcount;
	}

	public String getDuser() {
		return duser;
	}

	public void setDuser(String duser) {
		this.duser = duser;
	}

	public String getDtitle() {
		return dtitle;
	}

	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public String getDtoday() {

		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");

		return sdf.format(this.dtoday);
	}

	public void setDtoday(Date dtoday) {
		this.dtoday = dtoday;
	}

	public String getFhead() {
		return fhead;
	}

	public void setFhead(String fhead) {
		this.fhead = fhead;
	}

	public Integer getFids() {
		return fids;
	}

	public void setFids(Integer fids) {
		this.fids = fids;
	}

	public Integer getFgid() {
		return fgid;
	}

	public void setFgid(Integer fgid) {
		this.fgid = fgid;
	}

	public Integer getFseq() {
		return fseq;
	}

	public void setFseq(Integer fseq) {
		this.fseq = fseq;
	}

	public Integer getFref() {
		return fref;
	}

	public void setFref(Integer fref) {
		this.fref = fref;
	}

	public Integer getFcnt() {
		return fcnt;
	}

	public void setFcnt(Integer fcnt) {
		this.fcnt = fcnt;
	}

	public String getFreg_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		return sdf.format(this.freg_date);
	}

	public void setFreg_date(Date freg_date) {
		this.freg_date = freg_date;
	}

	public String getFpname() {
		return fpname;
	}

	public void setFpname(String fpname) {
		this.fpname = fpname;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getFcontent() {
		return fcontent;
	}

	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}

	public String getFuserid() {
		return fuserid;
	}

	public void setFuserid(String fuserid) {
		this.fuserid = fuserid;
	}

	public Integer getRoomindex() {
		return roomindex;
	}

	public void setRoomindex(Integer roomindex) {
		this.roomindex = roomindex;
	}

	public Integer getMilige() {
		return milige;
	}

	public void setMilige(Integer milige) {
		this.milige = milige;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public Integer getNoplus() {
		return noplus;
	}

	public Integer getFreePage() {
		return freePage;
	}

	public void setFreePage(Integer freePage) {
		this.freePage = freePage;
	}

	public Integer getNoticePage() {
		return noticePage;
	}

	public void setNoticePage(Integer noticePage) {
		this.noticePage = noticePage;
	}

	public Integer getQnaPage() {
		return qnaPage;
	}

	public void setQnaPage(Integer qnaPage) {
		this.qnaPage = qnaPage;
	}

	public void setNoplus(Integer noplus) {
		this.noplus = noplus;
	}

	public Integer getStart() {
		if (this.serviceKey.equals("qna")) {
			this.start = ((this.getQnaPage() - 1) * this.getLimit() + 1);
		} else if (this.serviceKey.equals("noticeboard")) {
			this.start = ((this.getNoticePage() - 1) * this.getLimit() + 1);
		}

		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {

		if (this.serviceKey.equals("qna")) {
			this.end = this.getQnaPage() * this.getLimit();
		} else if (this.serviceKey.equals("noticeboard")) {
			this.end = this.getNoticePage() * this.getLimit();
		}

		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(Integer pageLimit) {
		this.pageLimit = pageLimit;
	}

	public Integer getStartPage() {
		return startPage;
	}

	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	// //////////////// 9월 23일 ////////////////////////////////////////
	public String getStartDayFormat() {
		String res = "";
		String[] arr = this.startday.split("/");

		res += "20" + arr[0] + "-";

		if (arr[1].length() < 2) {
			res += "0" + arr[1] + "-";
		} else {
			res += arr[1] + "-";
		}

		if (arr[2].length() < 2) {
			res += "0" + arr[2];
		} else {
			res += arr[2];
		}

		return res;
	}

	public String getYeyakTotalMoney() {
		DecimalFormat df = new DecimalFormat("#,##0");

		String res = df.format(Double.parseDouble(this.yeyakMoney));
		return res;
	}

	public String getMoneyMy() {
		DecimalFormat df = new DecimalFormat("#,##0");
		String res = df.format(Double.parseDouble(this.money));
		return res;
	}

	public String getaddMoneyMy() {
		DecimalFormat df = new DecimalFormat("#,##0");
		String res = df.format(Double.parseDouble(this.addmoney));
		return res;
	}

	public String getYeyakDay() {
		return this.yeyakDay;
	}

	public String getYeyakOverInwon() {
		return yeyakOverInwon;
	}

	public void setYeyakOverInwon(String yeyakOverInwon) {
		this.yeyakOverInwon = yeyakOverInwon;
	}

	public String getYeyakpentionName() {
		return yeyakpentionName;
	}

	public void setYeyakpentionName(String yeyakpentionName) {
		this.yeyakpentionName = yeyakpentionName;
	}

	public String getYeyakroomname() {
		return yeyakroomname;
	}

	public void setYeyakroomname(String yeyakroomname) {
		this.yeyakroomname = yeyakroomname;
	}

	public String getYeyakid() {
		return yeyakid;
	}

	public void setYeyakid(String yeyakid) {
		this.yeyakid = yeyakid;
	}

	public String getYeyakAddMoney() {
		return yeyakAddMoney;
	}

	public void setYeyakAddMoney(String yeyakAddMoney) {
		this.yeyakAddMoney = yeyakAddMoney;
	}

	public String getYeyakInwon() {
		return yeyakInwon;
	}

	public void setYeyakInwon(String yeyakInwon) {
		this.yeyakInwon = yeyakInwon;
	}

	public String getYeyakTerm() {
		return yeyakTerm;
	}

	public void setYeyakTerm(String yeyakTerm) {
		this.yeyakTerm = yeyakTerm;
	}

	public String getYeyakMoney() {
		return yeyakMoney;
	}

	public void setYeyakMoney(String yeyakMoney) {
		this.yeyakMoney = yeyakMoney;
	}

	public String getYeyakmin() {
		return yeyakmin;
	}

	public void setYeyakmin(String yeyakmin) {
		this.yeyakmin = yeyakmin;
	}

	public void setYeyakDay(String yeyakDay) {
		this.yeyakDay = yeyakDay;
	}

	public String getFirstRoomPhoto() {

		String[] arr = ((DataBean) this.roomResult).getRoomphoto().split(",");

		return arr[0];
	}

	public Object getAllRoomPhoto() {
		ArrayList<String> list = new ArrayList();
		if (((DataBean) this.roomResult).getRoomphoto() != null) {
			String[] arr = ((DataBean) this.roomResult).getRoomphoto().split(
					",");
			for (int i = 0; i < arr.length; i++) {
				if (!arr[i].equals("")) {
					list.add(arr[i]);
				}
			}
		}

		return list;
	}

	// ///////////////////////////////////////////////////////

	public String getAreaSerchKey() {
		return areaSerchKey;
	}

	public Integer getRoomChoice() {
		return roomChoice;
	}

	public void setRoomChoice(Integer roomChoice) {
		this.roomChoice = roomChoice;
	}

	public Object getYeyakInfo() {
		return yeyakInfo;
	}

	public void setYeyakInfo(Object yeyakInfo) {
		this.yeyakInfo = yeyakInfo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getInwon() {
		return inwon;
	}

	public void setInwon(String inwon) {
		this.inwon = inwon;
	}

	public String getMybatiseDate() {
		return this.mybatiseDate;
	}

	public void setMybatiseDate(String cyear, String cmonth, String cday) {
		String res = "";
		res = cyear.substring(2) + "/";

		if (cmonth.length() < 2) {
			res += "0" + cmonth + "/";
		} else {
			res += cmonth + "/";
		}

		if (cday.length() < 2) {
			res += "0" + cday;
		} else {
			res += cday;
		}
		this.mybatiseDate = res;
	}

	public Integer getNowday() {
		Calendar car = Calendar.getInstance();
		return car.get(Calendar.DATE);
	}

	public void setNowday(String nowday) {
		this.nowday = nowday;
	}

	public String getChoiceYear() {
		return choiceYear;
	}

	public void setChoiceYear(String choiceYear) {
		this.choiceYear = choiceYear;
	}

	public String getChoiceMonth() {
		return choiceMonth;
	}

	public void setChoiceMonth(String choiceMonth) {
		this.choiceMonth = choiceMonth;
	}

	public String getChoiceDay() {
		return choiceDay;
	}

	public void setChoiceDay(String choiceDay) {
		this.choiceDay = choiceDay;
	}

	public Integer getHead() {
		return head;
	}

	public void setHead(Integer head) {
		this.head = head;
	}

	public Object getAfterBoard() {
		return afterBoard;
	}

	public void setAfterBoard(Object afterBoard) {
		this.afterBoard = afterBoard;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getMax() {
		return max;
	}

	public void setMax(String max) {
		this.max = max;
	}

	public String getMin() {
		return min;
	}

	public void setMin(String min) {
		this.min = min;
	}

	public String getRoomsize() {
		return roomsize;
	}

	public void setRoomsize(String roomsize) {
		this.roomsize = roomsize;
	}

	public String getMoney() {

		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String yeyakAllRoomMoney() {

		DecimalFormat df = new DecimalFormat("#,##0");

		String res = df.format(Double.parseDouble(this.money));

		return res;
	}

	public String yeyakDetailAddMoney() {

		DecimalFormat df = new DecimalFormat("#,##0");

		String res = df.format(Double.parseDouble(this.addmoney));

		return res;
	}

	public String getAddmoney() {
		return this.addmoney;
	}

	public void setAddmoney(String addmoney) {
		this.addmoney = addmoney;
	}

	public String getRoomphoto() {
		return roomphoto;
	}

	public void setRoomphoto(String roomphoto) {
		this.roomphoto = roomphoto;
	}

	public Object getRoomInfo() {
		return roomInfo;
	}

	public void setRoomInfo(Object roomInfo) {
		this.roomInfo = roomInfo;
	}

	public Integer getNowyear() {
		Calendar car = Calendar.getInstance();

		return car.get(Calendar.YEAR);
	}

	public void setNowyear(String nowyear) {
		this.nowyear = nowyear;
	}

	public Integer getNowmonth() {
		Calendar car = Calendar.getInstance();

		return car.get(Calendar.MONTH) + 1;
	}

	public void setNowmonth(String nowmonth) {
		this.nowmonth = nowmonth;
	}

	public Object getPentionResult() {
		return pentionResult;
	}

	public void setPentionResult(Object pentionResult) {
		this.pentionResult = pentionResult;
	}

	public Object getRoomResult() {
		return roomResult;
	}

	public void setRoomResult(Object roomResult) {
		this.roomResult = roomResult;
	}

	public String getAdminViewPage() {
		return adminViewPage;
	}

	public void setAdminViewPage(String adminViewPage) {
		this.adminViewPage = adminViewPage;
	}

	public String getSaupjaViewPage() {
		return saupjaViewPage;
	}

	public void setSaupjaViewPage(String saupjaViewPage) {
		this.saupjaViewPage = saupjaViewPage;
	}

	public String getUserViewPage() {
		return userViewPage;
	}

	public void setUserViewPage(String userViewPage) {
		this.userViewPage = userViewPage;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getSaupja() {
		return saupja;
	}

	public void setSaupja(String saupja) {
		this.saupja = saupja;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Object getMypageMenuList() {
		return mypageMenuList;
	}

	public void setMypageMenuList(Object mypageMenuList) {
		this.mypageMenuList = mypageMenuList;
	}

	public Object getThemaSerchList() {
		return themaSerchList;
	}

	public void setThemaSerchList(Object themaSerchList) {
		this.themaSerchList = themaSerchList;
	}

	public Object getAreaSerchList() {
		return areaSerchList;
	}

	public void setAreaSerchList(Object areaSerchList) {
		this.areaSerchList = areaSerchList;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPentionName() {
		return pentionName;
	}

	public void setPentionName(String pentionName) {
		this.pentionName = pentionName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPtell() {
		return ptell;
	}

	public void setPtell(String ptell) {
		this.ptell = ptell;
	}

	public String getThema() {
		return thema;
	}

	public void setThema(String thema) {
		this.thema = thema;
	}

	public List<String> getThemaoption() {
		ArrayList<String> list = new ArrayList();
		if (this.themaoption != null) {
			String[] arr = this.themaoption.split(",");

			for (int i = 0; i < arr.length; i++) {
				if (!arr[i].equals("")) {
					list.add(arr[i]);
				}
			}
		}

		return list;
	}

	public String getThemaOptionTag() {

		return this.themaoption;
	}

	public String getRoomyeyak() {
		return roomyeyak;
	}

	public void setRoomyeyak(String roomyeyak) {
		this.roomyeyak = roomyeyak;
	}

	public void setThemaoption(String themaoption) {
		this.themaoption = themaoption;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getMainphoto() {
		return mainphoto;
	}

	public void setMainphoto(String mainphoto) {
		this.mainphoto = mainphoto;
	}

	public Object getAreaphoto() {
		ArrayList<String> list = new ArrayList();
		if (this.areaphoto != null) {
			String[] arr = this.areaphoto.split(",");

			for (int i = 0; i < arr.length; i++) {
				if (!arr[i].equals("")) {
					list.add(arr[i]);
				}
			}
		}
		return list;
	}

	public String getAreaPhotos() {

		return this.areaphoto;
	}

	public void setAreaphoto(String areaphoto) {
		this.areaphoto = areaphoto;
	}

	public Integer getPgrade() {
		return pgrade;
	}

	public void setPgrade(Integer pgrade) {
		this.pgrade = pgrade;
	}

	public Integer getChuchun() {
		return chuchun;
	}

	public void setChuchun(Integer chuchun) {
		this.chuchun = chuchun;
	}

	public Integer getCgrade() {
		return cgrade;
	}

	public void setCgrade(Integer cgrade) {
		this.cgrade = cgrade;
	}

	public Integer getCmoney() {
		return cmoney;
	}

	public void setCmoney(Integer cmoney) {
		this.cmoney = cmoney;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public String getThameAreaKey() {
		return thameAreaKey;
	}

	public void setThameAreaKey(String thameAreaKey) {
		this.thameAreaKey = thameAreaKey;
	}

	public Object getThemaMenuList() {
		return themaMenuList;
	}

	public void setThemaMenuList(Object themaMenuList) {
		this.themaMenuList = themaMenuList;
	}

	public String getThemaSerchKey() {
		return themaSerchKey;
	}

	public void setThemaSerchKey(String themaSerchKey) {
		this.themaSerchKey = themaSerchKey;
	}

	public void setAreaSerchKey(String areaSerchKey) {
		this.areaSerchKey = areaSerchKey;
	}

	public String getIdMsg() {
		return idMsg;
	}

	public Object getFindPassword() {
		return findPassword;
	}

	public void setFindPassword(Object findPassword) {
		this.findPassword = findPassword;
	}

	public List<DataBean> getUserData() {
		return userData;
	}

	public void setUserData(List<DataBean> userData) {
		this.userData = userData;
	}

	public String getIdIndex() {
		return idIndex;
	}

	public void setIdIndex(String idIndex) {
		this.idIndex = idIndex;
	}

	public String getIdCheckIndex() {
		return idCheckIndex;
	}

	public void setIdCheckIndex(String idCheckIndex) {
		this.idCheckIndex = idCheckIndex;
	}

	public String getPasswordIndex() {
		return passwordIndex;
	}

	public void setPasswordIndex(String passwordIndex) {
		this.passwordIndex = passwordIndex;
	}

	public String getTellIndex() {
		return tellIndex;
	}

	public void setTellIndex(String tellIndex) {
		this.tellIndex = tellIndex;
	}

	public String getNameIndex() {
		return nameIndex;
	}

	public void setNameIndex(String nameIndex) {
		this.nameIndex = nameIndex;
	}

	public String getEmailIndex() {
		return emailIndex;
	}

	public void setEmailIndex(String emailIndex) {
		this.emailIndex = emailIndex;
	}

	public String getEmailNumberIndex() {
		return emailNumberIndex;
	}

	public void setEmailNumberIndex(String emailNumberIndex) {
		this.emailNumberIndex = emailNumberIndex;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setIdMsg(String idMsg) {
		this.idMsg = idMsg;
	}

	public String getEmailMsg() {
		return emailMsg;
	}

	public void setEmailMsg(String emailMsg) {
		this.emailMsg = emailMsg;
	}

	public Integer getEmailNumber() {
		return emailNumber;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getResource() {
		return resource;
	}

	public void setEmailNumber(Integer emailNumber) {
		this.emailNumber = emailNumber;
	}

	public String getMenutype() {
		return menutype;
	}

	public void setMenutype(String menutype) {
		this.menutype = menutype;
	}

	public String getBoardKey() {
		return boardKey;
	}

	public void setBoardKey(String boardKey) {
		this.boardKey = boardKey;
	}

	public String getMenuType() {
		return menutype;
	}

	public void setMenuType(String menuType) {
		this.menutype = menuType;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public List<DataBean> getInsertboard() {
		return insertboard;
	}

	public void setInsertboard(List<DataBean> insertboard) {
		this.insertboard = insertboard;
	}

	public Integer getIds() {
		return ids;
	}

	public void setIds(Integer ids) {
		this.ids = ids;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getRef() {
		return ref;
	}

	public void setRef(Integer ref) {
		this.ref = ref;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public String getNoticekey() {
		if (this.serviceKey.equals("info")
				|| this.serviceKey.equals("question")
				|| this.serviceKey.equals("qna")
				|| this.serviceKey.equals("noticeboard")) {
			this.noticekey = this.serviceKey;
		} else {
			this.noticekey = "info";
		}

		if (this.boardKey.equals("noticeboard") || this.boardKey.equals("qna")) {
			this.noticekey = "detail";

		} else if (this.boardKey.equals("noticeWrite")) {

			this.noticekey = "write";

		} else if (this.boardKey.equals("comWrite")) {
			this.noticekey = "comwrite";

		} else if (this.boardKey.equals("reply")) {
			this.noticekey = "reply";
		} else if (this.boardKey.equals("replycom")) {
			this.noticekey = "replycom";

		} else if (this.boardKey.equals("modify")) {
			this.noticekey = "modify";
		} else if (this.boardKey.equals("noticeModifyWrite")) {
			this.noticekey = "noticeModifyWrite";
		} else if (this.boardKey.equals("noticedelete")) {
			this.noticekey = "noticedelete";
		}

		return noticekey;
	}

	public void setNoticekey(String noticekey) {
		this.noticekey = noticekey;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMenukey() {
		return menukey;
	}

	public void setMenukey(String menukey) {
		this.menukey = menukey;
	}

	public String getTopkey() {
		return topkey;
	}

	public void setTopkey(String topkey) {
		this.topkey = topkey;
	}

	public String getTopservice() {
		return topservice;
	}

	public void setTopservice(String topservice) {
		this.topservice = topservice;
	}

	public String getTopSerch() {
		if (this.topSerch.equals("") || this.topSerch.equals("펜션 / 지역만 검색됩니다.")) {
			this.topSerch = "allSerch";
		}

		return topSerch;
	}

	public void setTopSerch(String topSerch) {
		this.topSerch = topSerch;
	}

	public Object getAreaMenuList() {
		return areaMenuList;
	}

	public void setAreaMenuList(Object areaMenuList) {
		this.areaMenuList = areaMenuList;
	}

	public String getServiceKey() {
		return serviceKey;
	}

	public void setServiceKey(String serviceKey) {
		this.serviceKey = serviceKey;
	}

	public String getService() {

		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public Object getTopList() {
		return topList;
	}

	public void setTopList(Object topList) {
		this.topList = topList;
	}

	public Object getMenuList() {
		return menuList;
	}

	public void setMenuList(Object menuList) {
		this.menuList = menuList;
	}

}