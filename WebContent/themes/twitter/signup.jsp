<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<% String path = request.getParameter("path"); %>

<html lang="pt">
<head>

<title>Twitter / Criar uma Conta</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8" />
<meta name="description"
	content="Conecte-se instantaneamente ao que é mais importante para você. Siga seus amigos, especialistas, celebridades favoritas, e notícias de última hora." />
<script type="text/javascript" src="<%= path %>js/jquery.js"></script>
<script type="text/javascript" src="<%= path %>js/hint.js"></script>
<script type="text/javascript" src="<%= path %>js/jquery-mask.js"></script>

<script type="text/javascript">
		$J(document).ready(function(){

			$J("#banner_email").hide();
			$J('#data_de_nascimento').focus(function(){
				//desabilitando o submit do form
				// $J("form").submit(function () { return false; });
				//atribuindo o valor do campo
				var sEmail	= $J("#verificar-email").val();
				// filtros
				var emailFilter=/^.+@.+\..{2,}$/;
				var illegalChars= /[\(\)\<\>\,\;\:\\\/\"\[\]]/
				// condição
				if(!(emailFilter.test(sEmail))||sEmail.match(illegalChars)){
					$J("#banner_email").show().removeClass("ok").addClass("erro")
					.text('Por favor, informe um email válido.');
				}else{
					$J("#banner_email").show().addClass("ok")
					.text('O e-mail informado está correto!');
				}
			});
			$J('#verificar-email').focus(function(){
				$J("#banner_email.erro").hide();
			});

			$J("#data_de_nascimento").mask("99/99/9999");

			$J("form").submit(function () {
				if($J("#nome-completo").val() == 'Nome Completo') {
					alert('O campo nome não pode estar em branco');
					return false;
				}
			});			

		});
	</script>

<script type="text/javascript" charset="utf-8"> 
	$J(function(){ 
		// find all the input elements with title attributes
	    $J('input[title!=""]').hint();
	    $J('#login_info').click(function(){
		$(this).fadeOut('fast');
		});
	});
</script>

<link href="<%= path %>img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" href="<%= path %>css/my.css" type="text/css" media="screen" />
</head>

<body class="t1 western pt logged-out">
	<div id="doc" class="phx-signup">
		<div class="topbar js-topbar">
			<div id="banners" class="js-banners">
				<noscript>
					<div class="banner-outer">
						<div class="banner">
							<div class="banner-inside noscript-warning">
								<h5>O Twitter.com usa bastante JavaScript.</h5>
								<span class="warning">Se você não conseguiu habilitar
									isso nas preferências do seu navegador, talvez você tenha uma
									melhor experiência em nosso <a href="http://m.twitter.com">site
										para celulares</a>.
								</span>
							</div>
						</div>
					</div>
				</noscript>
			</div>
			<div class="global-nav" data-section-term="top_nav">
				<div class="global-nav-inner">
					<div class="container">

						<ul class="nav js-global-actions">
							<li class="home" data-global-action="t1home"><a
								href="https://twitter.com/"> <span><i
										class="nav-home-logged-out"></i></span>
							</a></li>
						</ul>
						<ul class="nav secondary-nav session-dropdown" id="session">
							<li class="dropdown js-session"><a
								class="dropdown-toggle dropdown-signin" id="signin-link"
								href="signup#"> <small>Você possui uma conta?</small> Entrar
									<span class="caret"></span>
							</a> <a class="dropdown-signup" id="signup-link"
								href="https://twitter.com/signup?context=login"> <small>Novo
										no Twitter?</small><span class="emphasize"> Participe Hoje
										&raquo;</span>
							</a>
								<ul class="dropdown-menu dropdown-form" id="signin-dropdown">
									<li class="dropdown-caret right"><span class="caret-outer"></span>
										<span class="caret-inner"></span></li>
									<li>
										<form action="https://twitter.com/sessions?phx=1"
											class="js-signin signin" method="post">
											<fieldset class="textbox">
												<label class="username js-username"> <span>Nome
														de usuário ou e-mail</span> <input
													class="js-username-field email-input" type="text" value=""
													name="session[username_or_email]" autocomplete="on">
												</label> <label class="password js-password"> <span>Senha</span>
													<input class="js-password-field" type="password" value=""
													name="session[password]">
												</label>
											</fieldset>

											<fieldset class="subchck">
												<label class="remember"> <input type="checkbox"
													value="1" name="remember_me"> <span>Lembrar-me</span>
												</label>
												<button type="submit" class="btn submit">Entrar</button>
											</fieldset>

											<input type="hidden" name="scribe_log"> <input
												type="hidden" name="redirect_after_login" value="">

											<div class="divider"></div>
											<p>
												<a class="forgot"
													href="https://twitter.com/account/resend_password">Esqueceu
													sua senha?</a><br /> <a class="mobile has-sms"
													href="https://twitter.com/account/complete">Já utiliza
													o Twitter via mensagem de texto?</a>
											</p>
										</form>

									</li>
								</ul></li>
						</ul>
						<ul class="nav secondary-nav language-dropdown">
							<li class="dropdown js-language-dropdown"><a
								class="dropdown-toggle" href="javascript:;"> <small>Idioma:</small>
									<span class="js-current-language">Português</span> <b
									class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li class="dropdown-caret right"><span class="caret-outer"></span>
										<span class="caret-inner"></span></li>

									<li><a href="https://twitter.com/?lang=id"
										data-lang-code="id" title="Indonésio" class="js-language-link">Bahasa
											Indonesia</a></li>

									<li><a href="https://twitter.com/?lang=msa"
										data-lang-code="msa" title="Malaio" class="js-language-link">Bahasa
											Melayu</a></li>

									<li><a href="https://twitter.com/?lang=da"
										data-lang-code="da" title="Dinamarquês"
										class="js-language-link">Dansk</a></li>

									<li><a href="https://twitter.com/?lang=de"
										data-lang-code="de" title="Alemão" class="js-language-link">Deutsch</a></li>

									<li><a href="https://twitter.com/?lang=en"
										data-lang-code="en" title="Inglês" class="js-language-link">English</a></li>

									<li><a href="https://twitter.com/?lang=es"
										data-lang-code="es" title="Espanhol" class="js-language-link">Español</a></li>

									<li><a href="https://twitter.com/?lang=fil"
										data-lang-code="fil" title="Filipino" class="js-language-link">Filipino</a></li>

									<li><a href="https://twitter.com/?lang=it"
										data-lang-code="it" title="Italiano" class="js-language-link">Italiano</a></li>

									<li><a href="https://twitter.com/?lang=hu"
										data-lang-code="hu" title="Húngaro" class="js-language-link">Magyar</a></li>

									<li><a href="https://twitter.com/?lang=nl"
										data-lang-code="nl" title="Holandês" class="js-language-link">Nederlands</a></li>

									<li><a href="https://twitter.com/?lang=no"
										data-lang-code="no" title="Norueguês" class="js-language-link">Norsk</a></li>

									<li><a href="https://twitter.com/?lang=pl"
										data-lang-code="pl" title="Polonês" class="js-language-link">Polski</a></li>

									<li><a href="https://twitter.com/?lang=fi"
										data-lang-code="fi" title="Finlandês" class="js-language-link">Suomi</a></li>

									<li><a href="https://twitter.com/?lang=sv"
										data-lang-code="sv" title="Sueco" class="js-language-link">Svenska</a></li>

									<li><a href="https://twitter.com/?lang=tr"
										data-lang-code="tr" title="Turco" class="js-language-link">Türkçe</a></li>

									<li><a href="https://twitter.com/?lang=fr"
										data-lang-code="fr" title="Francês" class="js-language-link">français</a></li>

									<li><a href="https://twitter.com/?lang=ru"
										data-lang-code="ru" title="Russo" class="js-language-link">Русский</a></li>

									<li><a href="https://twitter.com/?lang=he"
										data-lang-code="he" title="Hebraico" class="js-language-link">עִבְרִית</a></li>

									<li><a href="https://twitter.com/?lang=ur"
										data-lang-code="ur" title="Urdu" class="js-language-link">اردو</a></li>

									<li><a href="https://twitter.com/?lang=ar"
										data-lang-code="ar" title="Árabe" class="js-language-link">العربية</a></li>

									<li><a href="https://twitter.com/?lang=fa"
										data-lang-code="fa" title="Persa" class="js-language-link">فارسی</a></li>

									<li><a href="https://twitter.com/?lang=hi"
										data-lang-code="hi" title="Hindi" class="js-language-link">हिन्दी</a></li>

									<li><a href="https://twitter.com/?lang=th"
										data-lang-code="th" title="Thai" class="js-language-link">ภาษาไทย</a></li>

									<li><a href="https://twitter.com/?lang=ja"
										data-lang-code="ja" title="Japonês" class="js-language-link">日本語</a></li>

									<li><a href="https://twitter.com/?lang=zh-cn"
										data-lang-code="zh-cn" title="Chinês Simplificado"
										class="js-language-link">简体中文</a></li>

									<li><a href="https://twitter.com/?lang=zh-tw"
										data-lang-code="zh-tw" title="Chinês Tradicional
"
										class="js-language-link">繁體中文</a></li>

									<li><a href="https://twitter.com/?lang=ko"
										data-lang-code="ko" title="Coreano" class="js-language-link">한국어</a></li>

								</ul>
								<div class="js-front-language">
									<form action="https://twitter.com/sessions/change_locale"
										class="language" method="POST">
										<input type="hidden" name="lang"> <input type="hidden"
											name="redirect">
									</form>
								</div></li>
						</ul>

						<div class="pull-right">
							<form class="form-search js-search-form"
								action="https://twitter.com/search" autocomplete="off"
								id="global-nav-search">
								<span class="search-icon js-search-action"> <i
									class="nav-search"></i>
								</span> <input class="search-input" type="text" id="search-query"
									placeholder="Buscar" name="q">

								<div class="dropdown-menu typeahead js-global-nav-dropdown">

								</div>
							</form>

						</div>




						<a class="close-all-tweets js-close-all-tweets" href="signup#"
							title="Fechar todos os Tweets abertos"> <i
							class="nav-breaker"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="alert-messages " id="message-drawer"></div>

		</div>

		<div id="page-outer">
			<div id="page-container" class="wrapper">
				<div class="page-canvas">
					<div class="signup-wrapper">

						<h1>Participe hoje do Twitter.</h1>

						<form id="phx-signup-form" method="post" action="Usuario?op=add" enctype="multipart/form-data">
							<input type="hidden" value="" name="authenticity_token" />

							<fieldset class="textbox">

								<% if(session.getAttribute("ok") != null) { %>
									<div style="margin-top:0" class="alert_success">
										<p>
											<img class="mid_align" alt="success" src="<%= request.getParameter("path") %>img/icon_accept.png">
												<%= session.getAttribute("ok") %>
										</p>
									</div>
								<% session.removeAttribute("ok"); } %>
								
								<!-- erros encontrados no cadastro -->
								<% if(session.getAttribute("erro") != null) { %>
									<div style="margin-top:0" class="alert_warning">
										<p>
											<img class="mid_align" alt="success" src="<%= request.getParameter("path") %>img/icon_warning.png">
												<%= session.getAttribute("erro") %>
										</p>
									</div>
								<% session.removeAttribute("erro"); } %>
							

								<div class="prompt name">
									<div class="holding " data-fieldname="name">
										<div class="sidetip">
											<p class="ok isaok">O nome parece ótimo.</p>
											<p class="tip">Digite seu nome e sobrenome.</p>
											<p class="blank invalid error" role="alert">É necessário
												um nome!</p>
										</div>
										<input id="nome-completo" type="text" autocomplete="off" value=""
											name="nome" maxlength="150" aria-required="true"
											title="Nome Completo" />
										<!-- <span class="holder">Nome Completo</span> -->
									</div>
								</div>

								<div class="prompt email">
									<div class="holding " data-fieldname="email">
										<div class="sidetip">
											<p id="banner_email" class="tip_active">Qual o seu
												endereço de e-mail?</p>
										</div>
										<input id="verificar-email" title="E-mail" class="email-input"
											type="text" autocomplete="off" value="" name="email"
											aria-required="true" />
									</div>
								</div>

								<div class="prompt email">
									<div class="holding " data-fieldname="email">
										<input id="data_de_nascimento" title="Data de Nascimento"
											class="email-input" type="text" autocomplete="off" value=""
											name="data_nascimento" aria-required="true" />
									</div>
								</div>

								<div class="prompt password">
									<div class="holding " data-fieldname="password">
										<div class="sidetip">

											<p class="tip">6 caracteres ou mais! Seja criativo.</p>
											<p class="perfect isaok">Legal, sua senha está perfeita!</p>
											<p class="ok isaok">A senha está boa.</p>
											<p class="weak isaok">A senha poderia ser mais segura</p>
											<p class="weak error" role="alert">A senha não é segura o
												suficiente.</p>
											<p class="obvious error" role="alert">Senha muito óbvia.</p>
											<p class="invalid error" role="alert">Senha deve ter pelo
												menos 6 caracteres.</p>
											<p class="blank error" role="alert">A senha não pode
												ficar em branco!</p>
										</div>
										<input onfocus="$J('#banner_senha').hide()" type="password"
											value="" name="senha" aria-required="true" />
										<span id="banner_senha" class="holder">Senha</span>
									</div>

									<div class="score">
										<span><b></b></span>
									</div>

								</div>

								<div class="prompt email">
									<div class="holding " data-fieldname="email">
										<input title="Pergunta Secreta" class="email-input"
											type="text" autocomplete="off" value=""
											name="pergunta_secreta" aria-required="true" />
									</div>
								</div>

								<div class="prompt username">
									<div class="holding " data-fieldname="username">
										<div class="sidetip">

											<p class="ok isaok">Nome de Usuário está disponível.</p>
											<p class="tip">Não se preocupe, você pode alterar mais
												tarde.</p>
											<p class="checking">Confirmando...</p>
											<p class="taken error" role="alert">Esse nome de usuário
												já está em uso!</p>
											<p class="invalid error" role="alert">Nome de usuário
												inválido! Apenas letras e números são aceitos.</p>
											<p class="blank error" role="alert">Um nome de usuário é
												necessário!</p>
										</div>
										<input title="Login" type="text" autocomplete="off" value=""
											data-pre-input-value="" name="login"
											maxlength="15" aria-required="true" />
									</div>
									<div class="suggestions">
										Sugestões:&#32;
										<ul></ul>
									</div>
								</div>

								<div class="prompt file">
									<div class="holding " data-fieldname="email">
										<input class="email-input" type="file" autocomplete="off"
											value="" name="foto" aria-required="true" />
									</div>
								</div>

								<div class="prompt rememberme">
									<label class="checkbox"> <input type="checkbox"
										checked="checked" name="mantenha_conectado" />
										<span>Mantenha-me conectado a este computador.</span>
									</label> 
									<input id="is-conectado-valor" type="hidden" name="mantenha_conectado"
										value="1" />
								</div>

								<input type="hidden" name="context" value="1" onclick="$J(#is-conectado-valor) = 0;"/>

							</fieldset>

							<div class="tos">
								<div class="sidetip">
									<p class="active tip">
										Versões para impressão:<br />
										<a href="https://twitter.com/tos" target="_blank">Termos
											de Serviço</a> &middot; <a href="https://twitter.com/privacy"
											target="_blank">Política de Privacidade</a>
									</p>
								</div>
								<div class="scroller">
									<p class="header">Ao clicar no botão, você concordará com
										os termos abaixo:</p>
									<div class="import">
										<h2>Termos de Serviço</h2>


										<p>
											Estes Termos de Serviço ("<strong>Termos</strong>") regem seu
											acesso e uso dos serviços e sites do Twitter (os "<strong>Serviços</strong>"),
											e qualquer informação, texto, gráficos, fotos ou outros
											materiais carregados, baixados ou publicados nos Serviços
											(normalmente chamado de "<strong>Conteúdo</strong>"). O
											acesso e uso dos Serviços estão condicionados a sua aceitação
											e cumprimento destes Termos. Ao acessar ou utilizar os
											Serviços você concorda estar vinculado a estes Termos.
										</p>

										<h3>Termos Básicos</h3>

										<p>
											Você é responsável pelo uso dos Serviços, por qualquer
											conteúdo que você enviar aos Serviços, e por quaisquer
											consequências. O conteúdo que você submeter, postar, ou
											exibir será visto por outros usuários dos Serviços, além de
											sites e serviços de terceiros ( vá até a página <a
												href="https://twitter.com/settings/account">configurações
												da conta</a> para controlar quem vê seu conteúdo). Você só
											deverá fornecer conteúdos no qual se sinta à vontade para
											compartilhar com outros usuários, sob esses Termos.
										</p>

										<p class="tip">
											<span class="tip">Dica</span> As informações que você divulga
											no Twitter podem ser vistas instantaneamente no mundo
											inteiro. Você é o que divulga no Tweet!
										</p>

										<p>Você só poderá utilizar os Serviços se puder firmar um
											contrato de concordância e obediência com os termos de
											Serviço do Twitter e não for uma pessoa impedida, pelas leis
											dos Estados Unidos ou de outra jurisdição aplicável, de
											receber serviços. Você só pode utilizar os Serviços em
											conformidade com esses Termos e com todas as normas,
											regulamentações e leis locais, estaduais, nacionais e
											internacionais aplicáveis.</p>

										<p>Os Serviços fornecidos pelo Twitter estão sempre
											evoluindo, a natureza e a forma como são oferecidos podem
											mudar a qualquer momento, sem qualquer aviso prévio. Além
											disso, o Twitter pode parar (de forma permanente ou
											temporária) de fornecer os Serviços (ou qualquer recurso que
											faça parte deles) a você ou aos usuários em geral e talvez
											não consiga avisá-lo com antecedência. Também nos reservamos
											o direito de criar limites relacionados ao uso e ao
											armazenamento, a nosso critério, a qualquer momento, sem
											aviso prévio.</p>

										<p>Os Serviços podem incluir anúncios, que podem estar
											relacionados ao Conteúdo, ou informações sobre os Serviços,
											consultas feitas através dos Serviços ou, ainda, outras
											informações. Os tipos e a extensão da publicidade feita pelo
											Twitter nos Serviços estão sujeitos à mudança. No que diz
											respeito ao Twitter conceder acesso aos Serviços e permissão
											para utilizá-los, você concorda que o Twitter e seus
											fornecedores e parceiros estão autorizados a publicar esses
											anúncios nos Serviços e relacionar essa publicidade à
											exibição do Conteúdo ou das informações nos Serviços, sejam
											elas enviadas por você ou por outros.</p>

										<h3>Privacidade</h3>


										<p>
											Todas as informações fornececidas por usuários ao Twitter,
											estão sujeitas às nossas <a
												href="https://twitter.com/privacy">Política de
												Privacidade</a>, que regulam a coleta e o uso de suas
											informações. Você entende que através da utilização dos
											Serviços você concorda com a coleta e utilização (conforme
											definido na Política de Privacidade) de tais informações,
											incluindo a transferência das informações para os Estados
											Unidos e/ou outros países para armazenamento, processamento e
											utilização pelo Twitter. Como parte da prestação destes
											Serviços, talvez seja necessário enviar-lhe anúncios de
											serviços e mensagens administrativas. Estas comunicações são
											consideradas parte dos Serviços e de sua conta do Twitter, e
											você não poderá optar por não recebê-los.
										</p>

										<p class="tip">
											<span class="tip">Dica</span> Você pode optar por desativar
											muitas das comunicações do Twitter, incluindo a nossa
											newsletter, e-mails sobre novos seguidores, etc. Por favor,
											acesse a sua aba de Notificações na suas Configurações para
											saber mais.
										</p>

										<h3>Senhas</h3>

										<p>Você é responsável por proteger a senha que você usa
											para acessar os serviços e para quaisquer atividades ou ações
											com sua senha. Nós lhe encorajamos a usar senhas "fortes"
											(senhas que usam uma combinação de letras maiúsculas e
											minúsculas, números e símbolos), com a sua conta.O Twitter
											não pode e não será responsável por qualquer perda ou dano
											resultante de sua falha em cumprir com os requisitos acima.</p>

										<h3>Conteúdo nos Serviços</h3>

										<p>Todo o conteúdo, seja ele publicado ou transmitido
											particularmente, é de única responsabilidade da pessoa que o
											originou. Nós não monitoramos ou controlamos o conteúdo
											publicado através dos Serviços, logo, não nos
											responsabilizaremos por este. A utilização do conteúdo ou do
											material publicado através dos Serviços ou obtido por meio
											deles e a confiança de que ele é seguro é de sua total
											responsabilidade.</p>

										<p>Não aprovamos, apoiamos, declaramos nem garantimos a
											integridade, a veracidade, a exatidão ou a confiabilidade de
											qualquer conteúdo ou comunicado publicado por meio dos
											Serviços. Além disso, também não endossamos opiniões
											expressas por meio deles. Você compreende e aceita que, ao
											usar os Serviços, pode estar exposto a conteúdo ofensivo,
											prejudicial, impreciso ou inadequado ou, em alguns casos,
											publicações que foram identificadas de modo indevido ou
											fraudulentas. Sob nenhuma circunstância, o Twitter será
											responsável, por qualquer conteúdo, incluindo, mas não
											limitado a, quaisquer erros ou omissões em algum conteúdo ou
											qualquer perda ou dano de qualquer natureza decorrente da
											utilização de algum conteúdo publicado, enviado por e-mail,
											transmitido ou disponibilizado por meio dos Serviços ou
											divulgado em qualquer outro local.</p>

										<h3>Seus Direitos</h3>

										<p>Você detém seus direitos sobre qualquer conteúdo que
											enviar, postar ou exibir nos Serviços ou por meio deles. Ao
											enviar, postar ou exibir conteúdo nos Serviços ou por meio
											deles, você nos concede uma licença livre de direitos
											autorais, não exclusiva e em âmbito mundial (com direito à
											sublicenciamento) de usar, copiar, reproduzir, processar,
											adaptar, modificar, publicar, transmitir, exibir e distribuir
											esse conteúdo em qualquer e em todos os tipos de mídia ou
											métodos de distribuição (já disponíveis ou desenvolvidos
											posteriormente).</p>

										<p class="tip">
											<span class="tip">Dica</span> Essa licença nos autoriza a
											tornar seus Tweets disponíveis para o resto do mundo e deixar
											que os outros façam o mesmo.
										</p>

										<p>Você concorda que essa licença dá ao Twitter o direito
											de tornar esse conteúdo disponível para outras empresas,
											organizações ou pessoas parceiros do Twitter para fins de
											distribuição, transmissão ou publicação dele em outros tipos
											de mídia e serviços, estando sujeito aos nossos termos e
											condições de utilização de conteúdo.</p>


										<p class="tip">
											<span class="tip">Dica</span> O Twitter tem uma série de <a
												href="https://twitter.com/apirules">regras</a> de forma que
											o ecossistema de parceiros possa interagir com seu conteúdo.
											Estas regras existem para habilitar um ecossistema aberto em
											conta com os seus direitos. Mas o que é seu, é seu - você é
											dono do seu conteúdo (e suas fotos fazem parte desse
											conteúdo)
										</p>

										<p>Essas utilizações adicionais por parte do Twitter, ou
											de outras empresas, organizações ou parceiros do Twitter,
											podem ocorrer sem qualquer remuneração a você no que diz
											respeito ao conteúdo que você envia, posta, transmite ou
											torna disponível por meio dos Serviços.</p>

										<p>Podemos modificar ou adaptar seu conteúdo para
											transmiti-lo, exibi-lo ou distribuí-lo em redes de
											computadores e em vários tipos de mídia e/ou fazer mudanças
											no conteúdo que sejam necessárias para adaptá-lo a exigências
											ou limitações de quaisquer redes, celulares, serviços ou
											mídia.</p>

										<p>Você é responsável pelo uso que faz dos Serviços, por
											qualquer conteúdo que forneça e por quaisquer consequências,
											inclusive a utilização de seu conteúdo por outros usuários e
											por nossos parceiros. Você compreende que seu conteúdo pode
											ser retransmitido por nossos parceiros e, se você não tiver o
											direito de enviá-lo para tal uso, poderá ser responsabilizado
											por isso. O Twitter não se responsabilizará por qualquer uso
											que faça do seu conteúdo de acordo com esses Termos. Você
											declara e garante que tem todos os direitos, poder e
											autoridade necessários para conceder os direitos aqui
											citados, a qualquer Conteúdo enviado por você.</p>

										<p>O Twitter oferece o use do software, em âmbito mundial,
											isento de direitos autorais, não atribuível e não exclusivo,
											providenciado pelo Twitter como parte dos Serviços. Essa
											licença tem a única finalidade de permitir que você utilize e
											usufrua do benefício dos Serviços fornecidos pelo Twitter, da
											maneira permitida por esses Termos.</p>

										<h3>Direitos do Twitter</h3>

										<p>Todos os direitos, títulos e interesse nos Serviços
											(exceto no conteúdo fornecido pelos usuários) são e
											continuarão sendo propriedade exclusiva do Twitter e de seus
											licenciadores). Os Serviços são protegidos por direitos
											autorais, marcas registradas e outras leis dos Estados Unidos
											e de países estrangeiros. Nenhuma informação contida nos
											Termos dá a você o direito de usar o nome do Twitter ou de
											quaisquer marcas registradas, logotipos, nomes de domínios do
											Twitter ou outros recursos de marcas distintas. Qualquer
											comentário ou sugestão que você possa fornecer relacionado ao
											Twitter ou aos Serviços é totalmente voluntário e nos
											sentiremos livres para usá-lo de acordo com a nossa
											conveniência e sem qualquer obrigação com você.</p>

										<h3>Restrições de Conteúdo e Utilização dos Serviços</h3>


										<p>
											Reservamos o direito (mas não a obrigação) de remover ou
											recusar a distribuir qualquer Conteúdo nos Serviços e
											encerrar contas ou recuperar nomes de usuários. Por favor
											reveja as <a
												href="http://support.twitter.com/articles/18311-the-twitter-rules">Regras
												do Twitter</a> (parte destes Termos) para entender melhor o que
											é proibido neste Serviço. Também reservamos o direito de
											acessar, ler, preservar e divulgar qualquer informação que
											acreditamos ser necessário para (i) satisfazer qualquer lei,
											regulamento, processo legal ou solicitação governamental,
											(ii) aplicar os Termos, incluindo a investigação de
											potenciais violações do mesmo, (iii) detectar, impedir ou de
											outra forma endereçar fraude, segurança ou questões técnicas,
											(iv) responder às solicitações de suporte ao usuário, ou (v)
											proteger os direitos de propriedade, ou a segurança do
											Twitter, seus usuários e o público.
										</p>

										<p class="tip">
											<span class="tip">Dica</span> O Twitter não divulga
											informações pessoais a terceiros, exceto de acordo com o que
											está descrito na nossa Política de Privacidade.
										</p>


										<p>
											Exceto quando permitido pelos Serviços (ou estes Termos),
											você deve usar a <a href="http://dev.twitter.com">API do
												Twitter</a> caso queira reproduzir, modificar, criar trabalhos
											derivados, distribuir, vender, transferir, exibir
											publicamente, executar publicamente, transmitir ou de todo
											modo utilizar o Conteúdo ou Serviços.
										</p>

										<p class="tip">
											<span class="tip">Dica</span> Estimulamos e permitimos uma
											ampla utilização do Conteúdo. E a API do Twitter existe para
											permitir essa utilização.
										</p>

										<p>Ao acessar ou utilizar os Serviços, você está proibido
											de: (i) acessar, alterar indevidamente ou usar áreas não
											públicas dos Serviços, dos sistemas de computador do Twitter
											ou dos sistemas de entrega técnica de provedores do Twitter;
											(ii) sondar, explorar ou testar a vulnerabilidade de qualquer
											sistema ou rede ou violar ou burlar quaisquer medidas de
											segurança ou autenticação; (iii) acessar, pesquisar ou tentar
											acessar os Serviços de qualquer maneira (automatizada ou não)
											a não ser através das interfaces publicadas e disponíveis no
											momento que são fornecidas pelo Twitter (e somente de acordo
											com esses termos e condições), a menos que você tenha
											recebido em um contrato separado com o Twitter permissão
											específica para fazê-lo (NOTA: o rastreamento dos Serviços é
											admissível se for feito de acordo com as provisões do arquivo
											robots.txt. No entanto, o recorte dos Serviços sem
											consentimento prévio do Twitter é expressamente proibido.);
											(iv) forjar o cabeçalho de qualquer pacote TCP/IP ou qualquer
											parte das informações do cabeçalho em qualquer e-mail ou
											postagem ou em qualquer utilização dos Serviços para enviar
											informações de identificação de origem alteradas,
											fraudulentas ou falsas; ou (v) prejudicar ou atrapalhar (ou
											tentar fazê-lo) o acesso de qualquer usuário, host ou rede,
											inclusive, e sem limitação, enviando vírus, sobrecarga,
											ataques de inundação, spam e e-mail bomba para os Serviços ou
											gerando scripts da criação de Conteúdo de tal maneira que
											interfira ou crie uma carga indevida nos Serviços.</p>

										<h3>Política de Direitos Autorais</h3>

										<p>O Twitter respeita os direitos de propriedade
											intelectual dos outros e espera que os usuários façam o
											mesmo. Responderemos a avisos de suposta violação de direitos
											autorais que estejam de acordo com a lei aplicável e nos
											sejam devidamente fornecidos. Se julgar que seu Conteúdo foi
											copiado de forma que constitua violação de direitos autorais,
											você deverá fornecer-nos as seguintes informações: (i) uma
											assinatura física ou eletrônica do proprietário do direito
											autoral ou de uma pessoa autorizada a agir em seu nome; (ii)
											a identificação do trabalho protegido por leis de direitos
											autorais que foi violado; (iii) a identificação do material
											que alega-se de ter sido violado ou estar sujeito à atividade
											de violação e que deverá ser removido ou cujo acesso ser
											cancelado, bem como informações razoáveis que nos permitam
											localizar o material; (iv) suas informações de contato,
											inclusive endereço, telefone e endereço de e-mail; (v) uma
											declaração sua de que você realmente acredita que o uso do
											material da maneira reclamada não está autorizado pelo
											proprietário do direito autoral, por seu agente ou pela lei;
											e (vi) uma declaração de que as informações na notificação
											são exatas e, sob penalidade de perjúrio, que você está
											autorizado a agir em nome do proprietário do direito autoral.</p>

										<p>Reservamos o direito de remover o Conteúdo supostamente
											violado, sem aviso prévio e a nosso critério. Em
											circunstâncias apropriadas, o Twitter também cancelará a
											conta de um usuário se ficar comprovado que ele é um infrator
											reincidente. Nosso agente designado para comunicados de
											suposta violação de direitos autorais nos Serviços é:</p>

										<address>
											Twitter, Inc. <br /> Aos cuidados de: Copyright Agent (Agente
											de Direitos Autorais) <br /> 795 Folsom Street, Suite 600 <br />
											São Francisco, CA 94107 <br /> E-mail: <a
												href="mailto:&#099;&#111;&#112;&#121;&#114;&#105;&#103;&#104;&#116;&#064;&#116;&#119;&#105;&#116;&#116;&#101;&#114;&#046;&#099;&#111;&#109;">&#099;&#111;&#112;&#121;&#114;&#105;&#103;&#104;&#116;&#064;&#116;&#119;&#105;&#116;&#116;&#101;&#114;&#046;&#099;&#111;&#109;</a>
										</address>

										<h3>Os Serviços estão disponíveis "COMO SÃO"</h3>
										<p>O acesso e utilização dos Serviços ou de quaisquer
											Conteúdos ficam por sua própria conta e risco. Você
											compreende e concorda que os Serviços lhe são fornecidos em
											uma base "COMO É" e "COMO DISPONÍVEL". Sem limitar o exposto,
											O TWITTER E SEUS PARCEIROS REJEITAM QUALQUER GARANTIA,
											EXPLÍCITA OU IMPLÍCITA, DE COMERCIALIZAÇÃO, ADEQUAÇÃO PARA UM
											FIM PARTICULAR, OU NÃO-VIOLAÇÃO. Nós não estabelecemos
											nenhuma garantia e nos isentamos de todas as
											responsabilidades pela plenitude, precisão, disponibilidade,
											pontualidade, segurança ou confiabilidade dos Serviços ou de
											qualquer conteúdo a respeito. O Twitter não será responsável
											por qualquer dano em seu computador, perda de dados ou outros
											danos que resultem no seu acesso ou utilização dos Serviços,
											ou de qualquer Conteúdo. Você também concorda que o Twitter
											não tem qualquer responsabilidade ou obrigação pela remoção,
											ou falha em armazenar ou transmitir , de qualquer Conteúdo ou
											outras comunicações mantidas pelos Serviços. Não oferecemos
											nenhuma garantia de que os Serviços atenderão às suas
											necessidades ou estarão disponíveis sem interrupções, com
											segurança, ou livre de erros. Nenhum aviso ou informação,
											seja oral ou escrito, obtido a partir do Twitter ou através
											dos Serviços, criará qualquer garantia não expressa aqui.</p>

										<h3>Links</h3>
										<p>Os Serviços podem conter links a sites ou recursos de
											terceiros. Você reconhece e concorda que não somos
											responsáveis: (i) pela disponibilidade ou precisão desses
											sites ou recursos; ou (ii) pelo conteúdo, pelos produtos e
											pelos serviços existentes ou disponíveis nesses sites ou
											recursos. Os links a esses sites ou recursos não implicam que
											o Twitter endossa os sites, os recursos, bem como o conteúdo,
											os produtos ou os serviços neles disponíveis. Você assume
											total responsabilidade e assume todo o risco decorrente do
											uso de qualquer site ou recurso.</p>

										<h3>Limitação de Responsabilidade</h3>
										<p>ATÉ OS LIMITES MÁXIMOS PERMITIDOS POR LEI, O TWITTER E
											SUAS SUBSIDIÁRIAS, AFILIADAS, EXECUTIVOS, FUNCIONÁRIOS,
											AGENTES, PARCEIROS E LICENCIADORES NÃO SERÃO RESPONSÁVEIS POR
											QUAISQUER DANOS DIRETOS, INDIRETOS, INCIDENTAIS, ESPECIAIS,
											CONSEQUENTES OU PUNITIVOS, INCLUSIVE MAS SEM LIMITAÇÃO, A
											PERDA DE LUCROS, DADOS, USO, CREDIBILIDADE OU, AINDA, OUTRAS
											PERDAS INTANGÍVEIS RESULTANTES DO (i) SEU ACESSO A, USO DE OU
											INCAPACIDADE DE ACESSAR OU USAR OS SERVIÇOS; (ii) QUALQUER
											CONDUTA OU CONTEÚDO DE TERCEIROS NOS SERVIÇOS, INCLUSIVE SEM
											LIMITAÇÃO, QUALQUER CONDUTA DIFAMATÓRIA, OFENSIVA OU ILEGAL
											POR PARTE DE OUTROS USUÁRIOS OU TERCEIROS; (iii) QUALQUER
											CONTEÚDO OBTIDO A PARTIR DOS SERVIÇOS; E (iv) ACESSO, USO OU
											ALTERAÇÃO NÃO AUTORIZADA DE SUAS TRANSMISSÕES OU DE SEU
											CONTEÚDO, SEJA BASEADO EM GARANTIA, CONTRATO, ILÍCITO CIVIL
											(INCLUINDO NEGLIGÊNCIA) OU QUALQUER OUTRA TEORIA LEGAL,
											INDEPENDENTEMENTE DO TWITTER TER SIDO INFORMADO DA
											POSSIBILIDADE DE TAL DANO E MESMO QUE UMA SOLUÇÃO EXPOSTA
											AQUI NÃO TENHA ATINGIDO SUA PRINCIPAL FINALIDADE.</p>

										<h3>Exclusões</h3>
										<p>Algumas jurisdições não permitem a exclusão de
											determinadas garantias ou a exclusão ou limitação de
											confiabilidade para danos conseqüentes ou incidentais.
											Portanto, pode ser que as limitações acima não se apliquem a
											você.</p>

										<h3>Desistência e Autonomia das Cláusulas</h3>
										<p>O fato de o Twitter não aplicar algum direito ou
											provisão desses Termos não será considerado como uma
											desistência de tal direito ou provisão. Caso qualquer
											provisão desses Termos seja considerada inválida ou
											inexigível, as provisões remanescentes desses Termos
											permanecerão em plena vigência.</p>

										<h3>Jurisdição e Lei de Controle</h3>
										<p>Estes Termos e qualquer ação relacionada mencionada
											aqui serão regidos pelas leis dos Estados da Califórnia sem
											considerar ou aplicar o respectivo conflito de provisões de
											leis ou seu estado ou país de residência. Todas as
											reivindicações, os processos legais ou os litígios
											decorrentes e relacionados aos Serviços serão executados
											exclusivamente no estado de São Francisco, Califórnia. Você
											consente com a jurisdição e o local de juízo nessas cortes e
											desiste de qualquer objeção relacionada a fórum
											inconveniente. Se você estiver aceitando esses Termos em nome
											de um órgão governamental federal dos Estados Unidos que é
											legalmente incapaz de aceitar as cláusulas de jurisdição,
											fórum ou lei de controle, então essas cláusulas não se
											aplicam a você. Em vez disso, esses Termos e qualquer ação
											relacionada mencionada aqui serão governados pelas leis dos
											Estados Unidos da América (sem referência a conflito de leis)
											e, na ausência de uma lei federal e até o limite permitido na
											lei federal, pelas leis dos Estados da Califórnia (excluindo
											a escolha da lei).</p>

										<h3>Contrato na Íntegra</h3>
										<p>Estes Termos, as Regras do Twitter e nossa Política de
											Privacidade são um acordo integral e exclusivo entre o
											Twitter e você, referentes aos Serviços (excluindo quaisquer
											serviços para os quais você tenha um acordo separado com o
											Twitter que esteja explicitamente em adição ou no lugar
											destes Termos), e estes Termos anulam e substituem quaisquer
											acordos anteriores entre o Twitter e você, com relação aos
											Serviços. Além de membros do grupo de empresas do qual o
											Twitter participa, nenhuma outra pessoa ou companhia se
											beneficiarão destes Termos.</p>


										<p>
											Os Termos poderão ser revistos eventualmente, a versão mais
											recente estará sempre disponível no <a
												href="https://twitter.com/tos">twitter.com/tos</a>. Se tal
											revisão ocorrer, à nosso critério, nós o notificaremos
											através de uma atualização via @Twitter ou por um e-mail ao
											endereço de e-mail associado à sua conta. Ao continuar
											acessando ou utilizando os Serviços após estas revisões
											entrarem em rigor, você concorda em submeter-se aos Termos
											revisados.
										</p>


										<p>
											Estes Serviços são operados e providos pelo Twitter Inc., 795
											Folsom Street, Suite 600, San Francisco, CA 94107. Se você
											tiver perguntas ou dúvidas sobre os nossos Termos, por favor
											<a href="https://twitter.com/about/contact">fale conosco</a>.
										</p>

										<p>
											<em>Vigência: June 01, 2011</em>
										</p>
									</div>
								</div>

							</div>

							<div class="standby">
								<p>Criando sua conta&hellip;</p>
							</div>

							<fieldset class="doit">

								<div class="sign-up-box">
									<input class="submit button promotional" type="submit" name="bt_submit"
										value="Criar minha conta" />
								</div>

								<div class="befound">


									<p>Nota: Outros usuários poderão encontrá-lo pelo nome,
										nome de usuário ou e-mail. Seu e-mail não será exibido
										publicamente. Você pode alterar suas configurações de
										privacidade a qualquer momento.</p>
									<input type="hidden" name="user[discoverable_by_email]"
										value="1" />

								</div>



								<input type="hidden" name="user[send_email_newsletter]"
									value="1" />


							</fieldset>


						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>