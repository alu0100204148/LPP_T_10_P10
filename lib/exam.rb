# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'exam/version'

module Exam
  class Examen
    attr_reader :preguntas, :respuestas, :n, :pr, :nresp, :re
    def initialize
      @n = 0
      @pr = ""
      @re = Array.new
      @nresp = 4
      pregunta1 = "¿Cual es el resultado de sumar 2 y 5?"
      pregunta2 = "¿De que color es el caballo blanco de Santiago?"
      pregunta3 = "¿Cual es el simbolo de la raiz cuadrada?"
      @preguntas = [pregunta1, pregunta2, pregunta3]
      respuesta11 = "a) 4"
      respuesta12 = "b) 5"
      respuesta13 = "c) 6"
      respuesta14 = "d) Ninguna de las anteriores"
      respuesta21 = "a) Azul"
      respuesta22 = "b) Blanco"
      respuesta23 = "c) Rayas blancas y negras"
      respuesta24 = "d) No se que es un caballo"
      respuesta31 = "a) ^_^"
      respuesta32 = "b) %"
      respuesta33 = "c) &"
      respuesta34 = "d) Ninguno de los anteriores"
      @respuestas = [respuesta11, respuesta12, respuesta13, respuesta14, respuesta21, respuesta22, respuesta23, respuesta24, respuesta31, respuesta32, respuesta33, respuesta34]
    end


    def obtenerPregunta
      @n = rand(@preguntas.length)
      @pr = @preguntas[@n]
    end


    def obtenerRespuestas
      for i in 0..@nresp-1
        @re[i] = @respuestas[(@n*@nresp)+i]
      end
    end


    def mostrar(frase)
      puts frase
    end


    def mostrar
      puts @pr
      @re.each do |resp|
        puts resp
      end
    end

  end
end




