require "rubygems"
require "rake"

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "sinatra_app_gen"
    gem.summary = "Creates a new Sinatra / Sequel / rspec / cucumber app."
    gem.description = "Our default app template"
    gem.email = "team@openhood.com"
    gem.homepage = "http://github.com/openhood/sinatra_app_gen"
    gem.authors = ["Jonathan Tron", "Joseph Halter"]
    gem.add_dependency "rubigen"
    gem.add_dependency "rspec", "~> 1.2.6"
    gem.add_dependency "cucumber", "~> 0.3.97"
    gem.add_dependency "sequel", ">= 3.2.0"
    gem.add_development_dependency "jeweler"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end