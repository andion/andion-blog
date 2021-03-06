require 'test_helper'

class PostTest < ActiveSupport::TestCase


  #
  # Test post title empty check
  #
  def test_validates_presence_of    
    assert_not_valid(Post.new)
    assert @normal_post.valid?
  end
  
  #
  # Test +has_content+ method to return false if a post have no content
  #
  def test_has_content
    assert(!@contentless_post.has_content?)
  end
  
  #
  # Test if we can add a post
  #
  def test_add_post
    c = Post.count
    Post.create(:title => @normal_post.title, :content => @normal_post.content)
    assert_equal(c + 1, Post.count)
  end
  
  #
  # Test if we can add a comment to a post
  #
   def test_add_comment_to_post
     nc = @normal_post.number_of_comments
     @normal_post.comments << @comment
     assert_equal(nc + 1, @normal_post.number_of_comments)
   end
  
  #
  # Test if the order is correct (from newest to oldest)
  #
  def test_ordered
    posts = Post.all
    assert_equal(Post.ordered, posts.sort {|a,b| b.created_at <=> a.created_at})
  end

end
