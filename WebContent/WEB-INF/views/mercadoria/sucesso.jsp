<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/estilo_geral.css" rel="stylesheet">
</head>
<title>Cadastro de Mercadoria</title>
<body>
	<c:import url="/WEB-INF/views/template/cabecalho_gerenciamento.jsp"/>
	
	<c:if test="${empty param.codigo}">
		<h1>Mercadoria ${param.nome} inserido com sucesso!</h1>
	</c:if>
	
	<c:if test="${not empty param.codigo }">
		<h1>Mercadoria ${param.nome } atualizado com sucesso!</h1>
	</c:if>
	
	<form action="acessar" method="post">
	<input id="hm" type="submit" value="Home">
    </form>
	

<c:import url="/WEB-INF/views/template/rodape.jsp" />
</body>
</html>