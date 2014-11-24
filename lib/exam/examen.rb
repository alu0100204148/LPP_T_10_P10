# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

module Exam
  class ExamenCompleto
    attr_reader :lista_preguntas, :lista_soluciones
    
    def initialize (preguntas, soluciones)
      @lista_preguntas = preguntas
      @lista_soluciones = soluciones
    end

    def obtenerPreguntas
      return @lista_preguntas
    end
    
    def establecerPreguntas(preguntas)
      @lista_preguntas = preguntas
    end
    
    def obtenerSoluciones
      return @lista_soluciones
    end
    
    def establecerSoluciones(soluciones)
      @lista_soluciones = soluciones
    end
    
    def obtenerPregunta(numero)
      return @lista_preguntas.obtenerValor(numero).mostrar
    end
    
  end
end