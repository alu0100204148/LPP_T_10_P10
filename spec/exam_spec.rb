# -*- coding: utf-8 -*-
require 'spec_helper'
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

#-------------------------------------------------------------------------------

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



#-------------------------------------------------------------------------------------------------------
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

  it "La preguntas y sus respuestas deben coincidir" do
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("¿Cual es la salida del siguiente codigo Ruby?/tclass Xyz/tdef pots/t@nice/tend/tend/txyz = Xyz.new/tp xyz.pots/t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) #<Xyz:0xa000208>')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) nil')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(2)).to eq('c) 0')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(3)).to eq('d) Ninguna de las anteriores')

    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("La siguiente definicion de un hash en Ruby es valida:/thash_raro = {/t[1, 2, 3] => Object.new(),/tHash.new => :toto/t}/t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) Cierto')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) Falso')

    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq('¿Cual es la salida del siguiente codigo Ruby?/tclass Array/tdef say_hi/t"HEY!"/t  end/t end/t /t p [1, "bob"].say_hi/t')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) 1')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) bob')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(2)).to eq('c) hey!')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(3)).to eq('d) Ninguna de las anteriores')

    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("¿Cual es el tipo del objeto en el siguiente codigo Ruby?/tclass Objeto/tend/t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) Una instancia de la clase Class')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) Una constante')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(2)).to eq('c) Un objeto')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(3)).to eq('d) Ninguna de las anteriores')

    @lista_preguntas.pop
    expect(@lista_preguntas.cabeza.value.pregunta).to eq("Es apropiado que una clase Tablero herede de una clase Juego./t")
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(0)).to eq('a) Cierto')
    expect(@lista_preguntas.cabeza.value.obtenerRespuestas(1)).to eq('b) Falso')
  end
end

#-------------------------------------------------------------------------------------------------------

