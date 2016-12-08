package br.mo.dao;

import java.util.List;
import br.mo.modelo.Mercadoria;
import br.mo.modelo.TipoNegocio;

public interface MercadoriaDAO {
	
	public void inserir(Mercadoria m);
	public void alterar(Mercadoria m);
	public void excluir(Long id);
	public List<Mercadoria> buscarTodos();
	public Mercadoria buscarId(Long id);
	public List<Mercadoria> buscar_codigo(Long id);
	public List<Mercadoria> buscar_nome(String nome);
	public List<Mercadoria> buscarComprasVendas(Enum<TipoNegocio> tipoNegocio);
}
