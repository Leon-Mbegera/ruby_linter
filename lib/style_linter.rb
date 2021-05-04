require 'colorize'

module StyleLinter
  def comment_check(line, num)
    return unless line.include?('/*')

    @errors << "#{'WARNING'.yellow} :Remove comments on line #{num}.\n"
  end

  def space_check(line, num)
    return unless line =~ /\A\w/ && !line.start_with?('  ')

    @errors << "#{'ERROR'.red} :Two spaces needed at the start of line #{num}\n"
  end

  def unit_check(line, num)
    return unless line.include?('px')

    @errors << "#{'WARNING'.yellow} :Recommended use of rem or em for responsiveness on line #{num}\n"
  end

  def start_space_check(line, num)
    @errors << "#{'ERROR'.red}  :Remove empty space at start of line #{num}\n " if line.start_with?(' ') && (line.include?('.') || line.include?('}'))
  end

  def colon_space_check(line, num)
    return unless line.include?(':')

    point = line.split(':')[1]
    @errors << "#{'ERROR'.red} :Extra space needed after colon on line #{num}\n" if point[0] != ' '
  end

  def start_bracket_check(line, num)
    stripped = line.delete("\n")
    return unless line.include?('{') && !stripped.end_with?('{')

    @errors << "#{'ERROR'.red} :Expected '{' at the end of line #{num}. Any more code should fall on next line.\n"
  end

  def end_bracket_check(line, num)
    stripped = line.delete("\n")
    return unless line.include?('}') && !stripped.end_with?('}')

    @errors << "#{'ERROR'.red} :Expected '}' at the end of line #{num}\n"
  end

  def empty_space_check(line, num)
    stripped = line.delete("\n")
    @errors << "#{'ERROR'.red}  :Remove trailing spaces at end of line #{num}\n" if stripped.end_with?(' ')
  end

  def ending_check(line, num)
    if line.include?(':') && !line.include?(';')
      @errors << "#{'ERROR'.red} :Expected ; at the end of rule on line #{num}\n"
    elsif line.include?(';') && !line.include?(':')
      @errors << "#{'ERROR'.red} :Expected : at the end of attribute declaration on line #{num}\n"
    end
  end
end
