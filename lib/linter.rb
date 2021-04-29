require 'colorize'
require_relative '..lib/style_linter'

class Stylint 
  include StyleLinter

  def initialize(file_path) 
    @file_path = file_path
    @error = []
  end

  def check
    column = 0
    File.readlines(@file_path) do |line|
      column += 1
      comment_check(line, column)
      ending_check(line, column)
      colon_space_check(line, column)
      empty_space(line, column)
      unit_check(line, column)
      space_check(line, column)
      start_space_check(line, column)
      start_bracket_check(line, column)
      end_bracket_check(line, column)
    end

  end
end