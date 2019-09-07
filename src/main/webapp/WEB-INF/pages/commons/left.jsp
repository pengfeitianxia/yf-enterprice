<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="${ctx}/hplus/font-awesome/css/iconfont.css">
<nav class="navbar-default navbar-static-side" role="navigation" style="background: #273949;">
	<div class="sidebar-collapse" >
		<ul class="nav" id="side-menu">
			<li class="nav-header">
				<div class="dropdown profile-element" style="text-align: center">
					<span><img alt="image" class="img-circle" src="${ctx}/hplus/img/profile_small.jpg" /></span>
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">Beaut-zihan</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
					</a>
					<ul class="dropdown-menu animated fadeInRight m-t-xs">
						<li><a class="J_menuItem" href="#">修改头像</a>
						<li><a href="#">安全退出</a>
						</li>
					</ul>
				</div>
				<div class="logo-element">H+
				</div>
			</li>

			<li>
				<a href="#">
					<i class="fa fa-home"></i>
					<span class="nav-label">管理</span>
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level">
					<li>
						<a class="J_menuItem" href="javascript:void(0);" onclick="toPage('${ctx}/playUser/addUI');"data-index="0">用户管理</a>
					</li>
					<li>
						<a class="J_menuItem" href="index_v2.html">书籍管理</a>
					</li>
				</ul>

			</li>
		</ul>

	</div>

</nav>
<script type="text/javascript">
    $(function() {
        //判断浏览器是否为移动端的浏览器
        if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
            $("body").css("height","5000px");
            $("#page-wrapper").css("height","5000px");
        }else{
            $("#page-wrapper").css("overflow-y","false");
            $("#page-wrapper").slimScroll({height:"100%",railOpacity:.9,alwaysVisible:!1});
        }
    })
function toPage(url){
	//实现方式有问题， 暂时去掉。
	console.log("localStorage:" + localStorage.pageUrl);
	window.location.href = url;
}

</script>