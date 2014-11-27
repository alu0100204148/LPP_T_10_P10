# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

module Exam
  
  #Clase que representa la interfaz de usuario de un examen. Tiene metodos para mostrar
  #informacion al usuario, para recibir informacion del usuario y para calcular la nota.
  class UI
    
    #Es el examen que se esta realizando, este estara compuesto por sus listas de 
    #preguntas y respuestas.
    attr_reader :contenido
    #El numero de aciertos que se van contabilizando al resolver el examen.
    attr_reader :aciertos
    #La nota final que ha tenido el usuario al realizar el examen.
    attr_reader :nota
    
    #Se establecen los valores de los atributos. El contenido es el examen, no hay ningun
    #acierto y la nota no existe.
    def initialize (examen)
      @contenido = examen
      @aciertos = 0
      @nota = -1
      @numeroPreguntas = examen.lista_preguntas.count
    end
    
    #Devuelve contenido de la pregunta que se encuentra en la posicion 'numero'.
    def mostrarPregunta(numero)
      print "Pregunta"
      puts numero
      return @contenido.obtenerPregunta(numero)
    end
    
    #Metodo con el que el usuario introduce su respuesta. Recibe el numero de la pregunta
    #y la respuesta elegida. Si no se recibe una respuesta, se espera que se introduzca
    #en la consola. Despues se llama al metodo 'comparar' con la posicion de la pregunta y la respuesta recibidas.
    def input(numeroPregunta, resp=0)
      puts ""
      print "Respuesta: "
      STDOUT.flush
      if resp == 0 then
        respuesta = gets.chomp
      else
        respuesta = resp
        puts respuesta
      end
      puts ""
      puts ""
      puts ""
      puts ""
      comparar(numeroPregunta, respuesta)
      return true
    end
    
    #Recibe una posicion de pregunta y una respuesta y compara si la respuesta es la misma que la
    #que corresponde a esa posicion. Si es la misma, se suma un acierto.
    def comparar(numeroPregunta, respuesta)
      if respuesta == @contenido.lista_soluciones.obtenerValor(numeroPregunta) then
        @aciertos = @aciertos + 1
        return true
      end
    end

    #Calcula y muestra la nota final obtenida por el usuario.
    def notaFinal
      print "Aciertos: "
      print @aciertos
      print " / "
      puts @numeroPreguntas
      print "Su nota ha sido: "
      @nota = ((@aciertos * 10) / @numeroPreguntas)
      print @nota
      return @nota
    end
    
    #Muestra la cabecera del examen con las instrucciones para el usuario.
    def cabecera
      puts ""
      puts ""
      puts "El examen va a comenzar."
      puts "  Debe responder poniendo solo el caracter de la respuesta elegida."
      print " El examen consta de "
      print @numeroPreguntas
      puts " preguntas."
    end
    
    #Metodo que se encarga de organizar la ejecucion del examen. Llama al resto de metodos de la clase 
    #cuando es necesario
    def examinar(*resp)
      cabecera
      for i in 1..@numeroPreguntas
        puts mostrarPregunta(i)
        input(i,resp[i-1])
      end
      return notaFinal
    end
    
    #Metodo para invertir las preguntas del examen. Se llama al metodo invertirExamen que se encuentra
    #en el modulo Inversor.
    def invertir
      @contenido = invertirExamen(@contenido)
    end    
    
    
  end
end