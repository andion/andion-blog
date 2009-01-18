require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  #
  # Test comment validation. A comment must have content
  # And must be blameless.
  #
  def test_validates_presence_of    
    assert_not_valid(Comment.new)
    assert_not_valid(@blaming_comment)
    assert_valid(@comment)
  end
  
  #
  # Test comment content empty check
  #
  def invalid_comment_with_empty_content
    c = Comment.new(:author => @comment.author)
    assert_valid(c)
  end
  
  
  #
  # Test if we can create a comment
  #
  def test_add_comment
    c = Comment.count
    Comment.create(:author => @comment.author, :content => @comment.content)
    assert_equal(Comment.count, c + 1)
  end
  
  #
  # Test if the order is correct (from OLDEST to NEWEST)
  #
  def test_ordered
    comments = Comment.all
    assert_equal(Comment.ordered, comments.sort {|a,b| a.created_at <=> b.created_at})
  end
end