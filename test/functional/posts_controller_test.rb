require 'test_helper'

#Este es un comentario

class PostsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_post
    assert_difference('Post.count') do
      post :create, :post => {:title => @normal_post.title, :content => @normal_post.content}
    end
    puts ">>>>>>>>>>>>>>>>>>> #{assigns(:post).id} ###"
    assert_equal @normal_post, assigns(:post)
    assert_redirected_to post_path(assigns(:post).id)
  end

  def test_should_show_post
    get :show, :id => @normal_post.id
    assert_response :success
  end

end
