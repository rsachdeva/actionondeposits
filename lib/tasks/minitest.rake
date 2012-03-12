require "rake/testtask"

Rake::TestTask.new(:spec => "db:test:prepare") do |t|
  t.libs << "spec"
  t.pattern = "spec/**/*_spec.rb"
end

task :default => :spec