describe Exam::Examen do
  before :each do
    @lista = Exam::List.new
  end

  it "Se debe poder recorrer la lista empezando desde la cabeza" do
    @lista.push(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    expect(@lista.verDesdeCabeza).to eq('9 8 7 6 5 4 3 2 1 0 ')
  end
  
  it "Se debe poder recorrer la lista empezando desde la cola" do
    @lista.push(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    expect(@lista.verDesdeCola).to eq('0 1 2 3 4 5 6 7 8 9 ')
  end  

  it "La preguntas y sus respuestas deben coincidir" do
    @pregunta1 = Exam::Examen.new("¿Cual es el tipo del objeto en el siguiente c´odigo Ruby? /t class Objeto /t end", [ 'a) Una instancia de la clase Class', 'b) Una constante', 'c) Un objeto', 'd) Ninguna de las anteriores' ])
    @pregunta2 = Exam::Preguntas.new("Es apropiado que una clase Tablero herede de una clase Juego.")
    @lista.push(@pregunta2,@pregunta1)
    
    expect(@lista.cabeza.value.pregunta).to eq("¿Cual es el tipo del objeto en el siguiente c´odigo Ruby? /t class Objeto /t end")
    expect(@lista.cabeza.value.obtenerRespuestas(0)).to eq('a) Una instancia de la clase Class')
    expect(@lista.cabeza.value.obtenerRespuestas(1)).to eq('b) Una constante')
    expect(@lista.cabeza.value.obtenerRespuestas(2)).to eq('c) Un objeto')
    expect(@lista.cabeza.value.obtenerRespuestas(3)).to eq('d) Ninguna de las anteriores')

    @lista.pop
    expect(@lista.cabeza.value.pregunta).to eq("Es apropiado que una clase Tablero herede de una clase Juego.")
    expect(@lista.cabeza.value.obtenerRespuestas(0)).to eq('a) Cierto')
    expect(@lista.cabeza.value.obtenerRespuestas(1)).to eq('b) Falso')
  end
  
  
  it "Es pregunta1 hijo de el objeto examen" do
    @pregunta1 = Exam::Examen.new("¿Cual es el tipo del objeto en el siguiente c´odigo Ruby? /t class Objeto /t end", [ 'a) Una instancia de la clase Class', 'b) Una constante', 'c) Un objeto', 'd) Ninguna de las anteriores' ])
    @pregunta2 = Exam::Preguntas.new("Es apropiado que una clase Tablero herede de una clase Juego.")
    
    expect(@pregunta1).to be_instance_of Exam::Examen       #pregunta1 es instancia de Examen
    expect(@pregunta2).to be_instance_of Exam::Preguntas    #pregunta2 es instancia de Preguntas
    
    expect(@pregunta1).to be_a_kind_of Exam::Examen         #pregunta1 esta en la jeraquia de Examen
    expect(@pregunta1).not_to be_a_kind_of Exam::Preguntas  #pregunta1 no esta en la jerarquia de Examen
    
    expect(@pregunta2).to be_a_kind_of Exam::Examen         #pregunta2 esta en la jerarquia de Examen
    expect(@pregunta2).to be_a_kind_of Exam::Preguntas      #pregunta2 esta en la jerarquia de Preguntas

  end
  
end




#-------------------------------------------------------------------------------------------------------

describe Exam::Examen do
  before :each do
    @pregunta1 = Exam::Preguntas.new("Es apropiado que una clase Tablero herede de una clase Juego.")
    @pregunta2 = Exam::Examen.new("Es apropiado que una clase Tablero herede de una clase Juego.", ["a) Cierto", "b) Falso"])
    @pregunta3 = Exam::Examen.new("¿Cual es el tipo del objeto en el siguiente c´odigo Ruby? /t class Objeto /t end", [ 'a) Una instancia de la clase Class', 'b) Una constante', 'c) Un objeto', 'd) Ninguna de las anteriores' ])

  end
  
  it "Verifica si los objetos son Comparable" do
    expect(@pregunta1).to be_a_kind_of Comparable 
    expect(@pregunta2).to be_a_kind_of Comparable   
    expect(@pregunta3).to be_a_kind_of Comparable
  end
  
  
  it "Verifica si los objetos son iguales" do
    expect(@pregunta1).to eq(@pregunta2)
  end
  
  it "Verifica si los objetos son diferentes" do
    expect(@pregunta1).not_to eq(@pregunta3)
  end
  
    it "Verifica si una pregunta es mayor que otra" do
    expect(@pregunta3).to be > (@pregunta2)
  end
  
    it "Verifica si una pregunta es menor que otra" do
    expect(@pregunta2).to be < (@pregunta3)
  end
  
end
  
#------------------------------  

describe Exam::Examen do
  before :each do
    @pregunta1 = Exam::Examen.new("¿Cual es la salida del siguiente codigo Ruby?/tclass Xyz/tdef pots/t@nice/tend/tend/txyz = Xyz.new/tp xyz.pots/t" , [ 'a) #<Xyz:0xa000208>', 'b) nil', 'c) 0', 'd) Ninguna de las anteriores' ])
    @pregunta2 = Exam::Examen.new("La siguiente definicion de un hash en Ruby es valida:/thash_raro = {/t[1, 2, 3] => Object.new(),/tHash.new => :toto/t}/t" , [ 'a) Cierto', 'b) Falso'])
    @pregunta3 = Exam::Examen.new('¿Cual es la salida del siguiente codigo Ruby?/tclass Array/tdef say_hi/t"HEY!"/t  end/t end/t /t p [1, "bob"].say_hi/t' , [ 'a) 1', 'b) bob', 'c) hey!' ,'d) Ninguna de las anteriores'])
    @pregunta4 = Exam::Examen.new("¿Cual es el tipo del objeto en el siguiente codigo Ruby?/tclass Objeto/tend/t" , [ 'a) Una instancia de la clase Class', 'b) Una constante', 'c) Un objeto' , 'd) Ninguna de las anteriores'])
    @pregunta5 = Exam::Examen.new("Es apropiado que una clase Tablero herede de una clase Juego./t" , [ 'a) Cierto', 'b) Falso'])

    @lista = Exam::List.new
    @lista.push(@pregunta5,@pregunta4,@pregunta3,@pregunta2,@pregunta1)
  end
  

  it "La clase Lista es Enumerable" do
    expect(@lista).to be_a_kind_of Enumerable 
  end
  
  
  it "Cuenta el numero de elementos" do
    expect(@lista.count).to eq(5)
    @lista.pop
    expect(@lista.count).to eq(4)
    @lista.pop
    expect(@lista.count).to eq(3)
  end
  
  it "Se busca el maximo de la lista (la pregunta mas larga)" do
    expect(@lista.max).to eq(@pregunta2)
  end
  
  it "Se busca el minimo de la lista (la pregunta mas corta)" do
    expect(@lista.min).to eq(@pregunta5)
  end
  

end

#------------------------------  

describe Exam::Examen do
  before :each do
    @pregunta1 = Exam::Preguntas.new("Es apropiado que una clase Tablero herede de una clase Juego.")
    @pregunta2 = Exam::Examen.new('¿Cual es la salida del siguiente codigo Ruby?/tclass Array/tdef say_hi/t"HEY!"/t  end/t end/t /t p [1, "bob"].say_hi/t' , [ 'a) 1', 'b) bob', 'c) hey!' ,'d) Ninguna de las anteriores'])

    @solucion1 = 'a'
    @solucion2 = 'd'
    
    @lista_soluciones = Exam::List.new
    @lista_soluciones.push(@solucion1,@solucion2)

    @lista_preguntas = Exam::List.new
    @lista_preguntas.push(@pregunta2,@pregunta1)
    @examen = Exam::ExamenCompleto.new(@lista_preguntas,@lista_soluciones)
  end
  
  it "Un examen contiene una lista de preguntas" do
    expect(@examen.obtenerPreguntas).to eq(@lista_preguntas)
  end
  
  it "Un examen contiene una lista de soluciones" do
    expect(@examen.obtenerSoluciones).to eq(@lista_soluciones)
  end
end

#------------------------------  

describe Exam::Examen do
  before :each do
    @pregunta1 = Exam::Preguntas.new("Es apropiado que una clase Tablero herede de una clase Juego.")
    @pregunta2 = Exam::Examen.new('Cual es la salida del siguiente codigo Ruby?/tclass Array/tdef say_hi/t"HEY!"/t  end/t end/t /t p [1, "bob"].say_hi/t' , [ 'a) 1', 'b) bob', 'c) hey!' ,'d) Ninguna de las anteriores'])

    @solucion1 = 'a'
    @solucion2 = 'd'
    
    @lista_soluciones = Exam::List.new
    @lista_soluciones.push(@solucion2, @solucion1)

    @lista_preguntas = Exam::List.new
    @lista_preguntas.push(@pregunta2, @pregunta1)
    
    @examen = Exam::ExamenCompleto.new(@lista_preguntas, @lista_soluciones)
    
    @ui = Exam::UI.new(@examen)
  end
  
  
  it "Una UI tiene un metodo para mostrar preguntas y posibles respuestas" do
    expect(@ui.mostrarPregunta(1)).to eq(@examen.obtenerPregunta(1))
    expect(@ui.mostrarPregunta(2)).to eq(@examen.obtenerPregunta(2))
  end
  
  it "Una UI tiene un metodo para recibir input del usuario" do
    expect(@ui.input(1)).to eq(true)
  end
  
  it "Una UI compara la respuesta con la solucion" do
    expect(@ui.comparar(2,'d')).to eq(true)
  end
  
  it "Una UI almacena el numero de aciertos" do
    expect(@ui.aciertos).to eq(0)
  end
  
  it "Una UI compara aciertos con numero de preguntas y muestra nota final" do
    expect(@ui.nota).to eq(-1)
  end
  
  it "Una UI tiene un metodo para que un usuario realice un examen" do
    expect(@ui.examinar('a','d')).to eq(10)
  end
  
    it "Una UI tiene un metodo para que un usuario realice un examen" do
    expect(@ui.examinar('b','d')).to eq(5)
  end
  
end


#------------------------------  

describe Exam::Examen do
  before :each do
    @lista_preguntas = Exam::List.new
    @lista_preguntas.push(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)  
    
    @lista_soluciones = Exam::List.new
    @lista_soluciones.push('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j')
    
    @examen = Exam::ExamenCompleto.new(@lista_preguntas, @lista_soluciones)
    
    @ui = Exam::UI.new(@examen)
  end
  
  it "Se da la vuelta y se comprueba desde la cabeza" do
    expect(@ui.contenido.lista_preguntas.verDesdeCola).to eq("0 1 2 3 4 5 6 7 8 9 ")
    expect(@ui.contenido.lista_soluciones.verDesdeCola).to eq("a b c d e f g h i j ")
    @ui.invertir
    expect(@ui.contenido.lista_preguntas.verDesdeCola).to eq("9 8 7 6 5 4 3 2 1 0 ")
    expect(@ui.contenido.lista_soluciones.verDesdeCola).to eq("j i h g f e d c b a ")
  end
  
end