class SinatraAppGenerator < RubiGen::Base
  DEFAULT_SHEBANG = File.join(Config::CONFIG['bindir'],
                              Config::CONFIG['ruby_install_name'])

  attr_reader :name

  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @destination_root = File.expand_path(args.shift)
    @name = (args.shift || base_name).camelize
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
      template m, "geminstaller.yml"
      template m, "Rakefile"

      # cucumber
      m.directory "features/support"
      m.directory "features/step_definitions"
      template m, "features/support/env.rb"
      template m, "features/support/paths.rb"
      template m, "features/step_definitions/webrat_steps.rb"

      # rspec
      m.directory "spec"
      template m, "spec/spec_helper.rb"

      # lib
      m.directory "lib"
      template m, "lib/rack_fix.rb"
    end
  end

  protected
    def banner
      <<-EOS
Creates a new Sinatra / Sequel / rspec / cucumber app.

USAGE: #{spec.name} directory_name [module_name]

EOS
    end

    # Installation skeleton.  Intermediate directories are automatically
    # created so don't sweat their absence here.
    BASEDIRS = %w(
      lib
      spec
    )
end
