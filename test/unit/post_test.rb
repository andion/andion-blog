require 'test_helper'

class PostTest < ActiveSupport::TestCase

  #
  # Test if we can add a post
  #
  def test_add_post
    c = Post.count
    Post.create(:title => @post.title, :content => @post.content)
    assert_equal(Post.count, c + 1)
  end
  
  #
  # Test if the order is correct (from newest to oldest)
  #
  def test_ordered
    posts = Post.all
    assert_equal(Post.ordered, posts.sort {|a,b| b.created_at <=> a.created_at})
  end

end
