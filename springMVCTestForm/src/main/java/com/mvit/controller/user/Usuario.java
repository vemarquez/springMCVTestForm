package com.mvit.controller.user;


import java.util.Date;

public class Usuario {
	private String usuario;
	private String password;
	private String email;
	private Date fechaNacimiento;
	private String asignacion;
	
	// setters y getters
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public String getAsignacion() {
		return asignacion;
	}
	public void setAsignacion(String asignacion) {
		this.asignacion = asignacion;
	}
}
