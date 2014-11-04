# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

# create a Struct with :value and :next
Node = Struct.new(:value, :next)

module Exam
  class List
    attr_reader :cabeza

    def initialize
      @cabeza = nil
    end

    def push(*valor)
      for i in 0...valor.length
        nuevoNode = Node.new(valor[i], nil)
        nuevoNode.next = @cabeza
        @cabeza = nuevoNode
      end
    end


    def pop
      @cabeza = @cabeza.next
    end

  end
end

