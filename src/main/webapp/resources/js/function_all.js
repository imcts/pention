var diary = new Diary();
var request = null;
function getXMLHttpRequest()// XMLHttpRequest 객체 구하는 함수
{
	if (window.ActiveXObject) {// IE에서 XMLHttpRequest 객체 구하기
		try {
			return new ActiveXObject("Msxml12.XMLHTTP");
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e1) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {
		// IE이외의 브라우저에서 XMLHttpRequest 객체 구하기(파이어폭스,오페라)
		return new XMLHttpRequest();
	} else {
		return null;
	}
}

function sendRequest(url, params, callback, method) {
	request = getXMLHttpRequest();

	request.onreadystatechange = callback;

	var httpMethod = method ? method : "GET";

	var httpUrl = url;

	var httpParams = params == null || params == '' ? null : params;

	if (httpMethod != "GET" && httpMethod != "POST")
		httpMethod = "GET";

	if (httpMethod == "GET" && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}

	request.open(httpMethod, encodeURI(httpUrl), true);// 요놈이 이 루트를 열어주는 놈

	request.send(httpMethod == "POST" ? httpParams : null);// get일땐 널이지만 포스트면
	// 값을 실어서 보내준다.
}



function refreshChuChunPention() {
	if (confirm("추천펜션을 갱신하면 경매가 종료됩니다. 진행하시겠습니까?")) {
		var fo = document.form;
		fo.action = "refreshChuChunPention";
		fo.submit();
	}
}

function chuchunIpchal() {
	var num = /[^0-9]/gi;
	var fo = document.form;
	if (num.test(document.form.serchMsg.value)) {
		alert("숫자만 입력가능 합니다.");
		return false;
	}
	if (document.form.serchMsg.value == "") {
		alert("금액을 입력하셔야 합니다.");
		return false;
	}
	var money = document.form.serchMsg.value;

	if (money < 10000) {
		alert("최소 입찰단위는 10,000원 입니다.");
		return false;
	}
	
	if(money > 80000000){
		alert("경매 최고 입찰가는 80,000,000원 입니다.");
		return false;
	}

	if (confirm("입찰 신청을 하시겠습니까?")) {
		fo.action = "chuchunIpChal";
		fo.submit();
	}
}

function chuchunIpChalList() {
	var fo = document.form;
	fo.action = "chuchunIpChalList";
	fo.submit();
}

function hwanbulUpdate(roomindex, milige, pid) {
	if (confirm("환불을 진행하시겠습니까?")) {

		var fo = document.form;
		fo.milige.value = milige;
		fo.pid.value = pid;
		fo.roomindex.value = roomindex;
		fo.saupjaViewPage.value = "yeyak";
		fo.userViewPage.value = "yeyak";
		fo.action = "hwanbulUpdate";
		fo.submit();
	}

}

function goToPentionForm() {
	var fo = document.form;
	fo.saupjaViewPage.value = "pentionForm";
	fo.action = "pentionForm";
	fo.submit();
}

function modifyMypention() {
	var fo = document.form;
	fo.saupjaViewPage.value = "pentionModify";
	fo.action = "pentionModify";
	fo.submit();
}

function deleteMyRoom(roomindex) {
	var fo = document.form;
	if (confirm("해당 방을 삭제하시겠습니까?")) {
		fo.roomindex.value = roomindex;
		fo.saupjaViewPage.value = "saupPention";
		fo.action = "myPentionRoomDelete";

		fo.submit();
	}
}

function returnPentionG() {
	if (confirm("수정을 취소하시겠습니까?")) {
		var fo = document.form;
		fo.saupjaViewPage.value = "saupPention";
		fo.saupja.value = "mypention";
		fo.action = "saupPention";
		fo.submit();
	}
}

function hwanbulForm(roomindex) {

	var fo = document.form;

	fo.roomindex.value = roomindex;
	fo.saupjaViewPage.value = "hwanbulView";
	fo.userViewPage.value = "hwanbulView";
	fo.action = "hwanbulView";
	fo.submit();

}

function updatePentionAll() {
	var fo = document.form;
	var regex = /\.(bmp|jpg|jpeg|gif|png)$/;

	var file = document.getElementById("mainfile").value;
	var file1 = document.getElementById("areafile1").value;
	var file2 = document.getElementById("areafile2").value;
	var file3 = document.getElementById("areafile3").value;
	var file4 = document.getElementById("areafile4").value;
	var file5 = document.getElementById("areafile5").value;

	if (!regex.test(file) && file != '') { // 파일명이 이미지가 아니거나, 파일명이 ""가 아니라면.
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file1) && file1 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file2) && file2 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file3) && file3 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file4) && file4 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file5) && file5 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}

	fo.saupjaViewPage.value = "saupPention";
	fo.action = "pentionUpdate";
	fo.submit();

}

function pentionRoomModify(roomname, roomsize, max, min, roomindex) {
	var fo = document.form;

	fo.roomname.value = roomname;
	fo.roomsize.value = roomsize;
	fo.max.value = max;
	fo.min.value = min;
	fo.roomindex.value = roomindex;
	fo.saupjaViewPage.value = "pentionRoomUpdateForm";
	fo.action = "pentionRoomUpdateForm";
	fo.submit();
}

function updatePentionRoom(roomindex) {
	var fo = document.form;
	var regex = /\.(bmp|jpg|jpeg|gif|png)$/;

	if (document.form.money.value == '') {
		document.form.money.value = '0';
	}
	if (document.form.addmoney.value == '') {
		document.form.addmoney.value = '0';
	}
	if (document.form.max.value == '') {
		document.form.max.value = '0';
	}
	if (document.form.min.value == '') {
		document.form.min.value = '0';
	}
	if (document.form.roomsize.value == '') {
		document.form.roomsize.value = '0'
	}
	if (document.form.roomname.value == '') {
		document.form.roomname.value = '방이름 미설정'
	}

	var file1 = document.getElementById("roomfile1").value;
	var file2 = document.getElementById("roomfile2").value;
	var file3 = document.getElementById("roomfile3").value;
	var file4 = document.getElementById("roomfile4").value;
	var file5 = document.getElementById("roomfile5").value;

	var max = document.getElementById("max").value;
	var min = document.getElementById("min").value;

	var max1 = Number(max);
	var min1 = Number(min);

	if (max1 < min1) {
		alert("최대인원은 최소인원보다 적을 수 없습니다");
		return false;
	}

	if (!regex.test(file1) && file1 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file2) && file2 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file3) && file3 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file4) && file4 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file5) && file5 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}

	fo.roomindex.value = roomindex;
	fo.saupjaViewPage.value = "saupPention";
	fo.action = "updatePentionRoom";
	fo.submit();

}

