package com.mvit.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.mvit.controller.user.Usuario;

@Controller
public class FormularioController {
	private static final Logger logger = LoggerFactory.getLogger(SpringController.class);	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String viewRegistration(Map<String, Object> model) {
		logger.info("Dentro de /register");
		Usuario userForm = new Usuario();    
		model.put("userForm", userForm);

		List<String> asignacionList = new ArrayList<String>();
		asignacionList.add("Developer");
		asignacionList.add("Designer");
		asignacionList.add("IT Manager");
		asignacionList.add("Tester");
		model.put("asignacionList", asignacionList);

		return "Registro";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("userForm") Usuario usuario,
			Map<String, Object> model) {

		// Aqui se puede generar el código de algun proceso, cálculo, JPA, ORM

		// prueba
		System.out.println("username: " + usuario.getUsuario());
		System.out.println("password: " + usuario.getPassword());
		System.out.println("email: " + usuario.getEmail());
		System.out.println("fecha de nacimiento: " + usuario.getFechaNacimiento());
		System.out.println("asignación: " + usuario.getAsignacion());

		return "RegistroCompleto";
	}
	
}

