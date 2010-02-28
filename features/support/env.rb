begin
  require "aruba"
  require "rspec/expectations"
rescue => e
  puts "ERROR : #{e.inspect}"
end

class SinatraAppGenWorld
  include Rspec::Matchers
end

World { SinatraAppGenWorld.new }