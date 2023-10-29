package entity;

public class Produto {
    private int IdProduto;
    private String Nome;
    private int Quantidade;
    private Double ValorProduto;

    public Produto() {}

    public Produto(int idProduto, String nome, int quantidade, Double valorProduto) {
        IdProduto = idProduto;
        Nome = nome;
        Quantidade = quantidade;
        ValorProduto = valorProduto;
    }

    public int getIdProduto() {
        return IdProduto;
    }

    public void setIdProduto(int idProduto) {
        IdProduto = idProduto;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String nome) {
        Nome = nome;
    }

    public int getQuantidade() {
        return Quantidade;
    }

    public void setQuantidade(int quantidade) {
        Quantidade = quantidade;
    }

    public Double getValorProduto() {
        return ValorProduto;
    }

    public void setValorProduto(Double valorProduto) {
        ValorProduto = valorProduto;
    }
}
