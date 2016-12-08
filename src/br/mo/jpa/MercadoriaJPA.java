package br.mo.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.stereotype.Repository;
import br.mo.dao.MercadoriaDAO;
import br.mo.modelo.Mercadoria;
import br.mo.modelo.TipoNegocio;

@Repository
public class MercadoriaJPA implements MercadoriaDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	@Override
	public void inserir(Mercadoria m) {
		manager.persist(m);
	}

	@Override
	public void alterar(Mercadoria m) {
		manager.merge(m);
	}

	@Override
	public void excluir(Long id) {
		Mercadoria m = buscarId(id);
		manager.remove(m);
	}

	@Override
	public List<Mercadoria> buscarTodos() {
		TypedQuery<Mercadoria> query = manager.createQuery(
				"SELECT m FROM Mercadoria m", Mercadoria.class);
		return query.getResultList();
	}

	@Override
	public Mercadoria buscarId(Long id) {
		return manager.find(Mercadoria.class, id);
	}
	
	public List<Mercadoria> buscar_codigo(Long id){
		Mercadoria m = buscarId(id);
		TypedQuery<Mercadoria> query = manager.createQuery("SELECT m FROM Mercadoria m WHERE m = :m",Mercadoria.class);
		query.setParameter("m", m);
		return query.getResultList();
	}
	
	public List<Mercadoria> buscar_nome(String nome) {
		TypedQuery<Mercadoria> query = manager
				.createQuery(
						"SELECT m FROM Mercadoria m WHERE m.nome LIKE UPPER(:nome)",
						Mercadoria.class);
		query.setParameter("nome", "%" + nome.toUpperCase() + "%");
		return query.getResultList();
	}
	
	public List<Mercadoria> buscarComprasVendas(Enum<TipoNegocio> tipoNegocio){
		List<Mercadoria> lista = new ArrayList<>();
		for (Mercadoria mercadoria : buscarTodos()) {
				if (mercadoria.getTipoNegocio().equals(tipoNegocio))
					lista.add(mercadoria);
				
		}
		return lista.isEmpty()?null:lista;
	}
		
}


