# Initial idea and code from work on cucumber-rails by Aslak Hellesøy
# http://github.com/aslakhellesoy/cucumber-rails
module Cucumber
  class Rvm #:nodoc:
    RVMS = YAML.load_file(File.dirname(__FILE__) + '/../../rvm.yml')
    
    class << self
      def each(&proc)
        RVMS["rubies"].each do |ruby_name, ruby_version|
          proc.call(new(ruby_name, RVMS["dev_gems"], nil))
        end
      end
    end

    def initialize(ruby_name, gems_with_version, world)
      @ruby_version, @gems_with_version, @world = RVMS['rubies'][ruby_name], gems_with_version, world
      raise "NO RUBY VERSION FOUND FOR #{ruby_name}. Check your rvms.yml" if @ruby_version.nil?
    end

    begin
      require 'aruba/api'
      include Aruba::Api
    rescue LoadError => ignore
      STDOUT.puts "The aruba gem ins not installed. That's ok." 
      def run(cmd)
        system(cmd)
      end
    end

    def rvm(cmd)
      rvm_cmd = "rvm #{@ruby_version}%sinatra_app_gen #{cmd}"
      if @world
        @world.announce(rvm_cmd)
      else
        puts(rvm_cmd)
      end
      run(rvm_cmd)
      raise "STDOUT:\n#{@last_stdout}\nSTDERR:\n#{@last_stderr}" if @last_exit_status && @last_exit_status != 0
    end

    def install_gems
      @gems_with_version.each do |gem_with_version|
        rvm("-S gem install #{gem_with_version}")
      end
    end
  end
end