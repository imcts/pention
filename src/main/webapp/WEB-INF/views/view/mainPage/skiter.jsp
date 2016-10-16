<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	

<script type="text/javascript" language="javascript">
		$(document).ready(function() {
			$('.box_skitter_large').skitter({
				theme: 'clean',
				numbers_align: 'center',
				progressbar: false, 
				dots: false, 
				interval: 1000,
				preview: true,
				label: false,
				labelAnimation : 'right',
				hideTools: true,
				numbers:false,
				controls:false,
			});
		});
		
</script>
<style>
	.box_skitter_large {
		width: 700px;
		height: 300px;
	}

	img{
		width: 500px;
		height: 100px;
	}
</style>

</head>
<body>
	<div id="page">
			<div id="content">
				<div class="border_box">
					<div class="box_skitter box_skitter_large">
						<ul>
							<li><a href="#cube"><img src="../../resources/menuimage/pentionimage/1.jpg" class="random" /></a><div class="label_text"><p>이이요나 ~</p></div></li>
							<li><a href="#cubeRandom"><img src="../../resources/menuimage/pentionimage/1.jpg" class="random" /></a><div class="label_text"><p>cubeRandom</p></div></li>
							<li><a href="#block"><img src="../../resources/menuimage/pentionimage/1.jpg" class="random" /></a><div class="label_text"><p>block</p></div></li>
							<li><a href="#cubeStop"><img src="../../resources/menuimage/pentionimage/1.jpg" class="random" /></a><div class="label_text"><p>cubeStop</p></div></li>	
						</ul>
					</div>
				</div>
			</div>
	</div>

</body>
</html>