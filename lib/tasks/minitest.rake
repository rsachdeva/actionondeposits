require "rake/testtask"


Rake::TestTask.new(:spec => 'db:test:prepare') do |t|
  t.libs << "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end


task :default => :spec