function roomnameChecking(pentionName) {
	var fo = document.form;
	fo.pentionName.value = pentionName;
	fo.saupjaViewPage.value = "makeRoomForm";
	fo.action = "roomnameChecking";
	fo.submit();

}

function makeRoomInput(pentionName, roomnameCheck) {
	var fo = document.form;
	var regex = /\.(bmp|jpg|jpeg|gif|png)$/;

	if (document.form.roomname.value == ''
			|| document.form.roomname.value == ' '
			|| document.form.roomname.value == '  '
			|| document.form.roomname.value == '   '
			|| document.form.roomname.value == '    '
			|| document.form.roomname.value == '     '
			|| document.form.roomname.value == '      '
			|| document.form.roomname.value == '       '
			|| document.form.roomname.value == '        '
			|| document.form.roomname.value == '         '
			|| document.form.roomname.value == '          '
			|| document.form.roomname.value == '           ') {

		alert("방이름은 비워둘 수 없습니다.");
		return false;

	}

	if (document.form.money.value == '') {
		document.form.money.value = '0';
	}
	if (document.form.addmoney.value == '') {
		document.form.addmoney.value = '0';
	}
	if (document.form.max.value == '') {
		document.form.max.value = '0';
	}
	if (document.form.min.value == '') {
		document.form.min.value = '0';
	}
	if (document.form.roomsize.value == '') {
		document.form.roomsize.value = '0'
	}
	if (document.form.roomname.value == '') {
		document.form.roomname.value = '방이름 미설정'
	}

	var max = document.getElementById("max").value;
	var min = document.getElementById("min").value;

	var max1 = Number(max);
	var min1 = Number(min);

	if (max1 < min1) {
		alert("최대인원은 최소인원보다 적을 수 없습니다");
		return false;
	}

	var file1 = document.getElementById("roomfile1").value;
	var file2 = document.getElementById("roomfile2").value;
	var file3 = document.getElementById("roomfile3").value;
	var file4 = document.getElementById("roomfile4").value;
	var file5 = document.getElementById("roomfile5").value;

	if (!regex.test(file1) && file1 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file2) && file2 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file3) && file3 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file4) && file4 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file5) && file5 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}

	if (roomnameCheck == 0) {
		alert("방이름 중복체크를 해주셔야 등록이 가능합니다.");
	} else {
		fo.pentionName.value = pentionName;
		fo.saupjaViewPage.value = "saupPention";
		fo.action = "makeRoomInput";
		fo.submit();
	}

}

function makeRoomForm(pentionname) {
	var fo = document.form;
	if (confirm("방이름은 한번 설정하시면 수정하실 수 없습니다.")) {
		fo.pentionName.value = pentionname;
		fo.saupjaViewPage.value = "makeRoomForm";
		fo.action = "makeRoomForm";
		fo.submit();
	} else {
		return false;
	}
}

function insertPentionAll() {
	var fo = document.form;
	var regex = /\.(bmp|jpg|jpeg|gif|png)$/;

	var file = document.getElementById("mainfile").value;
	var file1 = document.getElementById("areafile1").value;
	var file2 = document.getElementById("areafile2").value;
	var file3 = document.getElementById("areafile3").value;
	var file4 = document.getElementById("areafile4").value;
	var file5 = document.getElementById("areafile5").value;

	if (!regex.test(file) && file != '') { // 파일명이 이미지가 아니거나, 파일명이 ""가 아니라면.
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file1) && file1 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file2) && file2 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file3) && file3 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file4) && file4 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file5) && file5 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}

	fo.saupjaViewPage.value = "saupPention";
	fo.action = "pentionInsert";
	fo.submit();

}

function userGamang(id) {
	if (confirm("사업자 등록을 신청하시겠습니까?")) {
		var fo = document.form;

		fo.saupjaGamangId.value = id;
		fo.msgIndex.value = "go";
		fo.userViewPage.value = "userGamang";

		fo.action = "";
		fo.submit();
	}
}

function initialize(address1, address2) {

	var res = "<img border=\"0\" style=\"margin-bottom: 10px;\" src=\"../../../resources/menuimage/MapDetailBoardTopBar2.jpg\">";

	document.getElementById("mapTopbar").innerHTML = res;

	var addressResult = address1 + address2;

	var mapOptions = {
		zoom : 18, // 지도를 띄웠을 때의 줌 크기
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map-canvas"), // div의
	// id과
	// 값이
	// 같아야
	// 함.
	// "map-canvas"
	mapOptions);
	/*
	 * var size_x = 40; // 마커로 사용할 이미지의 가로 크기 var size_y = 40; // 마커로 사용할 이미지의
	 * 세로 크기
	 */

	// 마커로 사용할 이미지 주소
	/*
	 * var image = new
	 * google.maps.MarkerImage('http://www.travista.co.kr/files/where/thumb/thumb_20101031_102502_581_C0',
	 * new google.maps.Size(size_x, size_y), '', '', new
	 * google.maps.Size(size_x, size_y));
	 */

	// Geocoding *****************************************************
	var address = "" + addressResult; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
	var marker = null;
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			map.setCenter(results[0].geometry.location);
			marker = new google.maps.Marker({
				map : map,
				title : '어서오세요 ^-^', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
				position : results[0].geometry.location
			});

			var content = "펜션입니다^^"; // 말풍선 안에 들어갈 내용

			// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
			var infowindow = new google.maps.InfoWindow({
				content : content
			});
			google.maps.event.addListener(marker, "click", function() {
				infowindow.open(map, marker);
			});
		} else {
			alert("Geocode was not successful for the following reason: "
					+ status);
		}
	});
	// Geocoding // *****************************************************

	google.maps.event.addDomListener(window, 'load', initialize);

}

function mainPageDetail(pid){
	var fo = document.form;
	
	fo.pid.value=pid;
	
	fo.action="../mainPageDetailView/chuchunDetail";
	fo.submit();

}

function mainPageLoad(rankindex){
	objRun= setInterval("action()", 3000);
}

function action(){
	var rankindexMax = document.getElementById("rankindexMax").value;
	
	var rankindex = document.getElementById("rankindex").value;
		rankindex++;
	//alert(rankindexMax+"랭크 인덱스 맥스의값.");
	//alert(rankindex+"랭크 인덱스의 값.");
	document.getElementById("rankindex").value = rankindex;
	
	//alert(document.getElementById("rankindex").value+"랭크인덱스밸류의값");
	
	
	if(rankindex > rankindexMax){
	//	alert("진입");
		document.getElementById("rankindex").value=1;
		rankindex=1;
	}
	//alert(rankindex);
	sendRequest("../../../ajax/area/mainPageRanking", "rankindex=" + rankindex, mainPageDia, "GET");

}

