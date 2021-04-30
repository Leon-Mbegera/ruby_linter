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

  
end