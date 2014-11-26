# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

# create a Struct with :value and :next
Node = Struct.new(:value, :next, :previous)

module Exam
  #Clase para representar listas enlazadas, ya sean de preguntas o de respuestas. 
  class List
    include Enumerable
    
    #El ultimo elemento que se ha añadido a la lista, que queda en cabeza.
    attr_reader :cabeza
    #El primer elemento añadido a la lista, que queda el ultimo.
    attr_reader :cola
    #El numero de elementos que hay en una lista.
    attr_reader :numeroNodos

    #Establece la cabeza y la cola de la lista como elementos vacios e inicializa el
    #numero de elementos a cero.
    def initialize
      @cabeza = nil
      @cola = nil
      @numeroNodos = 0
    end

    #Recibe una informacion, la almacena en un nodo e introduce ese nodo en 
    #la cabeza de la lista.
    def push(*valor)
      for i in 0...valor.length
        nuevoNode = Node.new(valor[i], @nil, nil)
        if @numeroNodos == 0 then
          @cabeza = nuevoNode
          @cola = nuevoNode
        else
          @cabeza.previous = nuevoNode
          nuevoNode.next = @cabeza
          @cabeza = nuevoNode       
        end
        @numeroNodos = @numeroNodos + 1
      end
    end

    #Elimina el que este en la cabeza de la lista.
    def pop
      if @numeroNodos == 1 then
        @cabeza = nil
        @cola = nil
      else
        @cabeza = @cabeza.next
      end
      @numeroNodos = @numeroNodos - 1
    end
    
    #Devuelve el valor que este en la cabeza de la lista
    def sacarValor
      @valor = @cabeza.value
      if @numeroNodos == 1 then
        @cabeza = nil
        @cola = nil
      else
        @cabeza = @cabeza.next
      end
      @numeroNodos = @numeroNodos - 1
      return @valor
    end
    
    #Muestra la lista empezando desde la cabeza
    def verDesdeCabeza 
      salida = ""
      nodo = @cabeza
      while nodo != nil do
        salida = salida + nodo.value.to_s + " "
        nodo = nodo.next
      end
      return salida
    end
      
    #Muestra la lista empezando por la cola
    def verDesdeCola 
      salida = ""
      nodo = @cola
      while nodo != nil do
        salida = salida + nodo.value.to_s + " "
        nodo = nodo.previous
      end
      return salida
    end

    #Devuelve el valor de un nodo situado en la posicion indicada por numero.
    def obtenerValor(numero)
      valor = ""
      i = 0
      nodo = @cabeza
      while i < numero do
        i = i + 1
        valor = nodo.value
        nodo = nodo.next
      end
      return valor
    end



    #Metodo necesario para poder utilizar el mixin Enumerable
    def each
      nodo = @cabeza
      while nodo != nil do
        yield nodo.value
        nodo = nodo.next
      end
    end


  end
end

