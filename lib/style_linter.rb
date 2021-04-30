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
end