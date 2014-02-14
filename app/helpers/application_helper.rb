module ApplicationHelper

  def print_comments(comment, tab=0)
    puts "\t"*tab + comment.body
    unless comment.comments.blank?
      tab += 1
      comment.comments.each do |c|
        print_comments(c, tab)
      end
    end
    nil
  end
  
end
