<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("nome") == null){
		session.invalidate();
		response.sendRedirect("Usuario?op=auth");
	}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Website Title -->
<title>Agenda | UniBrasil</title>

<!-- Meta data for SEO -->
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Template stylesheet -->
<link href="<%= path %>css/black/screen.css" rel="stylesheet" type="text/css" media="all">
<link href="<%= path %>css/black/datepicker.css" rel="stylesheet" type="text/css" media="all">
<link href="<%= path %>css/tipsy.css" rel="stylesheet" type="text/css" media="all">
<link href="<%= path %>js/visualize/visualize.css" rel="stylesheet" type="text/css" media="all">
<link href="<%= path %>js/jwysiwyg/jquery.wysiwyg.css" rel="stylesheet" type="text/css" media="all">
<link href="<%= path %>js/fancybox/jquery.fancybox-1.3.0.css" rel="stylesheet" type="text/css" media="all">
<link href="<%= path %>css/tipsy.css" rel="stylesheet" type="text/css" media="all">

<!--[if IE]>
	<link href="css/ie.css" rel="stylesheet" type="text/css" media="all">
	<script type="text/javascript" src="js/excanvas.js"></script>
<![endif]-->

<!-- Jquery and plugins -->
<script type="text/javascript" src="<%= path %>js/jquery.js"></script>
<script type="text/javascript" src="<%= path %>js/jquery-ui.js"></script>
<script type="text/javascript" src="<%= path %>js/jquery.img.preload.js"></script>
<script type="text/javascript" src="<%= path %>js/hint.js"></script>
<script type="text/javascript" src="<%= path %>js/visualize/jquery.visualize.js"></script>
<script type="text/javascript" src="<%= path %>js/jwysiwyg/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="<%= path %>js/fancybox/jquery.fancybox-1.3.0.js"></script>
<script type="text/javascript" src="<%= path %>js/jquery.tipsy.js"></script>
<script type="text/javascript" src="<%= path %>js/custom_black.js"></script>
<script type="text/javascript" src="<%= path %>js/jquery.maskedinput.js"></script>
<script type="text/javascript" src="<%= path %>js/jquery.alphanumeric.js"></script>

</head>
<body>
<div class="content_wrapper">

	<!-- Begin header -->
	<div id="header">
		<div id="logo">
			<img src="<%= path %>images/logo.png" alt="logo">
		</div>
		<!--
		<div id="search">
			<form action="dashboard.html" id="search_form" name="search_form" method="get">
				<input type="text" id="q" name="q" title="Buscar" class="search noshadow blur">
			</form>
		</div>
		 -->
		<div id="account_info">
			<img src="<%= path %>images/icon_online.png" alt="Online" class="mid_align">Olá <a href=""><%= session.getAttribute("nome") %></a> | <a href="Usuario?op=auth&logout=1">Sair</a>
		</div>
	</div>
	<!-- End header -->


	<!-- Begin left panel -->
	<a href="javascript:;" id="show_menu">»</a>
	<div id="left_menu">
		<a href="javascript:;" id="hide_menu">«</a>
		<ul role="tablist" class="ui-accordion ui-widget ui-helper-reset" id="main_menu">
			<li class="ui-accordion-li-fix"><a tabindex="0" aria-expanded="true" role="tab" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all" href="login_black.html"><span class="ui-icon ui-icon-triangle-1-e"></span><span class="ui-icon ui-icon-triangle-1-e"></span><img src="<%= path %>images/icon_home.png" alt="Home">Página Principal</a></li>

			<li class="ui-accordion-li-fix">
				<a href="#" class="ui-accordion-header ui-helper-reset ui-state-default ui-corner-all" role="tab" aria-expanded="true" tabindex="0"><span class="ui-icon ui-icon-triangle-1-e"></span><span class="ui-icon ui-icon-triangle-1-e"></span><img alt="Users" src="<%= path %>images/icon_users.png">Usuários</a>
				<ul style="display: none;" role="tabpanel" class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active">
					<li><a href="Usuario?op=list">Listar Todos</a></li>
					<li><a href="Usuario?op=add">Cadastrar</a></li>
				</ul>
			</li>
		</ul>
		<br class="clear">

		<!-- Begin left panel calendar -->
		<div id="calendar"></div>
		<!-- End left panel calendar -->

	</div>
	<!-- End left panel -->


	<!-- Begin content -->
	<div id="content">
		<div class="inner">