function mainPageChoice(rankindex){
	sendRequest("../../../ajax/area/mainPageRanking", "rankindex=" + rankindex, mainPageDia, "GET");
}

function mainPageDia() {
	if (request.readyState == 4) {
		if (request.status == 200) {
			
			document.getElementById("mainPageRanking").innerHTML = request.responseText;
		}
	}
}

function suggestingLoad() {
	setTimeout(suggesting(), 300);
}

function suggesting() {
	var msg = document.form.topSerch.value;

	sendRequest("../../../ajax/area/topSerch", "topSerch=" + msg,
			suggestResult, "GET");
}

function suggestResult() {
	if (request.readyState == 4) {
		if (request.status == 200) {
			document.getElementById("suggestTop").innerHTML = request.responseText;
		}
	}
}

function detailBoardModifyWrite(no, page, pid, id) {
	var dcontent = document.form.dcontent.value;
	var dtitle = document.form.dtitle.value;
	sendRequest("../../../ajax/area/detailBoardModifyWrite", "pid=" + pid
			+ "&dPage=" + page + "&no=" + no + "&duser=" + id + "&dcontent="
			+ dcontent + "&dtitle=" + dtitle, detailBaordLoad, "GET");
}

function detailBoardDelete(pid, no) {
	if (confirm("삭제 하시겠습니까?")) {
		sendRequest("../../../ajax/area/detailBoardDelete", "pid=" + pid
				+ "&no=" + no, detailBaordLoad, "GET");
	}
}

function detailBoardModifyGo(pid, no, page) {
	sendRequest("../../../ajax/area/detailBoardModifyGo", "pid=" + pid
			+ "&dPage=" + page + "&no=" + no, detailBaordLoad, "GET");
}

function detailBoardReplyWrite(no, page, pid, id) {
	var dcontent = document.form.dcontent.value;
	var dtitle = document.form.dtitle.value;
	if(dcontent==''){
		alert("내용은 공백일 수 없습니다.");
		return false;
	}
	
	if(dtitle==''){
		alert("제목은 비워둘 수 없습니다.");
		return false;
	}
	sendRequest("../../../ajax/area/detailBoardReplyWrite", "pid=" + pid
			+ "&dPage=" + page + "&no=" + no + "&duser=" + id + "&dcontent="
			+ dcontent + "&dtitle=" + dtitle, detailBaordLoad, "GET");
}

function detailBoardReplyGo(pid, no, page) {
	
	sendRequest("../../../ajax/area/detailBoardReplyGo", "pid=" + pid
			+ "&dPage=" + page + "&no=" + no, detailBaordLoad, "GET");
}

function goDetailBoard(pid, page, no) {
	sendRequest("../../../ajax/area/detailBoardDetailView", "pid=" + pid
			+ "&dPage=" + page + "&no=" + no, detailBaordLoad, "GET");
}

function detailBoardInPut(pid, page, id) {

	
	
	var dcontent = document.form.dcontent.value;
	
	if(dcontent==''){
		alert("내용은 공백일 수 없습니다.");
		return false;
	}
	
	var dtitle = document.form.dtitle.value;

	if(dtitle==''){
		alert("제목은 비워둘 수 없습니다.");
		return false;
	}
	
	sendRequest("../../../ajax/area/detailBoardInPut", "pid=" + pid + "&dPage="
			+ page + "&dcontent=" + dcontent + "&dtitle=" + dtitle + "&duser="
			+ id, detailBaordLoad, "GET");
}

function detailWriteView(pid, page) {
	sendRequest("../../../ajax/area/detailWriteView", "pid=" + pid + "&dPage="
			+ page, detailBaordLoad, "GET");
}

function detailBoard(pid, page) {
	sendRequest("../../../ajax/area/detailBoard", "pid=" + pid + "&dPage="
			+ page, detailBaordLoad, "GET");
}

function detailBaordLoad() {
	if (request.readyState == 4) {
		if (request.status == 200) {
			document.getElementById("detailBoard").innerHTML = request.responseText;
		}
	}
}

function yeyakOk(pid, roomname, pentionname, id, money, day, inwon, term) {

	if (document.form.cardCheck1.value == "1"
			&& document.form.cardCheck2.value == "1"
			&& document.form.cardCheck3.value == "1"
			&& document.form.cardCheck4.value == "1") {

		if (confirm("결제를 진행하시겠습니까?")) {
			var fo = document.form;
			var cardnumber = document.form.card1.value + "-"
					+ document.form.card2.value + "-"
					+ document.form.card3.value + "-"
					+ document.form.card4.value;

			fo.pid.value = pid;// 펜션주
			fo.yeyakpentionName.value = pentionname;
			fo.yeyakid.value = id;
			fo.yeyakMoney.value = money;
			fo.yeyakDay.value = day;
			fo.yeyakTerm.value = term;
			fo.yeyakInwon.value = inwon;
			fo.bank.value = document.form.bank.value;
			fo.card.value = cardnumber;
			fo.yeyakroomname.value = roomname;
			/*
			 * '${bean.pid}'펜션주 ,'${bean.yeyakroomname }'펜션방이름
			 * ,'${bean.yeyakpentionName }'펜션이름 ,'${bean.yeyakid }'아이디
			 * ,'${bean.yeyakMoney }'예약금 ,'${bean.yeyakDay }'예약일 yeyakTerm < 몇박
			 * ,'${bean.yeyakInwon }'예약인원 카드번호 은행이름
			 */
			fo.action = "../../member/myPageView/yeyakInput";
			fo.submit();

		}

	} else {
		alert("카드 번호를 확인해주세요.");
	}
}

function carcheck1() {
	var num = /[0-9]{4}/gi;
	if (num.test(document.form.card1.value)) {
		document.form.cardCheck1.value = "1";
	} else {
		document.form.cardCheck1.value = "0";
	}
}
function carcheck2() {
	var num = /[0-9]{4}/gi;
	if (num.test(document.form.card2.value)) {
		document.form.cardCheck2.value = "1";
	} else {
		document.form.cardCheck2.value = "0";
	}
}
function carcheck3() {
	var num = /[0-9]{4}/gi;
	if (num.test(document.form.card3.value)) {
		document.form.cardCheck3.value = "1";
	} else {
		document.form.cardCheck3.value = "0";
	}
}
function carcheck4() {
	var num = /[0-9]{4}/gi;
	if (num.test(document.form.card4.value)) {
		document.form.cardCheck4.value = "1";
	} else {
		document.form.cardCheck4.value = "0";
	}
}

