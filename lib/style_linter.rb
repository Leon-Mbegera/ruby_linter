require 'colorize'

module StyleLinter

  def comment_check(line, num)
    return unless line.include?('/*')

    @errors << "#{'WARNING'.yellow} :Remove comments on line #{num}.\n"
  end

  
end