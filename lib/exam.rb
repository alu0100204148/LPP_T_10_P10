# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'exam/version'

module Exam
  class Examen
    attr_reader :pregunta, :respuestas
    def initialize(pregunta, respuestas)
      @pregunta = pregunta
      @respuestas = respuestas
    end

    def numero
       return @respuestas.count
    end

    def obtenerRespuestas(i)
        @respuesta = @respuestas[i]
    end

    def mostrar
      @salida =  @pregunta + "\n"
      @respuestas.each do |resp|
        @salida = @salida + resp + "\n"
      end
      return @salida
    end

  end
end