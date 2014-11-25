module Inversor
    
    def invertirLista(lista)
        listaTemp = Exam::List.new
        lista.map { |elemento| listaTemp.push(elemento) }
        return listaTemp
    end

    def invertirExamen(examen)
        preguntas = examen.obtenerPreguntas
        soluciones = examen.obtenerSoluciones
        
        preguntas = invertirLista(preguntas)
        soluciones = invertirLista(soluciones)
        
        examen.establecerPreguntas(preguntas)
        examen.establecerSoluciones(soluciones)
        return examen
    end        

end

class Exam::UI; include Inversor; end
