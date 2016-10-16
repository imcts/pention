Diary = function() {
	this.nowyear;
	this.nowmonth;
	this.pid;
}


Diary.prototype={
	diary : function(pid,year,month){
	
		
		 if(month>12){
        	 this.nowyear=year+1;
        	 this.nowmonth=1;
         }
         else if(month<1){
        	 this.nowyear=year-1;
        	 this.nowmonth=12;
         }	
         else{
        	 this.nowyear=year;
        	 this.nowmonth=month;
         }
		
		
		this.pid=pid;
		
		
		var today = new Date();
		var firstday = new Date();
		var lastday = new Date();
		
		
		firstday.setFullYear(this.nowyear, this.nowmonth-1, 1);
		lastday.setFullYear(this.nowyear, this.nowmonth, 0);
		
		
		var res="<table border='0' width='100%' align='center'>";
		
	
		
		//달력 상단부 
		res+="<tr><td><a href=\"javascript:diary.diary('"+this.pid+"',diary.nowyear,diary.nowmonth-1)\"><img border='0' src='../../../resources/menuimage/diary/left.png'></a></td>";
		res+="<td colspan='2'><img src='../../../resources/menuimage/diary/"+this.nowmonth+"m.png'></td>";
		res+="<td colspan='3'><img src='../../../resources/menuimage/diary/"+this.nowyear+"ct.png'></td>";
		res+="<td><a href=\"javascript:diary.diary('"+this.pid+"',diary.nowyear,diary.nowmonth+1)\"><img border='0' src='../../../resources/menuimage/diary/right.png'></a></td></tr>";
		
		res+="<tr>" +
				"<td align='center'><img src='../../../resources/menuimage/diary/sun.png'></td>" +
				"<td align='center'><img src='../../../resources/menuimage/diary/mon.png'></td>" +
				"<td align='center'><img src='../../../resources/menuimage/diary/tu.png'></td>" +
				"<td align='center'><img src='../../../resources/menuimage/diary/wen.png'></td>" +
				"<td align='center'><img src='../../../resources/menuimage/diary/th.png'></td>" +
				"<td align='center'><img src='../../../resources/menuimage/diary/fri.png'></td>" +
				"<td align='center'><img src='../../../resources/menuimage/diary/sat.png'></td>" +
				"</tr>";
		res+="<tr>";
		
		
		for(var i=0; i<firstday.getDay(); i++){
				res+="<td align='center'><img src='../../../resources/menuimage/diary/block.png'></td>";
		}
		
		for(var i=1; i<lastday.getDate()+1; i++){
			firstday.setDate(i);
			//달력의 날자를 클릭 했을시에는, 방의 리스트를 다시 불러와야 하는데, pid와 년도 날자 function allRoomload(pid,year,month,day)가 넘어간다. 
			//그러면 이녀석을 실행하면 아이작스 타고 넘어가겠지. 그러면 이제 달력 눌렀을때 아이작스 컨트롤러로 가지면 성공이고 아이작스 컨트롤러단에서는 해당 방의 정보를 계속 
			//업데이트 해주어야 한다. 일단 년도를 기준으로 ! 선택된 년도의 방의 이름을 다 조회해야하네
			//그리고 만약에 있다면 방의 예약 상태값을 변경. 
		
			if(firstday.getTime() < today.getTime()){
				res+="<td align='center'><img src='../../../resources/menuimage/diary/"+i+".png'></td>";
			}else{
				if(firstday.getTime() == today.getTime() && today.getMonth() == firstday.getMonth()){					
					res+="<td align='center'><a href='javascript:;' onclick=\"allRoomload('"+this.pid+"',"+this.nowyear+","+this.nowmonth+","+i+")\"><img border='0' src='../../../resources/menuimage/diary/"+i+"c.png'></a></td>";
				}
				else{
					res+="<td align='center'><a href='javascript:;' onclick=\"allRoomload('"+this.pid+"',"+this.nowyear+","+this.nowmonth+","+i+")\"><img border='0' src='../../../resources/menuimage/diary/"+i+".png'></a></td>";
				}
			}
			
			if(firstday.getDay()==6){
				res += "</tr><tr>";
			}
		}
		
		
		
		
		for(var i=lastday.getDay(); i<14; i++){
			if(i<6){
				res+="<td align='center'><img src='../../../resources/menuimage/diary/block.png'></td>";
			}
		}
	
		res+="</tr></table>";
		
		var diary = document.getElementById("diary");
		
	
		
		diary.innerHTML = res;
	
	}
		
}