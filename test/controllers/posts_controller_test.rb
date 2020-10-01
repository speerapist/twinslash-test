require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_path
    assert_response :success
  end

  test 'should get new' do
    get new_post_path
    assert_response :redirect
  end

  test 'should get create' do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { title: "Egor", content: "Egorov" } }
    end
    assert_redirected_to main_app.root_path
  end

  test 'should get edit' do
    get edit_post_path(@post)
    assert_response :redirect
  end

  test 'should get destroy' do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to main_app.root_path
  end

  test 'should get update' do
    put post_path(@post)
    assert_response :redirect
  end
end
