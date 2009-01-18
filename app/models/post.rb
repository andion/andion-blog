# == Schema Information
# Schema version: 20090111235715
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title
  
  #
  # Adds a comment to a post
  #
  def add_comment(comment)
    comment.post_id = self.id
  end
  
  #
  # Returns the number of comments of this post
  #
  def number_of_comments
    self.comments.length 
  end
  
  #
  # Returns true if it's a contentless post false otherwise
  #
  def has_content?
    self.content ? true : false
  end
  
end