function areaPentionPhotoPop(pid, service) {

	var cw = screen.availWidth; // 화면 넓이
	var ch = screen.availHeight; // 화면 높이

	var sw = 600; // 띄울 창의 넓이
	var sh = 600; // 띄울 창의 높이

	var ml = (cw - sw) / 2; // 가운데 띄우기위한 창의 x위치
	var mt = (ch - sh) / 2; // 가운데 띄우기위한 창의 y위치

	window.open("../../../pention/" + service + "?pid=" + pid, '', 'width='
			+ sw + ',height=' + sh + ',top=' + mt + ',left=' + ml
			+ ',resizable=no,scrollbars=yes');

}

function detainRoomPhotoPop(pid, roomname, roomindex, service) {

	var cw = screen.availWidth; // 화면 넓이
	var ch = screen.availHeight; // 화면 높이

	var sw = 600; // 띄울 창의 넓이
	var sh = 600; // 띄울 창의 높이

	var ml = (cw - sw) / 2; // 가운데 띄우기위한 창의 x위치
	var mt = (ch - sh) / 2; // 가운데 띄우기위한 창의 y위치

	var url = encodeURI("../../../pention/" + service + "?pid=" + pid
			+ "&roomname=" + roomname + "&roomindex=" + roomindex);

	window.open(url, '', 'width=' + sw + ',height=' + sh + ',top=' + mt
			+ ',left=' + ml + ',resizable=no,scrollbars=yes');

}

function yeyakGo(year, month, day, yeyakmin, yeyakAddMoney, yeyakMoney, id,
		pid, yeyakroomname, yeyakpentionName) {

	var yeyakd = year + "," + month + "," + day;

	/*
	 * alert(year+"년"); alert(month+"월"); alert(day+"일"); alert(yeyakd+"일자");
	 * 
	 * alert(yeyakmin+"최소인원"); alert(yeyakAddMoney+"추가금액");
	 * alert(yeyakMoney+"예약금액"); alert(id+"유저아이디"); alert(pid+"펜션주아이디");
	 * alert(yeyakroomname+"예약한 방이름"); alert(yeyakpentionName+"펜션의이름");
	 */

	var fo = document.form;
	fo.yeyakpentionName.value = yeyakpentionName;
	fo.yeyakroomname.value = yeyakroomname;
	fo.pid.value = pid;
	fo.yeyakid.value = id;
	fo.yeyakDay.value = yeyakd;
	fo.yeyakmin.value = yeyakmin;
	fo.yeyakAddMoney.value = yeyakAddMoney;
	fo.yeyakMoney.value = yeyakMoney;
	fo.yeyakInwon.value = document.form.yeyakInwon.value;
	fo.yeyakTerm.value = document.form.value;

	fo.action = "../../member/yeyakGo/yeyakGO";
	fo.submit();
}

function allYeyakload(pid, roomname, year, month, day, money) {
	sendRequest("../../../ajax/area/yeyakList", "pid=" + pid + "&choiceYear="
			+ year + "&choiceMonth=" + month + "&choiceDay=" + day
			+ "&roomname=" + roomname + "&money=" + money, allyeyakView, "GET");
}

function allyeyakView() {
	if (request.readyState == 4) {
		if (request.status == 200) {
			document.getElementById("yeyakList").innerHTML = request.responseText;
		}
	}
}

function allRoomload(pid, year, month, day) {

	document.getElementById("choiceDiary").innerHTML = "선택하신 날자 : " + year
			+ "년 " + month + "월 " + day + "일";
	document.getElementById("yeyakList").innerHTML = "<img src='../../../resources/menuimage/RoomChoiceMent.jpg'>";
	sendRequest("../../../ajax/area/allRoomList", "pid=" + pid + "&choiceYear="
			+ year + "&choiceMonth=" + month + "&choiceDay=" + day,
			allRoomView, "GET");

}

function allRoomView() {// 상태에 때라 완료시 데이터 리시빙
	if (request.readyState == 4) {
		if (request.status == 200) {

			document.getElementById("allRoomList").innerHTML = request.responseText;
		}
	}
}

function goDiary(year, month, pid, day) {
	diary.diary(pid, year, month);
	allRoomload(pid, year, month, day);
}

function gotoMain() {
	if (confirm("메인 페이지로 이동합니다.")) {
		var fo = document.form;
		fo.action = "../../mainPage/mainView/mainPage";
		fo.submit();
	}
}

function subMenu(menu, main, service, sKey) {
	var fo = document.form;
	fo.serviceKey.value = sKey;
	fo.areaSerchKey.value = sKey;
	fo.action = "../../" + menu + "/" + main + "/" + service;
	fo.submit();
}

function serviceKey(sKey, service) {
	var fo = document.form;
	fo.serviceKey.value = sKey;
	fo.action = service;
	fo.submit();
}

function mainLogo() {
	var fo = document.form;
	fo.action = "../../mainPage/mainView/mainPage";
	fo.submit();
}

function topSerch(service) {
	var fo = document.form;
	fo.topSerch.value = document.form.topSerch.value;
	fo.action = "../../mainPage/topSerchView/" + service;
	fo.submit();
}

function suggestSerch(topSerch) {
	var fo = document.form;
	fo.topSerch.value = topSerch;
	fo.action = "../../mainPage/topSerchView/topSerch";
	fo.submit();
}

function bottomMenu(noticekey) {
	var fo = document.form;
	fo.serviceKey.value = noticekey;
	fo.action = "../../notice/noticeView/noticeSerch";
	fo.submit();
}

function login(service) {
	var fo = document.form;
	fo.id.value = document.form.id.value;
	fo.password.value = document.form.password.value;
	fo.action = "../../member/loginReg/" + service;
	fo.submit();
}

function serchClear(value) {
	if (value.defaultValue == value.value) {
		value.value = "";
	}
}

function yakgwanCheck() {
	if (document.form.yakgwan[0].checked == true) {
		location.href = "../../member/gaipView/yakgwan";
	} else {
		alert("비동의시 회원가입이 불가능합니다.");
	}
}

function findId() {
	var fo = document.form;

	if (document.form.nameIndex.value == 0) {
		alert("이름은 2~5글자만 입력가능합니다.");
	} else if (document.form.emailIndex.value == 0) {
		alert("이메일을 확인해주세요");
	} else if (document.form.emailNumberIndex.value == 0) {
		alert("이메일 인증 없인 가입할 수 없습니다.");
	} else {
		alert("본인인증에 성공하셨습니다. \n확인창으로 이동합니다.");
		fo.name.value = document.form.name.value;
		fo.email.value = document.form.email.value;
		fo.action = "idserch";
		fo.submit();
	}

}

