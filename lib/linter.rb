require 'colorize'
require_relative('../lib/style_linter')

class Stylint 
  include StyleLinter

  def initialize(file_path) 
    @file_path = file_path
    @error = []
  end

  def check
    column = 0
    File.readlines(@file_path).each do |line|
      column += 1
      comment_check(line, column)
      ending_check(line, column)
      colon_space_check(line, column)
      empty_space_check(line, column)
      unit_check(line, column)
      space_check(line, column)
      start_space_check(line, column)
      start_bracket_check(line, column)
      end_bracket_check(line, column)
    end
    if @errors.length.zero?
      @errors << "All checks have passed. ".green
    else
      @errors.sort {|ele1, ele2| ele1 <=> ele2}
    end

  end
end