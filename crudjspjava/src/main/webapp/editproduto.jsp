<%@ page import="com.crudjspjava.dao.ProdutoDAO"%>
<jsp:useBean id="p" class="com.crudjspjava.bean.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="p" />>

<%
int i = ProdutoDAO.updateProduto(p);
response.sendRedirect("viewprodutos.jsp");
%>