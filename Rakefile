require "bundler/gem_tasks"
require 'rdoc/task'

desc "Run RSpec code examples"
task :spec do
  sh "bundle exec rspec spec/exam_spec.rb"
end

task :guard do
  sh "bundle exec guard"
end

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("Readme.md", "lib/**/*.rb")
end
  
task :default => :spec
