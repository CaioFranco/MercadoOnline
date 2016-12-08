package br.mo.modelo;

public enum TipoNegocio {
	
	COMPRA("Compra"),VENDA("Venda");
	
	private String descricao;
	
	private TipoNegocio(String descricao) {
		this.descricao = descricao;
	}

	public String toString() {
		return this.descricao;
	}

}
