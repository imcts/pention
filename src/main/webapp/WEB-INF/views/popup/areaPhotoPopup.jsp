<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	#large{
		width:400px;
		height:350px;
		margin: 50px 0 50px 0;
	}
	
	#large img{
		width:400px;
		height:350px;
		border: solid 2px black; 
		padding: 5px;
	
	}
	
	.small img{
		width:68px;
		height:68px;
		float: left;
		margin: 10px 0 20px 20px;
		border: solid 1px black; 
		opacity:0.5;
	}
	

</style>
<script type="text/javascript" src="../resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-ui-1.8.23.custom.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<table border="0" width="100%">
	<tr>
		<td>
			<img src="../resources/menuimage/DetailAreaView.jpg">
		</td>
	</tr>
	
	
	
	
	<tr>
		<td align="center">
			<div id="large">
				<img src="../resources/menuimage/pentionimage/${popup.pentionResult.mainphoto }">
			</div>
		</td>
	</tr>
	
	
	
	
	<tr>
		<td align="center">
			
		</td>
	</tr>
	
</table>
	<div align="center" class="small">
					<a href="../resources/menuimage/pentionimage/${popup.pentionResult.mainphoto }"><img src="../resources/menuimage/pentionimage/${popup.pentionResult.mainphoto }"></a>
				<c:forEach items="${popup.pentionResult.areaphoto }" var="sub">
					<a href="../resources/menuimage/pentionimage/${sub }"><img src="../resources/menuimage/pentionimage/${sub }"></a>
				</c:forEach>
	</div>
			
			
<script type="text/javascript">
	
	
	$(".small a").click(function(){
		var changeImage = $(this).attr("href");
		$("#large > img").attr({src:changeImage});
		$("#large > img").stop().css("opacity",0).animate({"opacity":1},1300,"linear");
		
		
		$(".small img").css("opacity",0.5);
		$(".small img").css("border-color","black");

		$(this).find("img").css("opacity",1);	
		$(this).find("img").css("border-color","red");		
	
		return false;
	});
</script>
	
</body>
</html>