# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

module Exam
  class UI
    attr_reader :contenido, :aciertos, :nota
    
    
    def initialize (examen)
      @contenido = examen
      @aciertos = 0
      @nota = -1
      @numeroPreguntas = examen.lista_preguntas.count
    end
    
    
    def mostrarPregunta(numero)
      print "Pregunta"
      puts numero
      return @contenido.obtenerPregunta(numero)
    end
    
  end
end