function findPassword() {
	var fo = document.form;

	if (document.form.idIndex.value == 0) {
		alert("아이디를 확인해주세요.");
	} else if (document.form.emailIndex.value == 0) {
		alert("이메일을 확인해주세요");
	} else if (document.form.emailNumberIndex.value == 0) {
		alert("이메일 인증 없인 가입할 수 없습니다.");
	} else {
		alert("본인인증에 성공하셨습니다. \n확인창으로 이동합니다.");
		fo.id.value = document.form.id.value;
		fo.email.value = document.form.email.value;
		fo.action = "pwserch";
		fo.submit();
	}

}

function newMemberGaip() {
	var fo = document.form;

	if (document.form.idIndex.value == 0) {
		alert("아이디를 확인해주세요.");
	} else if (document.form.idCheckIndex.value == 0) {
		alert("중복검사를 하셔야만 가입됩니다.");
	} else if (document.form.passwordIndex.value == 0) {
		alert("비밀번호가 일치하지 않습니다.");
	} else if (document.form.nameIndex.value == 0) {
		alert("이름은 2~5글자만 입력가능합니다.");
	} else if (document.form.tellIndex.value == 0) {
		alert("전화번호를 확인해주세요.");
	} else if (document.form.emailIndex.value == 0) {
		alert("이메일을 확인해주세요");
	} else if (document.form.emailNumberIndex.value == 0) {
		alert("이메일 인증 없인 가입할 수 없습니다.");
	} else {
		alert("회원가입을 진심으로 감사드립니다. \n로그인창으로 이동합니다.");
		fo.id.value = document.form.id.value;
		fo.password.value = document.form.password.value;
		fo.tell.value = document.form.tell.value;
		fo.name.value = document.form.name.value;
		fo.email.value = document.form.email.value;
		fo.action = "gaip";
		fo.submit();
	}
}

function emailGo() {
	var fo = document.form;

	if (document.form.emailIndex.value == 0) {
		alert("메일주소를 확인해주세요.");
	} else if (document.form.emailIndex.value == 1) {

		fo.id.value = document.form.id.value;
		fo.password.value = document.form.password.value;
		fo.password1.value = document.form.password1.value;
		fo.tell.value = document.form.tell.value;
		fo.name.value = document.form.name.value;
		fo.email.value = document.form.email.value;

		alert("입력하신 메일주소로 인증번호가 발송되었습니다.");

		fo.action = "emailGo";
		fo.submit();
	}
}

function pop(service) {

	var cw = screen.availWidth; // 화면 넓이
	var ch = screen.availHeight; // 화면 높이

	var sw = 650; // 띄울 창의 넓이
	var sh = 650; // 띄울 창의 높이

	var ml = (cw - sw) / 2; // 가운데 띄우기위한 창의 x위치
	var mt = (ch - sh) / 2; // 가운데 띄우기위한 창의 y위치

	window.open('../../../pention/' + service, '', 'width=' + sw + ',height='
			+ sh + ',top=' + mt + ',left=' + ml
			+ ',resizable=no,scrollbars=yes');
}

function idFindEmailGo() {
	var fo = document.form;

	if (document.form.emailIndex.value == 0) {
		alert("메일주소를 확인해주세요.");
	} else if (document.form.emailIndex.value == 1) {
		fo.name.value = document.form.name.value;
		fo.email.value = document.form.email.value;

		alert("입력하신 메일주소로 인증번호가 발송되었습니다.");

		fo.action = "idSerchemailGo";
		fo.submit();
	}
}

function pwFindEmailGo() {
	var fo = document.form;

	if (document.form.emailIndex.value == 0) {
		alert("메일주소를 확인해주세요.");
	} else if (document.form.emailIndex.value == 1) {
		fo.id.value = document.form.id.value;
		fo.email.value = document.form.email.value;

		alert("입력하신 메일주소로 인증번호가 발송되었습니다.");

		fo.action = "pwSerchemailGo";
		fo.submit();
	}
}

function idMatchingCheck() {
	var fo = document.form;

	if (document.form.id.value == '') {
		alert("아이디 입력후 중복체크를 해주세요.");
		document.form.idCheckIndex.value = "0";
	} else {
		if (document.form.idIndex.value == 0) {
			document.form.idCheckIndex.value = "0";
			alert("형식에 맞지 않는 아이디입니다.");
		} else {
			fo.id.value = document.form.id.value;
			fo.password.value = document.form.password.value;
			fo.password1.value = document.form.password1.value;
			fo.tell.value = document.form.tell.value;
			fo.name.value = document.form.name.value;
			fo.email.value = document.form.email.value;

			fo.action = "idMatchingCheck";
			fo.submit();
		}
	}
}

