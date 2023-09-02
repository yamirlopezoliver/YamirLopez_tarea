package com.empresa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Jugador;
import com.empresa.service.JugadorService;

@Controller
public class JugadorController {
	
	//@Autowired esto es muy importante
	@Autowired
	private JugadorService service;
	
	//@GetMapping
	@GetMapping(value = "/verJugador" )
	public String verJugador() {return "registraJugador";}
	
	//22
	@PostMapping("/registraJugador")
	@ResponseBody
	
	public Map<?, ?> registra(Jugador obj){
		HashMap<String, String> map = new HashMap<String, String>();
		Jugador objSalida = service.insertaJugador(obj);

		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitosisimo");
		}
		return map;
	}
}
