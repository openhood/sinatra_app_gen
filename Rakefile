require "rubygems"
require "rake"

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.version = "0.2.1"
    gem.name = "sinatra_app_gen"
    gem.summary = "Creates a new Sinatra / Sequel or MongoMapper / RSpec / Cucumber / Bundler app."
    gem.description = "Our default app template"
    gem.email = "team@openhood.com"
    gem.homepage = "http://github.com/openhood/sinatra_app_gen"
    gem.authors = ["Jonathan Tron", "Joseph Halter"]
    gem.add_dependency "rubigen"
    gem.add_development_dependency "jeweler"
    gem.add_development_dependency "cucumber", ">= 0.6.2"
    gem.add_development_dependency "rspec", ">= 2.0.0a"
    gem.add_development_dependency "aruba", ">= 0.1.6"
    gem.add_development_dependency "bundler", ">= 0.9.9"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

begin
  require "cucumber/rake/task"
  Cucumber::Rake::Task.new
  task :cucumber => :check_dependencies
  
  require "lib/cucumber/rvm"
  namespace :rvm do
    desc "Install all gemsets"
    task :install_gems do
      Cucumber::Rvm.each do |rvm|
        rvm.install_gems
      end
    end
  end
rescue LoadError
  raise "ERROR: #{$!}"
  task :cucumber do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end
 
task :default => :cucumber