function newMemberName() {
	var name = /[a-zA-Z가-힇]{2,5}/gi;
	var tsu = /[}\{0-9/\[\]()~!\#$^%@&*\=+|:;?"<,.>\\']/;
	if (name.test(document.form.name.value)) {
		if (tsu.test(document.form.name.value)) {
			document.form.nameText.style.color = "red";
			document.form.nameText.value = "이름은 2-5글자만 입력가능합니다.";
			document.form.nameIndex.value = "0";
		} else {
			document.form.nameText.style.color = "#41b431";
			document.form.nameText.value = "좋은 이름 이시네요 ^-^//";
			document.form.nameIndex.value = "1";
		}
	} else {
		document.form.nameText.style.color = "red";
		document.form.nameText.value = "이름은 2-5글자만 입력가능합니다.";
		document.form.nameIndex.value = "0";
	}

}

function newMemberEmail() {
	var mail = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

	if (mail.test(document.form.email.value)) {
		document.form.emailText.style.color = "#41b431";
		document.form.emailText.value = "메일 인증 받기 버튼을 눌러주세요.";
		document.form.emailIndex.value = "1";
	} else {
		document.form.emailText.style.color = "red";
		document.form.emailText.value = "메일 주소를 바르게 입력해주세요.";
		document.form.emailIndex.value = "0";
	}

}

function newMemberPhone() {
	var phone = /[0-9]{3}-[0-9]{3,4}-[0-9]{4}/gi;

	if (phone.test(document.form.tell.value)) {
		document.form.tellText.style.color = "#41b431";
		document.form.tellText.value = "올바르게 입력하셨습니다.";
		document.form.tellIndex.value = "1";
	} else {
		document.form.tellText.style.color = "red";
		document.form.tellText.value = "ex)010-1234-5678 로 입력해주세요.";
		document.form.tellIndex.value = "0";
	}
}

function newMemberPw() {
	if (document.form.password.value != document.form.password1.value) {
		document.form.passwordText.style.color = "red";
		document.form.passwordText.value = "비밀번호가 일치하지 않습니다.";
		document.form.passwordIndex.value = "0";
	} else {
		document.form.passwordText.style.color = "#41b431";
		document.form.passwordText.value = "비밀번호가 일치합니다.";
		document.form.passwordIndex.value = "1";
	}
}

function newMemberID() {
	var eng = /[a-zA-Z0-9]{5,8}/gi;
	var kor = /[가-힣ㄱ-ㅎㅏ-ㅣ]/g;
	var tsu = /[}\{/\[\]()~!\#$^%@&*\=+|:;?"<,.>\\']/;

	var val = document.form.id.value;
	if (eng.test(val)) {// 영어이고, 5-8글자여야 하고.
		if (kor.test(val)) {// 만약 한글이 하나라도 있으면,
			document.form.idText.value = "아이디는 영문,숫자로 5-8글자만 사용가능합니다. ";
			document.form.idText.style.color = "red";
			document.form.idIndex.value = "0";
		} else if (tsu.test(val)) {
			document.form.idText.value = "아이디는 영문,숫자로 5-8글자만 사용가능합니다. ";
			document.form.idText.style.color = "red";
			document.form.idIndex.value = "0";
		} else {// 아니라면
			document.form.idText.value = "형식에 맞는 아이디입니다.";
			document.form.idText.style.color = "#41b431";
			document.form.idIndex.value = "1";
		}
	} else {
		document.form.idText.value = "아이디는 영문,숫자로 5-8글자만 사용가능합니다. ";
		document.form.idText.style.color = "red";
		document.form.idIndex.value = "0";
	}
}

function areaSerchDetail(areaSerchKey, skey) {
	var fo = document.form;
	fo.serviceKey.value = skey;
	fo.areaSerchKey.value = areaSerchKey;
	fo.action = "areaSerch";
	fo.submit();
}

function areaDetailGo(areaSerchKey, skey, pid) {
	var fo = document.form;
	fo.serviceKey.value = skey;
	fo.areaSerchKey.value = areaSerchKey;
	fo.pid.value = pid;
	fo.action = "../areaDetailView/areaDetail";
	fo.submit();
}

function chuchunDetailGo(pid) {
	var fo = document.form;

	fo.pid.value = pid;
	fo.action = "../chuchunDetailView/chuchunDetail";
	fo.submit();
}


function GoldDetailGo(pid) {
	var fo = document.form;
	fo.pid.value = pid;
	fo.action = "../GoldDetailView/chuchunDetail";
	fo.submit();
}

function themaSerchDetail(themaSerchKey, thameAreaKey) {
	var fo = document.form;
	fo.thameAreaKey.value = thameAreaKey;
	fo.themaSerchKey.value = themaSerchKey;
	fo.action = "../themaView/themaSerch";
	fo.submit();
}

function themaDetailGo(themaSerchKey, thameAreaKey, pid) {
	var fo = document.form;
	fo.thameAreaKey.value = thameAreaKey;
	fo.themaSerchKey.value = themaSerchKey;
	fo.pid.value = pid;
	fo.action = "../themaDetailView/themaDetail";
	fo.submit();
}

function adminMypageGo(adminSubKey, adminViewPage) {
	var fo = document.form;
	fo.admin.value = adminSubKey;
	fo.adminViewPage.value = adminViewPage;

	var methodUrl = "";

	methodUrl = adminViewPage;

	fo.action = methodUrl;
	fo.submit();
}

function userMypageGo(userSubKey, userViewPage) {
	var fo = document.form;
	fo.user.value = userSubKey;
	fo.userViewPage.value = userViewPage;

	var methodUrl = "";

	methodUrl = userViewPage;

	fo.action = methodUrl;
	fo.submit();
}

function saupjaMypageGo(saupjaSubKey, saupjaViewPage) {
	var fo = document.form;
	fo.saupja.value = saupjaSubKey;
	fo.saupjaViewPage.value = saupjaViewPage;

	var methodUrl = "";

	methodUrl = saupjaViewPage;

	fo.action = methodUrl;
	fo.submit();
}

function areaGoBack(areaSerchKey, skey) {
	var fo = document.form;
	fo.serviceKey.value = skey;
	fo.areaSerchKey.value = areaSerchKey;
	fo.action = "../areaView/areaSerch";
	fo.submit();
}

function yeyakpage() {
	var fo = document.form;
	fo.userViewPage.value = 'yeyak';
	fo.action = "yeyak";
	fo.submit();
}
// =============================================================================================
// //////// 정보수정 /////////////////////////////////
function modifygogo() {

	var fo = document.form;
	if (confirm("회원정보를 수정하시겠습니까?")) {
		fo.userViewPage.value = 'userModifyForm';
		fo.action = "userModify";
		fo.submit();

	} else {
		return;
	}

}
function memeberModify(viewpage) {
	var fo = document.form;

	if (document.form.passwordIndex.value == 0) {
		alert("비밀번호가 일치하지 않습니다.");
	} else if (document.form.tellIndex.value == 0) {
		alert("전화번호를 확인해주세요.");
	} else if (document.form.emailIndex.value == 0) {
		alert("이메일을 확인해주세요");
	} else if (document.form.emailNumberIndex.value == 0) {
		alert("이메일 인증 없인 가입할 수 없습니다.");
	} else {

		fo.id.value = document.form.id.value;
		fo.password.value = document.form.password.value;
		fo.tell.value = document.form.tell.value;
		fo.email.value = document.form.email.value;
		fo.userViewPage.value = viewpage;

		alert("정보가 수정되었습니다 .");

		fo.action = "modifycom";
		fo.submit();

	}

}

function modifyEmailGo(viewpage) {/*
									 * http://localhost:8080/pention/pention/member/gaipView/yakgwan
									 *//*
	 * http://localhost:8080/pention/pention/member/myPageView/userModify
	 */// 넘어오는 뷰페이지는 컨트롤러에서 실행될 메소드의 값임과 동시에, myPageView가 실행시킬 값이 된다.
	// 형의 경우에는 어차피 정보 수정은 유저밖에 없으니까, 그냥 userViewPage의 값만 바꿔주면 된다.
	var fo = document.form;
	if (document.form.emailIndex.value == 0) {
		alert("메일주소를 확인해주세요.");
	} else {
		fo.password.value = document.form.password.value;
		fo.password1.value = document.form.password1.value;
		fo.tell.value = document.form.tell.value;
		fo.email.value = document.form.email.value;

		fo.userViewPage.value = viewpage; // 그러면 userViewPage 값을 이용하여 view페이지를
											// 인클루딩 한다.

		alert("입력하신 메일주소로 인증번호가 발송되었습니다.");

		fo.action = "modifyEmailGo";// 그러면 자동으로 해당 뷰 페이지에 해당하는 메소드를 실행시키게 될거고 ,
									// 주소값의 마지막인 service값이 바뀔 테니까.
		fo.submit();
	}

}

// ==========================회원탈퇴=================================================================
function memberDelete(viewpage) {
	var fo = document.form;

	if (confirm("정말로 탈퇴를 진행하시겠습니까?")) {

		fo.id.value = document.form.id.value;
		fo.userViewPage.value = 'mainView';
		fo.action = "memberExitCom";
		fo.submit();
	} else {
		return;
	}

}
// //////////==================================================회원찾기
function memberSuch() {

	var fo = document.form;
	var res = document.form.suchId.value;

	if (res != null && res != '') {
		fo.adminViewPage.value = 'adminMemberView';

		fo.action = "adminMemberSuchView";

		fo.submit();
	} else {

		alert("검색 명령값은 필수입니다.");
	}

}
// //========================등업조정
function gradeUp(index, id) {

	var fo = document.form;

	fo.chgrade.value = document.getElementById(index).value;

	fo.upId.value = id;
	fo.adminViewPage.value = 'adminMemberView';
	fo.action = "memChangegGrade";
	alert("사용자의 등급이 변경되었습니다");
	fo.submit();
}
// /////////////////////////////////////////////////////////////////////////////

// ////////////////////////noticeboard////////////////////

function noticedetail(title, ids, boardKey, noplus) {
	var fo = document.form;

	if (title == '삭제된게시물입니다') {
		alert("관리자나 본인에 의해 삭제된 글입니다");
	} else {
		fo.ids.value = ids;
		fo.boardKey.value = boardKey;

		fo.noplus.value = noplus;

		fo.action = "../../notice/detailView/detail";
		fo.submit();
	}

}
function goback(ids, serviceKey) {

	var fo = document.form;
	fo.ids.value = ids;
	fo.boardKey.value = serviceKey;
	fo.action = "../../notice/detailView/detail";
	fo.submit();

}
// //------------------------------------------------------------------------------------
function gogoback(ids, serviceKey) {

	var fo = document.form;
	var msg = '입력하던 내용이 사라집니다';
	if (!confirm(msg))
		return;

	fo.ids.value = ids;
	fo.boardKey.value = serviceKey;
	fo.action = "../../notice/detailView/detail";
	fo.submit();

}

// /////////////////////----------------------------------------------------
function back(boardKey) {
	// /디테일에서 뒤로 가는 메소드

	var fo = document.form;

	fo.serviceKey.value = boardKey;

	fo.action = "../../notice/noticeView/" + boardKey;

	fo.submit();

}

function noticewrite(noticeWrite, noticekey) {

	var fo = document.form;
	fo.boardKey.value = noticeWrite;
	fo.serviceKey.value = noticekey;
	fo.action = "../../notice/noticeWrite/write";
	fo.submit();
}

function detailwrite(serviceKey) {
	// 유효성 검사 제목이 널이면 메세지 띄우고 추가되지않게

	var fo = document.form;
	if (fo.title.value == '' || fo.title.value == null) {
		alert("제목을 입력하셔야 합니다");

	} else if (fo.content.value == '' || fo.content.value == null) {

		alert("내용이 없네요");
	} else if (fo.title.value == '삭제된 글입니다') {
		alert("사용할수 없는 제목입니다");
	} else {
		fo.serviceKey.value = serviceKey;
		if (fo.serviceKey.value == 'qna') {
			fo.qnaPage.value = 1;
		} else if (fo.serviceKey.value = 'noticeboard') {
			fo.noticePage.value = 1;
		}
		fo.boardKey.value = 'comWrite';
		fo.action = "../../notice/detailView/detail";
		fo.submit();

	}

}

function reply(noticekey, noplus) {
	var fo = document.form;

	fo.noplus.value = noplus;
	fo.boardKey.value = "reply";
	fo.serviceKey.value = noticekey;
	fo.action = "../../notice/noticeWrite/reply";
	fo.submit();

}

function replywrite(serviceKey, replycom, noplus) {

	var fo = document.form;

	fo.serviceKey.value = serviceKey;

	if (fo.title.value == '' || fo.title.value == null) {
		alert("제목을 입력하셔야 합니다");

	} else if (fo.content.value == '' || fo.content.value == null) {

		alert("내용이 없네요");
	} else {

		fo.noplus.value = noplus;

		if (fo.noplus.value == 10 && serviceKey == 'qna') {

			fo.qnaPage.value++;
		}
		fo.boardKey.value = replycom;
		fo.action = "../../notice/detailView/detail";
		fo.submit();
	}

}

function noticemodify(serviceKey) {
	var fo = document.form;
	fo.boardKey.value = 'modify';
	fo.serviceKey.value = serviceKey;
	fo.action = "../../notice/noticeWrite/modify";
	fo.submit();

}
function noticeModifyWrite(serviceKey, noticeModifyWrite) {
	var fo = document.form;
	if (fo.title.value == '' || fo.title.value == null) {
		alert("제목을 입력하셔야 합니다");

	} else if (fo.content.value == '' || fo.content.value == null) {

		alert("내용이 없네요");
	} else {

		fo.serviceKey.value = serviceKey;
		fo.boardKey.value = noticeModifyWrite;
		fo.action = "../../notice/detailView/detail";
		fo.submit();
	}

}

function noticedelete(serviceKey) {
	var msg = '삭제하시겟습니까';
	var fo = document.form;
	if (!confirm(msg))
		return;

	fo.boardKey.value = 'noticedelete';
	fo.serviceKey.value = serviceKey;
	fo.action = serviceKey;
	fo.submit();

}

function noticepaging(i, serviceKey) {

	var fo = document.form;
	if (serviceKey == 'noticeboard') {
		fo.serviceKey.value = 'noticeboard';
		fo.noticePage.value = i;
		fo.action = "../../notice/noticeView/" + serviceKey;
		fo.submit();

	} else if (serviceKey == 'qna') {
		fo.serviceKey.value = 'qna';
		fo.qnaPage.value = i;
		fo.action = "../../notice/noticeView/" + serviceKey;
		fo.submit();
	}

}

// //////////////////////////noticeboard///////////////////////////////

// /////////////////////freeboard//////////////////////////////
function fPaging(i) {

	var fo = document.form;
	fo.fpage.value = i;
	fo.action = "../../comm/comView/comSerch";
	fo.submit();

}
function freeDetail(fids, fpage, ftitle) {
	var fo = document.form;
	fo.fpage.value = fpage;
	fo.fids.value = fids;
	if (ftitle == '삭제된게시물입니다') {
		alert('관리자나 본인에 의해 삭제된 글입니다');
	} else {
		fo.action = "../../comm/comDetailView/freedetail";
		fo.submit();
	}

}

function freewriteForm(fpage) {
	var fo = document.form;

	fo.fpage.value = fpage;
	fo.action = "../../comm/comWriteForm/freewriteform";
	fo.submit();

}

function freewrite(fuserid, fpage) {

	var fo = document.form;
	var regex = /\.(bmp|jpg|jpeg|gif|png)$/;

	var file1 = document.getElementById("file1").value;
	var file2 = document.getElementById("file2").value;
	var file3 = document.getElementById("file3").value;
	var file4 = document.getElementById("file4").value;
	var file5 = document.getElementById("file5").value;

	if (!regex.test(file1) && file1 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file2) && file2 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file3) && file3 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file4) && file4 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file5) && file5 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}

	if (fo.ftitle.value == '' || fo.ftitle.value == null) {
		alert("제목을 입력하셔야 합니다");

	} else if (fo.ftitle.value == '삭제된게시물입니다.'
			|| fo.ftitle.value == '삭제된 게시물입니다.') {
		alert("사용 할수 없는 제목입니다.");
	} else if (fo.fcontent.value == '' || fo.fcontent.value == null) {

		alert("내용은 공백이 될 수 없습니다.");
	} else {

		fo.fuserid.value = fuserid;
		fo.fpage.value = fpage;
		fo.ftitle.value = document.form.ftitle.value;
		fo.fhead.value = document.form.fhead.value;

		fo.fcontent.value = document.form.fcontent.value;

		fo.action = "../comDetailView/freewrite";
		fo.submit();
	}
}

