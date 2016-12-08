<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="br.mo.modelo.TipoNegocio"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/estilo_form.css" rel="stylesheet">
</head>
<title>Cadastrar Mercadoria</title>
<body>
<c:import url="/WEB-INF/views/template/cabecalho_gerenciamento.jsp"/>
<h2>Cadastro de Mercadoria</h2>
<br/><br/>
	<form action="AddMercadoria" method="post" enctype="multipart/form-data">
	<fieldset>
	<legend>Dados Necessários para o Cadastro</legend>
	
	<input type="hidden" name="id" value="${mercadoria.codigo }">
		<label>Nome:</label>
		<input type="text" name="nome" value="${mercadoria.nome }" required>
		<br/><br/>
		<label>Quantidade:</label>
		<input type="text" name="quantidade" value="${mercadoria.quantidade }" required>
		<br/><br/>
		<label>Preço:</label>
		<input type="number" name="preco" value="${mercadoria.preco }" required>
		<br/><br/>
		<label>Tipo:</label>
		<input type="text" name="tipo" value="${mercadoria.tipo }" required>
		<br/><br/>
		<label for="tipoNegocio" >Tipo de Negocio:</label>
		<select id="tipoNegocio" name="tipoNegocio">
		  <c:forEach items="${tiponeg }" var="tn">
			<option
				<c:if test="${mercadoria.tipoNegocio.equals(tn) }">selected</c:if> value="${tn}">${tn.toString() }
			</option>		
		  </c:forEach>
		</select>
		<br/><br/>
	
		<form:errors path="mercadoria.nome" cssStyle="color:red"/>
		<input type="submit" value="Salvar">
		<form action="acessar" method="post">
			<input id="hm" type="submit" value="Home">
		</form>
		</fieldset>
	</form>
	<c:import url="/WEB-INF/views/template/rodape.jsp" />
</body>
</html>