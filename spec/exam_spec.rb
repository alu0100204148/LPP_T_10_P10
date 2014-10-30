# -*- coding: utf-8 -*-
require './lib/exam.rb'
require './lib/list.rb'

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

#------------------------------------------------------------------------------

describe Exam::List do
  before :each do
    @lista = Exam::List.new
  end

  describe "# Debe existir un Nodo de la lista con sus datos y su siguiente List" do
    it "Se comprueba que el valor de la cabeza es 1, se le enlaza el nodo y se comprueba que vale 2" do
      @lista.push(1)
      expect(@lista.cabeza.value).to eq(1)
      expect(@lista.cabeza.next).to be_nil
    end
  end

  describe "# Se extrae el primer elemento de la lista" do
    it "Extraer Nodo de cabeza de lista y comprobar que la cabeza vale nil" do
      @lista.push(1)
      expect(@lista.cabeza.value).to eq(1)
      @lista.pop
      expect(@lista.cabeza).to be_nil
    end
  end

  describe "# Se puede insertar un elemento" do
    it "Se inserta un Nodo y se comprueba que vale 2" do
      expect(@lista.cabeza).to be_nil
      @lista.push(2)
      expect(@lista.cabeza.value).to eq(2)
    end
  end

  describe "# Se pueden insertar varios elementos" do
    it "Se insertan varios nodos y se comprueban sus valores" do
      @lista.push(2,3,4)
      expect(@lista.cabeza.value).to eq(4)
      expect(@lista.cabeza.next.value).to eq(3)
      expect(@lista.cabeza.next.next.value).to eq(2)
    end
  end

  describe "# Debe existir una lista con su cabeza" do
    it "se muestra la cabeza y sus enlaces" do
      expect(@lista.cabeza).to be_nil
    end
  end

end

#------------------------------------------------------------------------------

describe Exam::Examen do
  before :each do
    @pregunta1 = Exam::Examen.new("¿Cual es la salida del siguiente codigo Ruby?/tclass Xyz/tdef pots/t@nice/tend/tend/txyz = Xyz.new/tp xyz.pots/t" , [ 'a) #<Xyz:0xa000208>', 'b) nil', 'c) 0', 'd) Ninguna de las anteriores' ])
    @pregunta2 = Exam::Examen.new("La siguiente definicion de un hash en Ruby es valida:/thash_raro = {/t[1, 2, 3] => Object.new(),/tHash.new => :toto/t}/t" , [ 'a) Cierto', 'b) Falso'])
    @pregunta3 = Exam::Examen.new('¿Cual es la salida del siguiente codigo Ruby?/tclass Array/tdef say_hi/t"HEY!"/t  end/t end/t /t p [1, "bob"].say_hi/t' , [ 'a) 1', 'b) bob', 'c) hey!' ,'d) Ninguna de las anteriores'])
    @pregunta4 = Exam::Examen.new("¿Cual es el tipo del objeto en el siguiente codigo Ruby?/tclass Objeto/tend/t" , [ 'a) Una instancia de la clase Class', 'b) Una constante', 'c) Un objeto' , 'd) Ninguna de las anteriores'])
    @pregunta5 = Exam::Examen.new("Es apropiado que una clase Tablero herede de una clase Juego./t" , [ 'a) Cierto', 'b) Falso'])

    @lista_preguntas = Exam::List.new
    @lista_preguntas.push(@pregunta5,@pregunta4,@pregunta3,@pregunta2,@pregunta1)
  end


  it "La pregunta1 y sus respuestas deben coincidir" do
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("¿Cual es la salida del siguiente codigo Ruby?/tclass Xyz/tdef pots/t@nice/tend/tend/txyz = Xyz.new/tp xyz.pots/t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) #<Xyz:0xa000208>')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) nil')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(2)).to eq('c) 0')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(3)).to eq('d) Ninguna de las anteriores')
  end

  it "La pregunta2 y sus respuestas deben coincidir" do
    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("La siguiente definicion de un hash en Ruby es valida:/thash_raro = {/t[1, 2, 3] => Object.new(),/tHash.new => :toto/t}/t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) Cierto')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) Falso')
  end

  it "La pregunta3 y sus respuestas deben coincidir" do
    @lista_preguntas.pop
    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq('¿Cual es la salida del siguiente codigo Ruby?/tclass Array/tdef say_hi/t"HEY!"/t  end/t end/t /t p [1, "bob"].say_hi/t')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) 1')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) bob')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(2)).to eq('c) hey!')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(3)).to eq('d) Ninguna de las anteriores')
  end

  it "La pregunta4 y sus respuestas deben coincidir" do
    @lista_preguntas.pop
    @lista_preguntas.pop
    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("¿Cual es el tipo del objeto en el siguiente codigo Ruby?/tclass Objeto/tend/t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) Una instancia de la clase Class')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) Una constante')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(2)).to eq('c) Un objeto')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(3)).to eq('d) Ninguna de las anteriores')
  end

  it "La pregunta5 y sus respuestas deben coincidir" do
    @lista_preguntas.pop
    @lista_preguntas.pop
    @lista_preguntas.pop
    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("Es apropiado que una clase Tablero herede de una clase Juego./t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) Cierto')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) Falso')
  end

end
