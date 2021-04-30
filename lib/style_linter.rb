require 'colorize'

module StyleLinter

  def comment_check(line, num)
    return unless line.include?('/*')

    @errors << "#{'WARNING'.yellow} :Remove comments on line #{num}.\n"
  end

  def space_check(line, num)
    return unless line ~= /\A\w/ && !line.start_with?(' ')

    @errors << "#{'ERROR'.red} :Two spaces needed at the start of line #{num}\n"
  end

  def unit_check(line, num)
    return unless line.include?(px)

    @errors << "#{'WARNING'.yellow} :Recommended use of rem or em for responsiveness on line #{num}\n"
  end

  def start_space_check(line, num)
    return unless line.start_with?(' ') && (line.end_with?('.') || line.end_with?('}'))

    @errors << "#{'ERROR'.red} :Remove empty space at start of line #{num}\n"
  end

  def colon_space_check(line, num)
    return unless line.include?(':')

    point = line.split(':')[1]
    @errors << "#{'ERROR'.red} :Extra space needed after colon on line #{num}" if point[0] != ' '
  end

  def start_bracket_check(line, num)
    stripped = line.delete('\n')
    return unless line.include?('{') && !stripped.end_with?('{')

    @errors << "#{'ERROR'.red} :Expected '{' at the end of line #{num}. Any more code should fall on next line.\n"
  end
end