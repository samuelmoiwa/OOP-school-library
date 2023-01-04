#!/usr/bin/env ruby
require_relative './app'

file = 'main.rb'

File.chmod(0o755, file)

def main
  app = App.new
  app.run
end

puts main
