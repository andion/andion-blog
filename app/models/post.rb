class Post < ActiveRecord::Base
  has_many :comments
  
  #
  # Returns the number of comments of this post
  #
  def number_of_comments
    self.comments.length 
  end
  
end
