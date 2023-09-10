package com.empresa.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table (name="concurso")

public class Concurso {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int idConcurso;
private String nombre;
private Date fechainicio;
private Date fechafin;
private String estado;


}
