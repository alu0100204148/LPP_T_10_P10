require "bundler/gem_tasks"

desc "Run RSpec code examples"
task :spec do
  sh "bundle exec rspec spec/exam_spec.rb"
end

task :guard do
  sh "bundle exec guard"
end

task :default => :spec
