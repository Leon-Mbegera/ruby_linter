require 'colorize'
require_relative('../lib/style_linter')

class Stylint
  include StyleLinter

  def initialize(file_path)
    @file_path = file_path
    @errors = []
  end

  def check
    num = 0
    File.readlines(@file_path).each do |line|
      num += 1
      comment_check(line, num)
      ending_check(line, num)
      colon_space_check(line, num)
      empty_space_check(line, num)
      unit_check(line, num)
      space_check(line, num)
      start_space_check(line, num)
      start_bracket_check(line, num)
      end_bracket_check(line, num)
    end
    if @errors.length.zero?
      @errors << 'All checks have passed. '.green
    else
      @errors.sort { |el1, el2| el2 <=> el1 }
    end
  end
end
