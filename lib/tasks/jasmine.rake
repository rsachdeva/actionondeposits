require 'guard/jasmine/task'

Guard::JasmineTask.new do |task|
  task.options = '-t 15 -e test'
end

Guard::JasmineTask.new(:jasmine_webrick_server, '-s webrick')


task :default => "guard:jasmine_webrick_server"