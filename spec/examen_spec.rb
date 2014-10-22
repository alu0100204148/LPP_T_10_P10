require "./lib/examen.rb"

describe Examen do
  before :each do
    @examen = Examen.new()
  end    
    
  describe "# existencia de almenos una pregunta" do
    it "Si existe almenos una pregunta " do
      @examen.numeroPreguntas.should be > 1
    end
  end
  
  describe "# Existencia de opciones de respuesta" do
    it " Si existen opciones de respuesta" do
      @examen.existeRespuesta(1).should be true
    end
  end
  
  describe "# Obtener pregunta numero 1" do
    it " Obtenemos la pregunta" do
      @examen.pregunta(1).should exist 
    end
  end
  
  describe "# Obtener opciones de respuesta de la pregunta 1" do
    it " Obtencion de las opciones de respuesta de la pregunta 1" do
	@examen.respuestas(1).should exist
    end
  end



  describe "# Obtenemos una pregunta completa" do
    it " Obtencion de pregunta y respuesta" do
	@examen.cuestion(1).should exist
    end
  end

end