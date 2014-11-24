# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

# create a Struct with :value and :next
Node = Struct.new(:value, :next, :previous)

module Exam
  class List
    include Enumerable
    attr_reader :cabeza, :cola, :numeroNodos 


    def initialize
      @cabeza = nil
      @cola = nil
      @numeroNodos = 0
    end


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


    def pop
      if @numeroNodos == 1 then
        @cabeza = nil
        @cola = nil
      else
        @cabeza = @cabeza.next
      end
      @numeroNodos = @numeroNodos - 1
    end
    
        
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
    
    
    def verDesdeCabeza #Muestra la lista empezando desde la cabeza
      salida = ""
      nodo = @cabeza
      while nodo != nil do
        salida = salida + nodo.value.to_s + " "
        nodo = nodo.next
      end
      return salida
    end
      

    def verDesdeCola #Muestra la lista empezando por la cola
      salida = ""
      nodo = @cola
      while nodo != nil do
        salida = salida + nodo.value.to_s + " "
        nodo = nodo.previous
      end
      return salida
    end


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




    def each
      nodo = @cabeza
      while nodo != nil do
        yield nodo.value
        nodo = nodo.next
      end
    end


  end
end

