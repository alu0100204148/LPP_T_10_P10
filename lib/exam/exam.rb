# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'exam/version'

module Exam
  #Esta clase representa cada par pregunta-respuestas
  #y contiene metodos para obtener esos datos y ademas
  #poder poder hacer comparaciones entre objetos de la clase.
  class Examen
    include Comparable
    
    #Almacena un texto con la pregunta de examen.
    attr_reader :pregunta
    # Un array con el texto de las respuestas a una pregunta. 
    attr_reader :respuestas
    
    #Almacena los atributos de la clase, una pregunta y su lista de respuestas.
    def initialize (pregunta, respuestas)
      @pregunta = pregunta
      @respuestas = respuestas
    end

    #Devuelve el numero de respuestas que hay en la lista.
    def numero
       return @respuestas.count
    end
    
    #Devuelve la respuesta que se encuentra en la posicion de la lista indicada por i. 
    def obtenerRespuestas(i)
      @respuesta = @respuestas[i]
    end

    #Devuelve un texto con la pregunta seguida de sus respuestas.
    def mostrar
      @salida =  @pregunta + "\n"
      @respuestas.each do |resp|
        @salida = @salida + resp + "\n"
      end
      return @salida
    end
    
    #Sobrecarga de los operadores de comparacion. Se determina que al comparar dos
    #objetos, lo que se compara es el tamaño de sus preguntas.
    def <=>(objetoExamen)
      pregunta.size <=> objetoExamen.pregunta.size
    end
    
    #Sobrecarga del operador de igualdad. Se determina que dos objetos son iguales 
    #si su pregunta y respuestas coinciden.
    def == (objetoExamen)
      if @pregunta == objetoExamen.pregunta && @respuestas == objetoExamen.respuestas then
        return true
      else
        return false
      end
    end
    

  end
  
  
  #Esta clase representa a las preguntas de respuesta cierto o falso. Es una clase hija
  #de la clase examen.
  class Preguntas < Examen
    
    #Se almacena la pregunta recibida, y tambien se crea la lista de respuestas con
    #las posibilidades cierto o falso.
    def initialize (pregunta)
      @pregunta = pregunta
      @respuestas = ["a) Cierto", "b) Falso"]
    end
    
  end
  
end