require "./lib/exam.rb"

describe Exam::Examen do
 # exam = Exam::Examen.new
  before :each do
    @ex = Exam::Examen.new

  end

  describe "# existencia de pregunta" do
    it "Existe una pregunta" do
      expect(@ex.preguntas.length).to be >= 1
    end
  end

  describe "# existencia de respuestas" do
    it "Existe mas de una respuesta" do
      expect(@ex.respuestas.length).to be >= 2
    end
  end

  describe "# obtener pregunta" do
    it "Se obtiene una pregunta" do
      @ex.obtenerPregunta
    end
  end

  describe "# obtener respuestas" do
    it "Se obtienen las respuestas" do
      @ex.obtenerRespuestas
    end
  end

  describe "# mostrar resultado" do
    it "Se muestra una pregunta seguida de sus respuestas" do
      @ex.obtenerPregunta
      @ex.obtenerRespuestas
      @ex.mostrar
    end
  end

end
