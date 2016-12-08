package br.mo.controller;

import javax.transaction.Transactional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
public class AcessoController {


	@RequestMapping("acesso/erro01")
	public String erro01() {
		return "acesso/erro01";
	}
	
	
	@RequestMapping("/acessar")
	public String acessar( ) {	
		return "menu_principal";
	}

}
