package br.mo.controller;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import br.mo.dao.MercadoriaDAO;
import br.mo.modelo.Mercadoria;
import br.mo.modelo.TipoNegocio;


@Transactional
@Controller
public class MercadoriaController {
	
	@Autowired
	@Qualifier("mercadoriaJPA")
	private MercadoriaDAO mdao;
	
	@RequestMapping("/cadastrar_mercadoria")
	public String form(Model model) {
		model.addAttribute("tiponeg", TipoNegocio.values());
		return "mercadoria/cadastrar_mercadoria";
	}

	@RequestMapping("/AddMercadoria")
	public String addMercadoria(Mercadoria m){
		if (m.getCodigo() == null) {
			mdao.inserir(m);
		} else {
			mdao.alterar(m);
		}
		return "mercadoria/sucesso";
	}
	
	@RequestMapping("/remove_mercadoria")
	public String excluir(Long id) {
		mdao.excluir(id);
		return "forward:lista_administrador";
	}

	@RequestMapping("/alterar_mercadoria")
	public String alterarMercadoria(Long id, Model model) {
		Mercadoria m = mdao.buscarId(id);		
		model.addAttribute("mercadoria", m);
		model.addAttribute("tiponeg", TipoNegocio.values());	
		return "mercadoria/formulario";
	}
	
	@RequestMapping("/listar_mercadoria")
	public String listar_mercadoria(Model model) {
		List<Mercadoria> lista_mer = mdao.buscarTodos();
		model.addAttribute("mercadoria", lista_mer);

		return "mercadoria/listar_mercadoria";
	}
	
	@RequestMapping("/listar_compras")
	public String listar_compras(Model model) {
		List<Mercadoria> lista_mer = mdao.buscarComprasVendas(TipoNegocio.COMPRA);
		model.addAttribute("mercadoria", lista_mer);

		return "mercadoria/listar_compras";
	}
	
	@RequestMapping("/listar_vendas")
	public String listar_vendas(Model model) {
		List<Mercadoria> lista_mer = mdao.buscarComprasVendas(TipoNegocio.VENDA);
		model.addAttribute("mercadoria", lista_mer);

		return "mercadoria/listar_vendas";
	}

	@RequestMapping("busca_codigo")
	public String busca_codigo(Model model, Long codigo) {
		List<Mercadoria> lista_id = mdao.buscar_codigo(codigo);
		model.addAttribute("mercadoria", lista_id);
		return "mercadoria/listar_mercadoria";
	}

	@RequestMapping("busca_descricao")
	public String buscar_nome(Model model, String nome) {
		List<Mercadoria> lista_m = mdao.buscar_nome(nome);
		model.addAttribute("mercadoria", lista_m);
		return "mercadoria/listar_mercadoria";
	}

}
