module PostsHelper
  
  #
  # Returns a string telling the number of comments or 'None comments'
  #
  def number_of_comments(post)
    post.number_of_comments > 0 ? "#{post.number_of_comments} comments" : 'Comment this post'
  end
end
