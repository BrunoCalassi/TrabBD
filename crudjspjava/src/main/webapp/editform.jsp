<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Produto</title>
</head>
<body>
	<%@ page import="com.crudjspjava.bean.Produto, com.crudjspjava.dao.ProdutoDAO"%>

		<%
		String id = request.getParameter("id");
		Produto produto = ProdutoDAO.getRegistroById(Integer.parseInt(id));
		%>
			
		<h1>Edição do Produto</h1>
		
		<form action="editproduto.jsp" method="post">
			<input type="hidden" name="id" value="<%=produto.getId()%>"/>
			<table>
				<tr>
					<td>Nome: </td>
					<td><input type="text" name="nome" value="<%=produto.getNome()%>"/> </td>
				</tr>
				<tr>
					<td>Preco: </td>
					<td><input type="number" name="preco" value="<%=produto.getPreco()%>"/> </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Update"></input></td>
				</tr>	
			</table>
		</form>
</body>
</html>