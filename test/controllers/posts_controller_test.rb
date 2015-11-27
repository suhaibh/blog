require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
    @post = posts(:post)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should get show" do
    get :show, id: @post
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create post and redirect to root" do
    assert_difference 'Post.count', 1 do 
      post :create, post: {title: "Title", body: "Body"}
    end
    assert_equal "Post created!", flash[:success]
    assert_redirected_to root_path
  end

  test "should edit" do
    patch :update, id: @post, post: {title: @post.title, body: @post.body}
    assert_equal "Post updated!", flash[:success]
    assert_redirected_to post_path(@post)
  end

  test "should render edit when incorrect information submitted" do
    patch :update, id: @post, post: {title: "", body: ""}
    assert_template :edit
  end  

  test "should render new with invalid information" do
    get :new
    post :create, post: {title: "", body: ""}
    assert_template "posts/new"
  end

  test "should delete post" do
    assert_difference "Post.count", -1 do 
      delete :destroy, id: @post
    end
    assert_redirected_to root_path
    assert_equal "Post deleted!", flash[:danger]
  end
end
