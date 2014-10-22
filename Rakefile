task :default => :spec

desc "Ejecutar las espectativas de la clase Examen"
task :spec do
  sh "rspec -I. spec/examen_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/examen_spec.rb --format documentation"
end

