<%@tag import="java.util.ArrayList"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute required="false" name="address1" type="java.lang.String"%>
<%
	
	String res="";
	
	ArrayList list = new ArrayList();
	list.add("강원도 고성군");
	list.add("강원도 삼척시");
	list.add("강원도 속초시");
	list.add("강원도 양양군");
	list.add("강원도 영월군");
	list.add("강원도 인제군");
	list.add("강원도 철원군");
	list.add("강원도 춘천시");
	list.add("강원도 평창군");
	list.add("강원도 홍천군");
	list.add("강원도 횡성군");
	list.add("경기도 가평군");
	list.add("경기도 광주시");
	list.add("경기도 남양주시");
	list.add("경기도 동두천시");
	list.add("경기도 부천시");
	list.add("경기도 성남시");
	list.add("경기도 안산시");
	list.add("경기도 양주시");
	list.add("경기도 양평군");
	list.add("경기도 여주시");
	list.add("경기도 연천군");
	list.add("경기도 용인시");
	list.add("경기도 포천시");
	list.add("경기도 화성시");
	list.add("경상북도  경주시");
	list.add("경상북도  안동시");
	list.add("경상북도  영덕군");
	list.add("경상북도  영주시");
	list.add("경상북도  영천시");
	list.add("경상북도  울진군");
	list.add("경상북도  청송군");
	list.add("경상북도  포항시");
	list.add("경상북도  포항북구");
	list.add("경상남도 거제시");
	list.add("경상남도 거창군");
	list.add("경상남도 고성군");
	list.add("경상남도 남해군");
	list.add("경상남도 마산시");
	list.add("경상남도 밀양시");
	list.add("경상남도 산청군");
	list.add("경상남도 양산시");
	list.add("경상남도 통영시");
	list.add("경상남도 합천군");
	list.add("전라북도 고창군");
	list.add("전라북도 남원시");
	list.add("전라북도 무주군");
	list.add("전라북도 부안군");
	list.add("전라북도 완주군");
	list.add("전라북도 장수군");
	list.add("전라북도 진안군");
	list.add("전라남도 강진군");
	list.add("전라남도 구례군");
	list.add("전라남도 무안군");
	list.add("전라남도 여수시");
	list.add("전라남도 담양군");
	list.add("충청북도 괴산군");
	list.add("충청북도 단양군");
	list.add("충청북도 보은군");
	list.add("충청북도 영동군");
	list.add("충청북도 제천시");
	list.add("충청북도 진천군");
	list.add("충청북도 충주시");
	list.add("충청남도 공주시");
	list.add("충청남도 보령시");
	list.add("충청남도 서산시");
	list.add("충청남도 천안시");
	list.add("충청남도 태안군");
	list.add("충청남도 홍성군");
	list.add("제주특별자치도 남제주군");
	list.add("제주특별자치도 북제주군");
	list.add("제주특별자치도 서귀포시");
	list.add("제주특별자치도 제주시");



	res+="<select name=\"address1\">";
	for(int i=0; i<list.size(); i++){
		if(list.get(i).equals(address1)){
			res+="<option value='"+list.get(i)+"' selected=\"selected\">"+list.get(i)+"</option>";
		}else{
			res+="<option value='"+list.get(i)+"'>"+list.get(i)+"</option>";
		}
	}
	res+="</select>";
	
	
%>

<%=res %>
	

