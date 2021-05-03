#!/usr/bin/env ruby
require_relative '../lib/linter'
puts 'Please give the path to the file requiring checking'
stylint = Stylint.new(gets.chomp.to_s)

puts stylint.check