function freelist(fpage) {

	var fo = document.form;

	fo.fpage.value = fpage;
	fo.action = "../comView/comSerch";
	fo.submit();

}

function freeReplyForm(fpage, fids) {

	var fo = document.form;
	fo.fpage.value = fpage;

	fo.fids.value = fids;

	fo.action = "../comReplyForm/freereplyform";

	fo.submit();

}

function freeReplywrite(fids, fuserid, fpage) {
	var fo = document.form;
	
	if (fo.ftitle.value == '' || fo.ftitle.value == null) {
		alert("제목을 입력하셔야 합니다");

	} else if (fo.ftitle.value == '삭제된게시물입니다.'
			|| fo.ftitle.value == '삭제된 게시물입니다.') {
		alert("사용 할수 없는 제목입니다.");

	} else if (fo.fcontent.value == '' || fo.fcontent.value == null) {

		alert("내용은 공백이 될 수 없습니다.");
	} else {
		fo.fuserid.value = fuserid;
		fo.fpage.value = fpage;
		fo.ftitle.value = document.form.ftitle.value;

		fo.fcontent.value = document.form.fcontent.value;
		fo.fids.value = fids;
		
		fo.action = "../../comm/comDetailView/freereplywrite";
		fo.submit();
	}

}

function freemodifyform(fpage, fids, fuserid) {
	var fo = document.form;

	fo.fids.value = fids;

	fo.fuserid.value = fuserid;

	fo.fpage.value = fpage;
	
	fo.action = "../../comm/comModifyForm/freemodifyform";

	fo.submit();

}

