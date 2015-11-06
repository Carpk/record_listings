require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :rspec => :spec

task :run do
  ruby "bin/record_list"
end

task :server do
  exec("rackup bin/config.ru")
end
