<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista</title>
</head>
<body>
	<%@ page
		import="com.crudjspjava.dao.ProdutoDAO, com.crudjspjava.bean.*, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<%
	List<Produto> list = ProdutoDAO.getAllProdutos();
	request.setAttribute("list", list);
	%>
	<h1> Lista de produtos </h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Preco</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>

		<c:forEach items="${list}" var="produto">
			<tr>
				<td>${produto.getId()}</td>
				<td>${produto.getNome()}</td>
				<td>${produto.getPreco()}</td>
				<td><a href="editform.jsp?id=${produto.getId()}"><button>
							Update</button> </a></td>
				<td><a href="#"><button>
							Delete</button> </a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="addprodutoform.jsp">Adicionar novo produto</a>
</body>
</html>