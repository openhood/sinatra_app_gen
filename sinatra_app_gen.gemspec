# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra_app_gen}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jonathan Tron", "Joseph Halter"]
  s.date = %q{2009-08-27}
  s.default_executable = %q{sinatra_app}
  s.description = %q{Our default app template}
  s.email = %q{team@openhood.com}
  s.executables = ["sinatra_app"]
  s.files = [
    "Rakefile",
    "VERSION.yml",
    "bin/sinatra_app",
    "lib/generators/sinatra_app/sinatra_app_generator.rb",
    "lib/generators/sinatra_app/templates/Rakefile.erb",
    "lib/generators/sinatra_app/templates/app.rb.erb",
    "lib/generators/sinatra_app/templates/config.ru.erb",
    "lib/generators/sinatra_app/templates/features/step_definitions/webrat_steps.rb.erb",
    "lib/generators/sinatra_app/templates/features/support/env.rb.erb",
    "lib/generators/sinatra_app/templates/features/support/paths.rb.erb",
    "lib/generators/sinatra_app/templates/geminstaller.yml.erb",
    "lib/generators/sinatra_app/templates/lib/rack_fix.rb.erb",
    "lib/generators/sinatra_app/templates/spec/spec_helper.rb.erb"
  ]
  s.homepage = %q{http://github.com/openhood/sinatra_app_gen}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Creates a new Sinatra / Sequel / rspec / cucumber app.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, ["~> 1.2.6"])
      s.add_runtime_dependency(%q<cucumber>, ["~> 0.3.97"])
      s.add_runtime_dependency(%q<sequel>, [">= 3.2.0"])
    else
      s.add_dependency(%q<rspec>, ["~> 1.2.6"])
      s.add_dependency(%q<cucumber>, ["~> 0.3.97"])
      s.add_dependency(%q<sequel>, [">= 3.2.0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 1.2.6"])
    s.add_dependency(%q<cucumber>, ["~> 0.3.97"])
    s.add_dependency(%q<sequel>, [">= 3.2.0"])
  end
end
