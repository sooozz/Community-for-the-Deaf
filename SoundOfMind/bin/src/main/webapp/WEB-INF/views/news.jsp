<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html lang="en">
<head>
<title>Sound of Mind</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/news.css" />
<link rel="stylesheet" href="/resources/assets/css/community2.css" />

<!-- bootsnipp -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

<style type="text/css">
#header {
	display: -moz-flex;
	display: -webkit-flex;
	display: -ms-flex;
	display: flex;
	border-bottom: solid 5px #6495ED;
	padding: 6em 0 1em 0;
	position: relative;
}

.bg-dark {
	background-color: #6495ED !important;
}

.nav-link {
	display: initial;
	padding: 0.5rem 1rem;
	border-bottom: black;
	color: black !important;
}

.pagination {
	display: block;
	text-align: center;
}
</style>

<!-- animated -->
<style type="text/css">
#lia {
      position: relative;
      padding: 0.6em 2em;
      font-size: 18px;
      border: none;
      outline:none;
      color: #333;
      display: inline-block;
      text-decoration: none;
      z-index: 3;
}
</style>


</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main"  style="background-color: white;">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>Sound</strong> of Mind
					</a>
					<ul class="icons">
						<c:if test="${user==null}">
							<li><a href="login.do"><span class="label">?????????</span></a></li>
							<li><a href="join.do"><span class="label">????????????</span></a></li>
						</c:if>
						<c:if test="${user!=null }"> 
						${user.id}??? 
						<li><a href="logout.do"><span class="label">????????????</span></a></li>
						</c:if>
					</ul>
				</header>
				
				
					<!-- ?????? ??????  & ?????? -->
				<nav class="navbar navbar-expand navbar-light bg-white"
					style="height: 81px;">
					<div class="container">
						<div class="collapse navbar-collapse">
							<ul class="navbar-nav">
								<li class="nav-item active"><a href="community.do" class="nav-link">
										<img src="/resources/assets/img/board.png" width="27px"
										height="27px">
										???????????????
								</a></li>
								<li class="nav-item"><a href="news.do" class="nav-link"> <img
										src="/resources/assets/img/news3.png" width="27px"
										height="27px">
										??????
								</a></li>
								<li class="nav-item"><a href="chatting.do" class="nav-link"> <img
										src="/resources/assets/img/chat3.png" width="27px"
										height="27px">
										??????
								</a></li>
							</ul>
							<!-- ?????? -->
							<section id="search" class="alt"
								style="width: 50%; margin-left: 20px; margin-right: 20px;">
								<form action="#">
									<input type="text" name="query" id="query" placeholder="??????"
										style="margin-top: 30px;" />
								</form>
							</section>
							<ul class="navbar-nav d-none d-md-block">
								<li class="nav-item"><a class="nav-link"> <img
										src="/resources/assets/img/write2.png" width="32px"
										height="32px" onclick="boardWrite()">
										?????????
								</a></li>
							</ul>
						</div>
					</div>
				</nav>
				


				<section id="banner">
					<div class="content">
						<header>
							<h1>??????</h1>

						</header>
						<!-- ???????????? ?????? ????????? ??? ???????????? ????????? ????????????~ ?????? ??????,,  -->
						<h2>????????????</h2>
						<table>
							<thead>
								<tr>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach var="news1" items="${news1}">
									<tr>
										<td>${news1.rownum}</td>
										<td>${news1.date}</td>
										<td><a href="${news1.url}">${news1.title}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<h2>????????????</h2>
						<table>
							<thead>
								<tr>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="news2" items="${news2}">
									<tr>
										<td>${news2.rownum}</td>
										<td>${news2.date}</td>
										<td><a href="${news2.url}">${news2.title}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<h2>?????? ??????</h2>
						<table>
							<thead>
								<tr>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="news3" items="${news3}">
									<tr>
										<td>${news3.rownum}</td>
										<td>${news3.date}</td>
										<td><a href="${news3.url}">${news3.title}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<!-- ???????????? ?????? ????????? ???  -->
					</div>

				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>??????</h2>
					</header>
					<ul>
						<li><span class="opener">????????????</span>
							<ul>
								<li><a href="community.do">?????????</a></li>
								<li><a href="news.do">??????</a></li>
								<li><a href="chatting.do">??????</a></li>
								<li><a href="map.do">????????? ????????? ??????</a></li>
							</ul></li>
						<li><a href="mypage.do">?????????</a></li>
						<li><a href="elements.html">?????? ?????????</a></li>
					</ul>
				</nav>

			</div>
		</div>
</div>
		<!-- Scripts -->
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/news.js"></script>
		<script text="javascript/text">
    $(document).ready(function(){
 
        $('.box').each(function(){
            //var content = $(this).children('.content');
            var content = $(this).find('.contentStr');
 
            var content_txt = content.text();
            var content_html = content.html();
            var content_txt_short = content_txt.substring(0,100)+"...";
            var btn_more = $('<a href="javascript:void(0)" class="more">?????????</a>');
 
            
            $(this).append(btn_more);
            
            if(content_txt.length >= 100){
                content.html(content_txt_short)
                
            }else{
                btn_more.hide()
            }
            
            btn_more.click(toggle_content);
            function toggle_content(){
                if($(this).hasClass('short')){
                    // ?????? ??????
                    $(this).html('?????????');
                    content.html(content_txt_short)
                    $(this).removeClass('short');
                }else{
                    // ????????? ??????
                    $(this).html('??????');
                    content.html(content_html);
                    $(this).addClass('short');
 
                }
            }
        });
    });
  </script>
  
  <!-- bootsnipp -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
         $("li.nav-item").click(function (e) {
             e.preventDefault();
             $(".nav-item").removeClass("active");
             $(this).addClass("active");   
         });
     });
	</script>
  
  
</body>
</html>