function freemodifywrite(fids, fuserid, fpage) {

	var fo = document.form;
	var regex = /\.(bmp|jpg|jpeg|gif|png)$/;

	var file1 = document.getElementById("file1").value;
	var file2 = document.getElementById("file2").value;
	var file3 = document.getElementById("file3").value;
	var file4 = document.getElementById("file4").value;
	var file5 = document.getElementById("file5").value;

	if (!regex.test(file1) && file1 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file2) && file2 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file3) && file3 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file4) && file4 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}
	if (!regex.test(file5) && file5 != '') {
		alert("이미지 파일만 등록 가능합니다.");
		return false;
	}

	fo.fuserid.value = fuserid;
	fo.fpage.value = fpage;
	fo.ftitle.value = document.form.ftitle.value;

	fo.fcontent.value = document.form.fcontent.value;
	fo.fids.value = fids;

	if (fo.ftitle.value == '삭제된게시물입니다' || fo.ftitle.value == '삭제된 게시물입니다') {
		alert("사용 할수 없는 제목입니다.");
	} else {
		fo.action = "../../comm/comDetailView/freemodifywrite";
		fo.submit();
	}

}

function freedelete(fids, fuserid, fpage) {

	var msg = '삭제하시겟습니까';
	var fo = document.form;
	if (!confirm(msg))
		return;

	fo.fids.value = fids;

	fo.fuserid.value = fuserid;

	fo.fpage.value = fpage;

	
	fo.action = "../../comm/comView/freedelete";

	fo.submit();

}

// /////////////////////freeboard//////////////////////////////

// ///////////////////////////////topserch//////////////////////////////
function topserchload(page) {

	sendRequest("../../../ajax/mainPage/afterBoard", "a_page=" + page,
			topSerchView, "GET");
}
function topserchstart() {

	sendRequest("../../../ajax/mainPage/afterBoard", "", topSerchView, "GET");

}

function topSerchView() {

	if (request.readyState == 4) {

		if (request.status == 200) {
			document.getElementById("afterboardView").innerHTML = request.responseText;

		}
	}
}

function topSerchStart(page) {

	sendRequest("../../../ajax/mainPage/afterBoard", "a_page=" + page,
			topSerchView, "GET");

}

// /////////////////////////////topserch//////////////////////////////
// -#####################################33---------------사업자 승인
// 등업-------------------------------------------------------------------------------
function saupjaUp(id) {

	var fo = document.form;
	fo.idup.value = id;

	fo.adminViewPage.value = 'adminPentionView';
	fo.action = "okAdmin";
	alert("승인 완료 ");
	fo.submit();

}
function subgiveme(id) {
	var f = document.form;
	var msg = '지금 입금 하시겟습니까?';
	if (!confirm(msg)) {
		return;
	} else {

		f.upId.value = id;
		f.adminViewPage.value = 'adminTotalMoneyView';
		f.action = "admingiveMoney";
		alert("입금되었습니다");
		f.submit();
	}
}

function yse() {

	var fo = document.form;
	fo.payYear.value = document.form.Year.value;
	fo.payMonth.value = document.form.Month.value;

	fo.adminViewPage.value = 'adminViewMyMoney';
	fo.action = "viewMoney";
	fo.submit();
}
