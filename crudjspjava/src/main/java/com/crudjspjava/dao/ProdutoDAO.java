package com.crudjspjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudjspjava.bean.Produto;

public class ProdutoDAO {
	public static Connection getConnection() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjspjava", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static Produto getRegistroById(int id) {

		Produto produto = null;

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM produto WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getInt("preco"));
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return produto;

	}
	public static int updateProduto(Produto p) {
		int status = 0;

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE produto SET nome=?, preco=? WHERE id=?");

			ps.setString(1, p.getNome());
			ps.setInt(2, p.getPreco());
			ps.setInt(3, p.getId());

			status = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static List<Produto> getAllProdutos() {
		List<Produto> list = new ArrayList<Produto>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM produto");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Produto produto = new Produto();

				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getInt("preco"));

				list.add(produto);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}
}
