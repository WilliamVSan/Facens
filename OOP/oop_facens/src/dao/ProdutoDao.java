package dao;

import entity.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProdutoDao {
    public class UsuarioDAO {
        public void inserir(Produto produto) {
            String sql = "insert into produto(nome, quantidade, valorProduto) values (?,?,?)";


            try (Connection conn = ConnectionFactory.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {


                stmt.setString(1, produto.getNome());
                stmt.setDouble(2, produto.getValorProduto());
                stmt.setInt(3, produto.getQuantidade());
                stmt.executeUpdate();


            } catch (SQLException ex) {
                System.out.println("Erro ao inserir usuário: " + ex.getMessage());
            }
        }
    }

    public void editar(Produto produto) {
        String sql = "update produto set nome = ?, quantidade = ?, valorProduto = ? where id_produto = ?";


        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, produto.getNome());
            stmt.setDouble(2, produto.getValorProduto());
            stmt.setInt(3, produto.getQuantidade());
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao editar usuário: " + ex.getMessage());
        }
    }

    public void excluir(int id_produto) {
        String sql = "delete from produto where id_produto = ?";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id_produto);
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir produto: " + ex.getMessage());
        }
    }

    public Produto getProdutoById(int id) {
        String sql = "SELECT * FROM produto WHERE id_produto = ?";
        Produto produto = null;

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String nome = rs.getString("nome");
                    int quantidade = rs.getInt("quantidade");
                    Double valorProduto = rs.getDouble("valorProduto");
                    int id_produto = rs.getInt("id_produto");

                    produto = new Produto(id_produto, nome, quantidade, valorProduto);
                }
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto por ID: " + ex.getMessage());
        }

        return produto;
    }

    public ArrayList<Produto> getAllProdutos() {
        String sql = "SELECT * FROM produto";
        ArrayList<Produto> produtos = new ArrayList<>();

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {


            while (rs.next()) {
                String nome = rs.getString("nome");
                int quantidade = rs.getInt("quantidade");
                Double valorProduto = rs.getDouble("valorProduto");
                int id_produto = rs.getInt("id_produto");


                Produto produto = new Produto(id_produto, nome, quantidade, valorProduto);
                produtos.add(produto);
            }


        } catch (SQLException ex) {
            System.out.println("Erro ao buscar Todos usuário: " + ex.getMessage());
        }

        return produtos;
    }

}
