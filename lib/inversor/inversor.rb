module Inversor
    
    def invertirLista(lista)
        @listaTemp = Exam::List.new
        while lista.numeroNodos != 0 do
            @valor = lista.sacarValor
            @listaTemp.push(@valor)
        end
       return @listaTemp; 
    end
    
    def invertirExamen(examen)
        @preguntas = examen.obtenerPreguntas
        @soluciones = examen.obtenerSoluciones
        
        @preguntas = invertirLista(@preguntas)
        @soluciones = invertirLista(@soluciones)
        
        examen.establecerPreguntas(@preguntas)
        examen.establecerSoluciones(@soluciones)
        return examen
    end        

end
