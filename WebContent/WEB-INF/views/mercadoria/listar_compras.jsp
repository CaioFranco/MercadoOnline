<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="data" class="java.util.Date"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mercadorias Compradas</title>
<link href="<c:url value="/resources/css/estilo_lista.css" />"	rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery.maskedinput.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/js/paging.js"></script> 

<script type="text/javascript">
            $(document).ready(function() {
                $('#tableData').paging({limit:20});
            });
        </script>
        <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</head>
<body background='<c:url value="/resources/imgs/bg.jpg"/>'>
<c:import url="/WEB-INF/views/template/cabecalho_gerenciamento.jsp"/>
<div class="formulario">
<br/>
<table class="tbHeader">
	<tr>
			<td id="cod">Codigo</<td>
			<td id="nome">Nome</td>			
			<td id="pre">Preço</td>			
			<td id="qtd">Quandtidade</td>
			<td id="tipo">Tipo</td>
			<td id="tipon">Tipo de Negocio</td>
	</tr>
</table>
	<div id="tableData">
		<table class="tabela">		
		<c:forEach items="${mercadoria }"  var="m">	
			<tr>
				<td id="cod"> ${m.codigo }</td>
				<td id="nome"> ${m.nome }</td>
				<td id="pre"> ${m.preco }</td>				
				<td id="qtd"> ${m.quantidade }</td>	
				<td id="tipo"> ${m.tipo }</td>
				<td id="tipon"> ${m.tipoNegocio.toString()}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<form action="acessar" method="post">
	<input id="hm" type="submit" value="Home">
</form>
<c:import url="/WEB-INF/views/template/rodape_geral.jsp" />
</div>
</body>
</html>


