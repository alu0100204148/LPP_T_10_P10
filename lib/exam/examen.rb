# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

module Exam
  
  #Clase que representa un examen compiesto de una lista de preguntas
  #y una lista de soluciones y los metodos para acceder a ellas.
  class ExamenCompleto
    
    #La lista donde se alamacenan las preguntas del examen.
    attr_reader :lista_preguntas
    #La lista donde se almacenan las soluciones del examen.
    attr_reader :lista_soluciones
    
    #Se crea una instancia de la clase con dos listas como atributos.
    def initialize (preguntas, soluciones)
      @lista_preguntas = preguntas
      @lista_soluciones = soluciones
    end

    #Devuelve la lista de preguntas del examen.
    def obtenerPreguntas
      return @lista_preguntas
    end
    
    #Cambia la lista de preguntas por otra proporcionada.
    def establecerPreguntas(preguntas)
      @lista_preguntas = preguntas
    end
    
    #Devuelve la lista de soluciones del examen.
    def obtenerSoluciones
      return @lista_soluciones
    end
    
    #Cambia la lista de soluciones por otra proporcionada.
    def establecerSoluciones(soluciones)
      @lista_soluciones = soluciones
    end
    
    #Devuelve una pregunta situada en la posicion 'numero' de la
    #lista de preguntas.
    def obtenerPregunta(numero)
      return @lista_preguntas.obtenerValor(numero).mostrar
    end
    
  end
end