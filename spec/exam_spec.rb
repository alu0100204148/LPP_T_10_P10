# -*- coding: utf-8 -*-
require './lib/exam.rb'

describe Exam::Examen do
  before :each do
    @examen = Exam::Examen.new("¿De que color es el caballo blanco de santiago?" , [ 'a) Rojo', 'b) Blanco', 'c) Azul' ])
  end

  describe "# Existencia de pregunta" do
    it "Existe una pregunta" do
      expect(@examen.pregunta).not_to be_empty
      
    end
  end

  describe "# Existencia de respuestas" do
    it "Existe mas de una respuesta" do
      expect(@examen.numero).to be > 1
    end
  end

  describe "# Obtener pregunta" do
    it "Se obtiene una pregunta" do
      expect(@examen.pregunta).to match(/¿*^?/)
      
    end
  end

  describe "# Obtener respuestas" do
    it "Se obtienen las respuestas" do
      expect(@examen.obtenerRespuestas(0)).to match(/a\) /)
      expect(@examen.obtenerRespuestas(1)).to match(/b\) /)
      expect(@examen.obtenerRespuestas(2)).to match(/c\) /)
    end
  end

  describe "# Mostrar resultado" do
    it "Se muestra una pregunta seguida de sus respuestas" do
      expect(@examen.mostrar).to match(/\?*\?*a\)*b\)*c*\)*/) 
    end
  end

end