module Inversor
    
    def invertirLista(lista)
        listaTemp = Exam::List.new
        lista.map { |elemento| listaTemp.push(elemento) }
        return listaTemp
    end

    def invertirExamen(examen)
        examen.establecerPreguntas (invertirLista (examen.obtenerPreguntas))
        examen.establecerSoluciones (invertirLista (examen.obtenerSoluciones))
        return examen
    end        

end

class Exam::UI; include Inversor; end
