class SinatraAppGenerator < RubiGen::Base
  DEFAULT_SHEBANG = File.join(Config::CONFIG['bindir'],
                              Config::CONFIG['ruby_install_name'])

  default_options :namespace => nil,
                  :orm => "Sequel"
  attr_reader :name, :orm

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @destination_root = File.expand_path(args.shift)
    @name = (options[:namespace] || base_name).camelize
    @orm = options[:orm]
  end

  def template(m, filename)
    m.template "#{filename}.erb", filename
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory ''
      BASEDIRS.each { |path| m.directory path }

      # root
      template m, "app.rb"
      template m, "config.ru"
      template m, "Gemfile"
      template m, "Rakefile"

      # cucumber
      m.directory "features/support"
      m.directory "features/step_definitions"
      template m, "features/support/env.rb"
      template m, "features/support/paths.rb"
      template m, "features/step_definitions/web_steps.rb"

      # rspec
      m.directory "spec"
      template m, "spec/spec_helper.rb"
      m.directory "spec/support"
      template m, "spec/support/blueprints.rb"

      # lib
      m.directory "lib"
      template m, "lib/rack_fix.rb"
    end
  end
  
  protected
    def use_sequel?
      @orm.eql?("Sequel")
    end

    def use_mongomapper?
      @orm.eql?("MongoMapper")
    end

    def banner
      <<-EOS
Creates a new Sinatra / Sequel or MongoMapper / RSpec / Cucumber app.

USAGE: #{spec.name} directory_name [options]
EOS
    end
    
    def add_options!(opts)
      opts.separator ''
      opts.separator "#{File.basename($0)} options:"
      opts.on("--namespace my_namespace", "Use a different module name (default is camelized directory_name).") do |o|
        options[:namespace] = o
      end
      opts.on("--orm ORM", ["Sequel", "MongoMapper"], "Specify which ORM to use (Default: Sequel; Possible: Sequel, MongoMapper)") do |o|
        options[:orm] = o
      end
      opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
    end

    # Installation skeleton.  Intermediate directories are automatically
    # created so don't sweat their absence here.
    BASEDIRS = %w(
      lib
      spec
    )
end
