<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<% String path = request.getParameter("path"); %>

<html><head>

<meta content="text/html; charset=utf-8" http-equiv="Content-Type">

<!-- Website Title -->
<title>Agenda | UniBrasil</title>

<!-- Meta data for SEO -->
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Template stylesheet -->
<link media="all" type="text/css" rel="stylesheet" href="<%= path %>css/black/screen.css">
<link media="all" type="text/css" rel="stylesheet" href="<%= path %>css/black/datepicker.css">
<link media="all" type="text/css" rel="stylesheet" href="<%= path %>js/visualize/visualize.css">
<link media="all" type="text/css" rel="stylesheet" href="<%= path %>js/jwysiwyg/jquery.wysiwyg.css">
<link media="all" type="text/css" rel="stylesheet" href="<%= path %>js/fancybox/jquery.fancybox-1.3.0.css">

<!--[if IE]>
	<link href="css/ie.css" rel="stylesheet" type="text/css" media="all">
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
<![endif]-->

<!-- Jquery and plugins -->
<script src="<%= path %>js/jquery.js" type="text/javascript"></script>
<script src="<%= path %>js/jquery-ui.js" type="text/javascript"></script>
<script src="<%= path %>js/jquery.img.preload.js" type="text/javascript"></script>
<script src="<%= path %>js/hint.js" type="text/javascript"></script>
<script src="<%= path %>js/visualize/jquery.visualize.js" type="text/javascript"></script>
<script src="<%= path %>js/jwysiwyg/jquery.wysiwyg.js" type="text/javascript"></script>
<script src="<%= path %>js/fancybox/jquery.fancybox-1.3.0.js" type="text/javascript"></script>
<script charset="utf-8" type="text/javascript">
$(function(){
    // find all the input elements with title attributes
    $('input[title!=""]').hint();
    $('#login_info').click(function(){
		$(this).fadeOut('fast');
	});
});
</script>
</head><body class="login">

	<!-- Begin login window -->
	<div id="login_wrapper">

		<br class="clear">
		<div id="login_top_window">
			<img alt="top window" src="<%= path %>images/black/top_login_window.png">
		</div>

		<!-- Begin content -->
		<div id="login_body_window">
			<div class="inner">
				<img alt="logo" src="<%= path %>images/login_logo.png">

				<form name="form_login" id="form_login" method="post" action="Usuario?op=auth">
					<p><input type="text" title="Usuário" style="width: 285px;" name="login" id="username" class="blur"></p>
					<p><input type="password" title="********" style="width: 285px;" name="senha" id="password" class="blur"></p>
					<p style="margin-top: 50px;">
						<input type="submit" style="margin-right: 5px;" class="Login" value="Entrar" name="submit" id="submit">
						<a style="font-size: 12pt; color: blue;" href="Usuario?op=add">Cadastre-se aqui, é grátis!</a>
					</p>
				</form>

			</div>
		</div>
		<!-- End content -->

		<div id="login_footer_window">
			<img alt="footer window" src="<%= path %>images/black/footer_login_window.png">
		</div>
		<div id="login_reflect">
			<img alt="window reflect" src="<%= path %>images/black/reflect.png">
		</div>
	</div>
	<!-- End login window -->

<div id="fancybox-tmp"></div><div id="fancybox-loading"><div></div></div><div id="fancybox-overlay"></div><div id="fancybox-wrap"><div id="fancybox-outer"><div id="fancy-bg-n" class="fancy-bg"></div><div id="fancy-bg-ne" class="fancy-bg"></div><div id="fancy-bg-e" class="fancy-bg"></div><div id="fancy-bg-se" class="fancy-bg"></div><div id="fancy-bg-s" class="fancy-bg"></div><div id="fancy-bg-sw" class="fancy-bg"></div><div id="fancy-bg-w" class="fancy-bg"></div><div id="fancy-bg-nw" class="fancy-bg"></div><div id="fancybox-inner"></div><a id="fancybox-close"></a><a id="fancybox-left" href="javascript:;"><span id="fancybox-left-ico" class="fancy-ico"></span></a><a id="fancybox-right" href="javascript:;"><span id="fancybox-right-ico" class="fancy-ico"></span></a></div></div></body></html>