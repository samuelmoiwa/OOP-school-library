#!/usr/bin/env ruby
require_relative './app'

file.chomod(0o755)

def main
  app = App.new
  app.run
end

puts main
