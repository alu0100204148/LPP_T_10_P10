#Modulo que contiene las funciones que se ocupan de invertir listas de un examen.
module Inversor
    
    #Funcion que recibe una lista (de preguntas o respuestas) y devuelve otra con
    #los elementos ordenados de manera inversa.
    def invertirLista(lista)
        listaTemp = Exam::List.new
        lista.map { |elemento| listaTemp.push(elemento) }
        return listaTemp
    end

    #Funcion que recibe un examen y llama a la funcion invertirLista tanto para las
    #preguntas como para las respuestas del examen recibido.
    def invertirExamen(examen)
        examen.establecerPreguntas (invertirLista (examen.obtenerPreguntas))
        examen.establecerSoluciones (invertirLista (examen.obtenerSoluciones))
        return examen
    end        

end

#Se incluye el modulo Inversor en la clase UI
class Exam::UI; include Inversor; end
